import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:SnipSnap/blocs/cities/cities_bloc.dart';
import 'package:SnipSnap/configs/app_globals.dart';
import 'package:SnipSnap/configs/constants.dart';
import 'package:SnipSnap/data/models/city_model.dart';
import 'package:SnipSnap/generated/l10n.dart';
import 'package:SnipSnap/main.dart';
import 'package:SnipSnap/widgets/jumbotron.dart';
import 'package:SnipSnap/widgets/list_item.dart';
import 'package:SnipSnap/widgets/loading_overlay.dart';
import 'package:SnipSnap/utils/text_style.dart';
import 'package:sprintf/sprintf.dart';

class SearchCitiesDelegate extends SearchDelegate<CityModel> {
  SearchCitiesDelegate({
    this.citiesBloc,
    this.hintText,
    this.myLocation,
  }) : super(searchFieldLabel: hintText);

  final Bloc<CitiesEvent, CitiesState> citiesBloc;
  final String hintText;
  final CityModel myLocation;

  List<CityModel> _cities = <CityModel>[];

  @override
  List<Widget> buildActions(BuildContext context) {
    if (query.isNotEmpty) {
      return <Widget>[
        IconButton(
          icon: const Icon(Icons.clear),
          onPressed: () {
            query = '';
            showSuggestions(context);
          },
        ),
      ];
    }
    return null;
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(
        getIt.get<AppGlobals>().isRTL
            ? Icons.keyboard_arrow_right
            : Icons.keyboard_arrow_left,
        size: 38,
      ),
      onPressed: () => close(context, null),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    citiesBloc.add(SearchRequestedCitiesEvent(query));

    ///show suggested queries based on past queries or the current context.
    if (query.isNotEmpty) {
      return BlocBuilder<CitiesBloc, CitiesState>(
        builder: (BuildContext context, CitiesState state) {
          if (state is LoadCitiesSuccessState) {
            _cities = state.cities;
          }
          return LoadingOverlay(
            isLoading: state is LoadCitiesInProgressState,
            child: _buildList(context),
          );
        },
      );
    }

    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsetsDirectional.only(
              start: kPaddingM, end: kPaddingM),
          child: ListItem(
            leading: const Icon(
              Icons.near_me,
              color: kPrimaryColor,
            ),
            title: L10n.of(context).searchLabelNearby,
            onPressed: () => close(context, myLocation),
          ),
        ),
      ],
    );
  }

  @override
  ThemeData appBarTheme(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return theme.copyWith(
      primaryColor: theme.appBarTheme.color,
      primaryIconTheme: theme.primaryIconTheme,
      primaryColorBrightness: Brightness.dark,
      primaryTextTheme:
          theme.textTheme.copyWith(headline6: theme.textTheme.headline6.white),
      cursorColor: kWhite,
      textTheme:
          theme.textTheme.copyWith(headline6: theme.textTheme.headline6.white),
      inputDecorationTheme: theme.inputDecorationTheme.copyWith(
        hintStyle: const TextStyle(color: Colors.white54),
      ),
    );
  }

  Widget _buildList(BuildContext context) {
    if (_cities.isEmpty) {
      return Center(
        child: Jumbotron(
          title: L10n.of(context).searchTitleNoResults,
          icon: Icons.not_listed_location,
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsetsDirectional.only(
        start: kPaddingM,
        end: kPaddingM,
        top: 5,
      ),
      itemCount: _cities.length,
      itemBuilder: (BuildContext context, int index) {
        return ListItem(
          leading: Icon(
            Icons.near_me,
            color: Theme.of(context).disabledColor,
          ),
          title: sprintf(
              '%s, %s', <String>[_cities[index].name, _cities[index].state]),
          onPressed: () => close(context, _cities[index]),
        );
      },
    );
  }
}
