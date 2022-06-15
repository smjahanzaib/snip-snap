import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:SnipSnap/blocs/search/search_bloc.dart';
import 'package:SnipSnap/configs/constants.dart';
import 'package:SnipSnap/data/models/location_model.dart';
import 'package:SnipSnap/data/models/search_session_model.dart';
import 'package:SnipSnap/generated/l10n.dart';
import 'package:SnipSnap/widgets/jumbotron.dart';
import 'package:SnipSnap/widgets/location_list_item.dart';

class SearchLocationsDelegateResultList extends StatefulWidget {
  const SearchLocationsDelegateResultList({Key key, this.query})
      : super(key: key);

  final String query;

  @override
  _SearchLocationsDelegateResultListState createState() {
    return _SearchLocationsDelegateResultListState();
  }
}

class _SearchLocationsDelegateResultListState
    extends State<SearchLocationsDelegateResultList> {
  SearchBloc _searchBloc;

  List<LocationModel> _locations;

  @override
  void initState() {
    _searchBloc = BlocProvider.of<SearchBloc>(context);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final String q = widget.query.trim();

    _searchBloc.add(QuickSearchRequestedSearchEvent(q));

    return BlocBuilder<SearchBloc, SearchState>(
      builder: (BuildContext context, SearchState state) {
        if (state is RefreshSuccessSearchState &&
            state.session.searchType == SearchType.quick) {
          if (state.session.isLoading) {
            return const Center(
              child: SizedBox(
                width: 26,
                height: 26,
                child: CircularProgressIndicator(strokeWidth: 2),
              ),
            );
          } else {
            if (q.length >= kMinimalNameQueryLength) {
              _locations = state.session.locations;
              if (_locations.isEmpty) {
                return Center(
                  child: Jumbotron(
                    title: L10n.of(context).searchTitleNoResults,
                    icon: Icons.not_listed_location,
                  ),
                );
              }

              return ListView.builder(
                padding: const EdgeInsets.only(
                    left: kPaddingM, right: kPaddingM, top: 5),
                itemCount: _locations.length,
                itemBuilder: (BuildContext context, int index) {
                  return LocationListItem(
                    location: _locations[index],
                    viewType: LocationListItemViewType.search,
                    wordToStyle: q,
                  );
                },
              );
            }
          }
        }

        // if (_locations != null) {
        //   _locations.branches.clear();
        // }

        return Container();
      },
    );
  }
}
