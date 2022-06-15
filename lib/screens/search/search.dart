import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:SnipSnap/blocs/search/search_bloc.dart';
import 'package:SnipSnap/configs/app_globals.dart';
import 'package:SnipSnap/configs/constants.dart';
import 'package:SnipSnap/configs/routes.dart';
import 'package:SnipSnap/data/models/category_model.dart';
import 'package:SnipSnap/data/models/city_model.dart';
import 'package:SnipSnap/data/models/location_model.dart';
import 'package:SnipSnap/data/models/search_session_model.dart';
import 'package:SnipSnap/data/models/search_tab_model.dart';
import 'package:SnipSnap/data/models/toolbar_option_model.dart';
import 'package:SnipSnap/generated/l10n.dart';
import 'package:SnipSnap/main.dart';
import 'package:SnipSnap/screens/search/widgets/search_filter_drawer.dart';
import 'package:SnipSnap/screens/search/widgets/search_form.dart';
import 'package:SnipSnap/screens/search/widgets/search_header.dart';
import 'package:SnipSnap/screens/search/widgets/search_list_toolbar.dart';
import 'package:SnipSnap/screens/search/widgets/search_locations_delegate.dart';
import 'package:SnipSnap/screens/search/widgets/search_result_list.dart';
import 'package:SnipSnap/screens/search/widgets/search_result_title.dart';
import 'package:SnipSnap/screens/search/widgets/search_tabs.dart';
import 'package:SnipSnap/widgets/full_screen_indicator.dart';
import 'package:SnipSnap/widgets/jumbotron.dart';
import 'package:SnipSnap/widgets/loading_overlay.dart';
import 'package:SnipSnap/widgets/location_list_item.dart';
import 'package:SnipSnap/utils/list.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key key}) : super(key: key);

  @override
  SearchScreenState createState() => SearchScreenState();
}

class SearchScreenState extends State<SearchScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final ScrollController _customScrollViewController = ScrollController();

  /// Faking user's position as a CityModel
  /// ignore: prefer_const_literals_to_create_immutables
  final CityModel _myLocation = CityModel.fromJson(<String, dynamic>{
    'city_id': '',
    'city_name': '',
  });

  List<SearchTabModel> categoryTabs = <SearchTabModel>[];

  SearchBloc _searchBloc;

  /// Search sort types.
  List<ToolbarOptionModel> searchSortTypes;

  /// Search list types.
  List<ToolbarOptionModel> searchListTypes;

  /// Search filter by gender.
  List<ToolbarOptionModel> searchGenderFilter;

  @override
  void initState() {
    super.initState();
    _searchBloc = BlocProvider.of<SearchBloc>(context);

    getIt.get<AppGlobals>().globalKeySearchTabs = GlobalKey<SearchTabsState>();

    _initGlobals();
  }

  /// Init globals that require access to BuildContext for translation.
  void _initGlobals() {
    searchSortTypes = <dynamic>[
      <String, dynamic>{
        'code': 'distance',
        'label': L10n.current.commonSearchSortTypeDistance,
        'icon': Icons.directions_car,
      },
      <String, dynamic>{
        'code': 'rating',
        'label': L10n.current.commonSearchSortTypeRating,
        'icon': Icons.star,
      },
      <String, dynamic>{
        'code': 'popularity',
        'label': L10n.current.commonSearchSortTypePopularity,
        'icon': Icons.remove_red_eye,
      },
      <String, dynamic>{
        'code': 'price',
        'label': L10n.current.commonSearchSortTypePrice,
        'icon': Icons.attach_money,
      },
    ]
        .map((dynamic item) =>
            ToolbarOptionModel.fromJson(item as Map<String, dynamic>))
        .toList();

    searchListTypes = <dynamic>[
      <String, dynamic>{
        'code': describeEnum(LocationListItemViewType.list),
        'label': '',
        'icon': Icons.view_list,
      },
      <String, dynamic>{
        'code': describeEnum(LocationListItemViewType.grid),
        'label': '',
        'icon': Icons.view_quilt,
      },
      <String, dynamic>{
        'code': describeEnum(LocationListItemViewType.block),
        'label': '',
        'icon': Icons.view_array,
      },
    ]
        .map((dynamic item) =>
            ToolbarOptionModel.fromJson(item as Map<String, dynamic>))
        .toList();

    searchGenderFilter = <dynamic>[
      <String, dynamic>{
        'code': describeEnum(LocationGenderSpecification.unisex),
        'label': L10n.current.commonGendersUnisex,
        'icon': Icons.view_list,
      },
      <String, dynamic>{
        'code': describeEnum(LocationGenderSpecification.men),
        'label': L10n.current.commonGendersMen,
        'icon': Icons.view_quilt,
      },
      <String, dynamic>{
        'code': describeEnum(LocationGenderSpecification.women),
        'label': L10n.current.commonGendersWomen,
        'icon': Icons.view_array,
      },
    ]
        .map((dynamic item) =>
            ToolbarOptionModel.fromJson(item as Map<String, dynamic>))
        .toList();

    /// First tab in the list is ALL (categories).
    categoryTabs.add(SearchTabModel.fromJson(<String, dynamic>{
      'id': 0,
      'globalKey': GlobalKey(debugLabel: 'searchTab_all'),
      'label': L10n.current.searchLabelAll,
    }));

    /// Other tabs in the list will be added from the location category list.
    for (final CategoryModel category in getIt.get<AppGlobals>().categories) {
      categoryTabs.add(SearchTabModel.fromJson(<String, dynamic>{
        'id': category.id,
        'globalKey':
            GlobalKey(debugLabel: 'categoryTab_' + category.id.toString()),
        'label': category.title,
      }));
    }

    /// Initialize the search session.
    _searchBloc.add(SessionInitedSearchEvent(
      selectedCity: _myLocation,
      activeSearchTab: categoryTabs.first.id,
      currentSort: searchSortTypes.first, // default is the first one
      currentListType: searchListTypes.first, // default is the first one
      currentGenderFilter: searchGenderFilter.first, // default is the first one
    ));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBloc, SearchState>(
      buildWhen: (SearchState previousState, SearchState currentState) {
        /// Return true/false to determine whether or not to rebuild the widget
        /// with state.
        return currentState is InitialSearchState ||
            (currentState is RefreshSuccessSearchState &&
                currentState.session.searchType == SearchType.full);
      },
      builder: (BuildContext context, SearchState state) {
        // While the screen state is initializing we shall show a full screen
        // progress indicator and init the search session.
        if (state is InitialSearchState) {
          // Show the full screen indicator until we return here.
          return FullScreenIndicator(
            color: Theme.of(context).cardColor,
            backgroundColor: Theme.of(context).cardColor,
          );
        }

        /// Session is initialized and/or refreshed.
        final SearchSessionModel session =
            (state as RefreshSuccessSearchState).session;

        /// Lets see what's in it and show the results on the screen.
        return AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle.light,
          child: Scaffold(
            key: _scaffoldKey,
            endDrawerEnableOpenDragGesture: false,
            endDrawer: SearchFilterDrawer(),
            body: Container(
              color: Theme.of(context).appBarTheme.color,
              child: SafeArea(
                child: Container(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  child: LoadingOverlay(
                    isLoading: session.isLoading,
                    child: CustomScrollView(
                      controller: _customScrollViewController,
                      slivers: <Widget>[
                        SliverPersistentHeader(
                          delegate: SearchHeader(
                            expandedHeight: 76,
                            onPressed: () => _quickSearch(session),
                            label: session.q,
                          ),
                          pinned: true,
                        ),
                        SliverAppBar(
                          primary: true,
                          floating: true,
                          flexibleSpace: SearchForm(
                            selectedDateRange: session.selectedDateRange,
                            selectedCity: session.selectedCity,
                            myLocation: _myLocation,
                          ),
                          actions: <Widget>[
                            Container()
                          ], // remove the hamburger menu
                          leading: Container(), // remove back button
                        ),
                        SliverAppBar(
                          primary: false,
                          floating: true,
                          flexibleSpace: SearchTabs(
                            key: getIt.get<AppGlobals>().globalKeySearchTabs,
                            searchTabs: categoryTabs,
                            activeSearchTab: session.activeSearchTab,
                          ),
                          actions: <Widget>[
                            Container()
                          ], // remove the hamburger menu
                          leading: Container(), // remove back button
                        ),
                        SliverList(
                          delegate: SliverChildListDelegate(<Widget>[
                            if (session.locations.isNotNullOrEmpty)
                              SearchListToolbar(
                                searchSortTypes: searchSortTypes,
                                searchGenderTypes: searchGenderFilter,
                                currentSort: session.currentSort,
                                currentGenderFilter:
                                    session.currentGenderFilter,
                                onFilterTap: () =>
                                    _scaffoldKey.currentState.openEndDrawer(),
                                onSortChange: (ToolbarOptionModel newSort) =>
                                    _searchBloc.add(
                                        SortOrderChangedSearchEvent(newSort)),
                                onGenderFilterChange:
                                    (ToolbarOptionModel newGenderFilter) =>
                                        _searchBloc.add(
                                            GenderFilterChangedSearchEvent(
                                                newGenderFilter)),
                              ),
                            if (getIt.get<AppGlobals>().currentPosition ==
                                    null &&
                                session.selectedCity.id.isEmpty)
                              Jumbotron(
                                title: L10n.of(context)
                                    .searchTitleLocationServiceDisabled,
                                icon: Icons.gps_off,
                              ),
                            SearchResultTitle(
                              locations: session.locations,
                              currentListType: session.currentListType,
                              searchListTypes: searchListTypes,
                              onListTypeChange: (ToolbarOptionModel
                                      newListType) =>
                                  _searchBloc.add(
                                      ListTypeChangedSearchEvent(newListType)),
                            ),
                            SearchResultList(
                              locations: session.locations,
                              currentListType: session.currentListType,
                            ),
                          ]),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            floatingActionButton: Visibility(
              visible: !session.isLoading && session.locations.isNotNullOrEmpty,
              child: FloatingActionButton(
                tooltip: L10n.of(context).searchTooltipMap,
                elevation: 3,
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    Routes.searchMap,
                    arguments: <String, dynamic>{
                      'locations': session.locations
                    },
                  );
                },
                child: const Icon(Icons.map, color: kWhite),
                backgroundColor: kPrimaryColor,
              ),
            ),
          ),
        );
      },
    );
  }

  Future<String> _quickSearch(SearchSessionModel session) async {
    final String queryString = await showSearch(
      context: context,
      delegate: SearchLocationsDelegate(
          hintText: L10n.of(context).searchPlaceholderQuickSearchLocations),
      query: session.q,
    );

    if (queryString == null) {
      _searchBloc.add(FilteredListRequestedSearchEvent());
    } else {
      _searchBloc.add(KeywordChangedSearchEvent(queryString));
    }

    return queryString;
  }
}
