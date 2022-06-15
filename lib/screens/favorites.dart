import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:SnipSnap/blocs/favorites/favorites_bloc.dart';
import 'package:SnipSnap/configs/app_globals.dart';
import 'package:SnipSnap/configs/constants.dart';
import 'package:SnipSnap/data/models/location_model.dart';
import 'package:SnipSnap/generated/l10n.dart';
import 'package:SnipSnap/main.dart';
import 'package:SnipSnap/utils/bottom_bar_items.dart';
import 'package:SnipSnap/utils/list.dart';
import 'package:SnipSnap/widgets/jumbotron.dart';
import 'package:SnipSnap/widgets/loading_overlay.dart';
import 'package:SnipSnap/widgets/location_list_item.dart';
import 'package:SnipSnap/widgets/strut_text.dart';
import 'package:SnipSnap/widgets/theme_button.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({Key key}) : super(key: key);

  @override
  _FavoritesScreenState createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  /// The GlobalKey needed to animate the list.
  final GlobalKey<AnimatedListState> _listKey = GlobalKey();

  /// The GlobalKey needed to access Scaffold widget.
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  /// Manage state of modal progress HUD widget.
  bool _isLoading = false;
  bool _isInited = false;

  List<LocationModel> _favorites;

  @override
  void initState() {
    super.initState();

    _loadFavorites();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoritesBloc, FavoritesState>(
      builder: (BuildContext context, FavoritesState state) {
        return BlocListener<FavoritesBloc, FavoritesState>(
          listener: (BuildContext context, FavoritesState state) {
            if (state is LoadSuccessFavoritesState) {
              if (_isInited) {
                if (_favorites.isNotNullOrEmpty) {
                  _clearList();
                }

                _favorites = state.favorites;

                for (int offset = 0; offset < _favorites.length; offset++) {
                  _listKey.currentState.insertItem(offset);
                }
              } else {
                _favorites = state.favorites;
              }

              setState(() {
                _isLoading = false;
                _isInited = true;
              });
            }
          },
          child: Scaffold(
            key: _scaffoldKey,
            appBar: AppBar(
              centerTitle: true,
              title: Text(L10n.of(context).favoritesTitle),
              actions: <Widget>[
                IconButton(
                  icon: const Icon(Icons.refresh),
                  tooltip: L10n.of(context).commonTooltipRefresh,
                  onPressed: _loadFavorites,
                ),
              ],
            ),
            body: LoadingOverlay(
              isLoading: _isLoading,
              child: _showFavorites(),
            ),
          ),
        );
      },
    );
  }

  void _loadFavorites() {
    setState(() => _isLoading = true);

    BlocProvider.of<FavoritesBloc>(context).add(DataLoadedFavoritesEvent());
  }

  Widget _showFavorites() {
    if (!_isInited && _favorites == null) {
      return Container();
    }

    if (_favorites.isNotNullOrEmpty) {
      return AnimatedList(
        key: _listKey,
        initialItemCount: _favorites.length,
        itemBuilder:
            (BuildContext context, int index, Animation<double> animation) =>
                _buildItem(_favorites[index], animation),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 3 * kPaddingM),
          child: Column(
            children: <Widget>[
              Jumbotron(
                title: L10n.of(context).favoritesTitleNoResults.toUpperCase(),
                icon: Icons.favorite_border,
                padding: EdgeInsets.zero,
              ),
              StrutText(
                L10n.of(context).favoritesNoResults,
                style: Theme.of(context)
                    .textTheme
                    .subtitle1
                    .copyWith(color: Theme.of(context).disabledColor),
                textAlign: TextAlign.center,
              ),
              const Padding(padding: EdgeInsets.only(top: kPaddingM)),
              ThemeButton(
                text: L10n.of(context).appointmentsBtnExplore,
                onPressed: () {
                  (getIt.get<AppGlobals>().globalKeyBottomBar.currentWidget
                          as BottomNavigationBar)
                      .onTap(getIt
                          .get<BottomBarItems>()
                          .getBottomBarItem('explore'));
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildItem(LocationModel location, Animation<double> animation) {
    return FadeTransition(
      opacity: animation,
      child: Container(
        padding: const EdgeInsets.symmetric(
            vertical: kPaddingS, horizontal: kPaddingM),
        child: LocationListItem(
          location: location,
          viewType: LocationListItemViewType.block,
          showFavoriteButton: true,
          isFavorited: true,
          onFavoriteButtonPressed: () => _removeFromList(location),
        ),
      ),
    );
  }

  void _clearList() {
    for (int i = _favorites.length - 1; i >= 0; i--) {
      final AnimatedListRemovedItemBuilder builder =
          (BuildContext context, Animation<double> animation) => Container();
      _listKey.currentState.removeItem(i, builder);
    }
  }

  void _removeFromList(LocationModel location) {
    final int removeIndex = _favorites.indexOf(location);

    _favorites.remove(location);

    // This builder is just so that the animation has something to work with
    // before it disappears from view since the original has already been
    // deleted.
    final AnimatedListRemovedItemBuilder builder =
        (BuildContext context, Animation<double> animation) =>
            _buildItem(location, animation);

    _listKey.currentState.removeItem(removeIndex, builder);

    _scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text(L10n.of(context).commonLocationUnfavorited),
      duration: const Duration(milliseconds: kSnackBarDurationShort),
    ));

    // Show jumbotron for empty list.
    if (_favorites.isEmpty) {
      setState(() => _isInited = false);
    }
  }
}
