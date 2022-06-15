import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:SnipSnap/configs/constants.dart';
import 'package:SnipSnap/data/models/city_model.dart';
import 'package:SnipSnap/data/models/location_model.dart';
import 'package:SnipSnap/data/models/search_session_model.dart';
import 'package:SnipSnap/data/models/toolbar_option_model.dart';
import 'package:SnipSnap/data/repositories/location_repository.dart';
import 'package:SnipSnap/utils/geo.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc() : super(InitialSearchState());

  @override
  Stream<SearchState> mapEventToState(SearchEvent event) async* {
    if (event is SessionInitedSearchEvent) {
      yield* _mapInitSessionSearchEventToState(event);
    } else if (event is FilteredListRequestedSearchEvent) {
      yield* _mapFilteredSearchEventToState(event);
    } else if (event is CategoryFilteredSearchEvent) {
      yield* _mapCategoryFilteredSearchEventToState(event);
    } else if (event is ListTypeChangedSearchEvent) {
      yield* _mapListTypeSearchEventToState(event);
    } else if (event is SortOrderChangedSearchEvent) {
      yield* _mapSortOrderSearchEventToState(event);
    } else if (event is GenderFilterChangedSearchEvent) {
      yield* _mapGenderFilterSearchEventToState(event);
    } else if (event is CitySelectedSearchEvent) {
      yield* _mapCitySelectedSearchEventToState(event);
    } else if (event is NewDateRangeSelectedSearchEvent) {
      yield* _mapNewDateRangeSearchEventToState(event);
    } else if (event is KeywordChangedSearchEvent) {
      yield* _mapKeywordSearchEventToState(event);
    } else if (event is QuickSearchRequestedSearchEvent) {
      yield* _mapQuickSearchEventToState(event);
    } else if (event is MapSearchEvent) {
      yield* _mapMapSearchEventToState(event);
    }
  }

  Stream<SearchState> _mapInitSessionSearchEventToState(
      SessionInitedSearchEvent event) async* {
    yield RefreshSuccessSearchState(
      SearchSessionModel(
        selectedCity: event.selectedCity,
        currentSort: event.currentSort,
        currentListType: event.currentListType,
        currentGenderFilter: event.currentGenderFilter,
        activeSearchTab: event.activeSearchTab,
        searchType: SearchType.full,
      ),
    );

    //if ((event.selectedCity.id.isEmpty && getIt.get<AppGlobals>().currentPosition != null) || event.selectedCity.id.isNotEmpty) {
    add(FilteredListRequestedSearchEvent());
    //}
  }

  Stream<SearchState> _mapFilteredSearchEventToState(
      FilteredListRequestedSearchEvent event) async* {
    if (state is RefreshSuccessSearchState) {
      final SearchSessionModel session =
          (state as RefreshSuccessSearchState).session;

      yield RefreshSuccessSearchState(session.rebuild(
        isLoading: true,
        searchType: SearchType.full,
      ));

      const LocationRepository locationRepository = LocationRepository();

      List<LocationModel> _locations;

      if (session.activeSearchTab == 0) {
        _locations = await locationRepository.search();
      } else {
        _locations = await locationRepository.searchCategory(
            id: session.activeSearchTab);
      }

      if (_locations.isNotEmpty && session.q.isNotEmpty) {
        _locations = _locations
            .where((LocationModel location) =>
                location.name.toLowerCase().contains(session.q.toLowerCase()))
            .toList();
      }

      yield RefreshSuccessSearchState(session.rebuild(
        locations: _locations,
        isLoading: false,
        searchType: SearchType.full,
      ));
    }
  }

  Stream<SearchState> _mapCategoryFilteredSearchEventToState(
      CategoryFilteredSearchEvent event) async* {
    if (state is RefreshSuccessSearchState) {
      final SearchSessionModel session =
          (state as RefreshSuccessSearchState).session;

      yield RefreshSuccessSearchState(session.rebuild(
        activeSearchTab: event.activeSearchTab,
        searchType: SearchType.full,
        isLoading: true,
      ));

      add(FilteredListRequestedSearchEvent());
    }
  }

  Stream<SearchState> _mapListTypeSearchEventToState(
      ListTypeChangedSearchEvent event) async* {
    if (state is RefreshSuccessSearchState) {
      final SearchSessionModel session =
          (state as RefreshSuccessSearchState).session;

      yield RefreshSuccessSearchState(session.rebuild(
        searchType: SearchType.full,
        currentListType: event.newListType,
      ));
    }
  }

  Stream<SearchState> _mapSortOrderSearchEventToState(
      SortOrderChangedSearchEvent event) async* {
    if (state is RefreshSuccessSearchState) {
      final SearchSessionModel session =
          (state as RefreshSuccessSearchState).session;

      yield RefreshSuccessSearchState(session.rebuild(
        currentSort: event.newSort,
        searchType: SearchType.full,
        isLoading: true,
      ));

      add(FilteredListRequestedSearchEvent());
    }
  }

  Stream<SearchState> _mapGenderFilterSearchEventToState(
      GenderFilterChangedSearchEvent event) async* {
    if (state is RefreshSuccessSearchState) {
      final SearchSessionModel session =
          (state as RefreshSuccessSearchState).session;

      yield RefreshSuccessSearchState(session.rebuild(
        currentGenderFilter: event.genderFilter,
        searchType: SearchType.full,
        isLoading: true,
      ));

      add(FilteredListRequestedSearchEvent());
    }
  }

  Stream<SearchState> _mapCitySelectedSearchEventToState(
      CitySelectedSearchEvent event) async* {
    if (state is RefreshSuccessSearchState) {
      final SearchSessionModel session =
          (state as RefreshSuccessSearchState).session;

      yield RefreshSuccessSearchState(session.rebuild(
        selectedCity: event.city,
        searchType: SearchType.full,
        isLoading: true,
      ));

      add(FilteredListRequestedSearchEvent());
    }
  }

  Stream<SearchState> _mapNewDateRangeSearchEventToState(
      NewDateRangeSelectedSearchEvent event) async* {
    if (state is RefreshSuccessSearchState) {
      final SearchSessionModel session =
          (state as RefreshSuccessSearchState).session;

      yield RefreshSuccessSearchState(session.rebuild(
        selectedDateRange: event.dateRange,
        searchType: SearchType.full,
        isLoading: true,
      ));

      add(FilteredListRequestedSearchEvent());
    }
  }

  Stream<SearchState> _mapKeywordSearchEventToState(
      KeywordChangedSearchEvent event) async* {
    if (state is RefreshSuccessSearchState) {
      final SearchSessionModel session =
          (state as RefreshSuccessSearchState).session;

      yield RefreshSuccessSearchState(session.rebuild(
        q: event.q,
        searchType: SearchType.full,
        isLoading: true,
      ));

      add(FilteredListRequestedSearchEvent());
    }
  }

  Stream<SearchState> _mapQuickSearchEventToState(
      QuickSearchRequestedSearchEvent event) async* {
    if (state is RefreshSuccessSearchState) {
      if (event.q.length >= kMinimalNameQueryLength) {
        final SearchSessionModel session =
            (state as RefreshSuccessSearchState).session;

        yield RefreshSuccessSearchState(session.rebuild(
          isLoading: true,
          locations: null,
          searchType: SearchType.quick,
        ));

        const LocationRepository locationRepository = LocationRepository();

        List<LocationModel> _locations;

        _locations = await locationRepository.search();

        if (_locations.isNotEmpty) {
          _locations = _locations
              .where((LocationModel location) =>
                  location.name.toLowerCase().contains(event.q.toLowerCase()))
              .toList();
        }

        yield RefreshSuccessSearchState(session.rebuild(
          locations: _locations,
          isLoading: false,
          searchType: SearchType.quick,
        ));
      }
    }
  }

  Stream<SearchState> _mapMapSearchEventToState(MapSearchEvent event) async* {
    if (state is RefreshSuccessSearchState) {
      final SearchSessionModel session =
          (state as RefreshSuccessSearchState).session;

      yield RefreshSuccessSearchState(session.rebuild(
        isLoading: true,
        locations: null,
        searchType: SearchType.map,
      ));

      const LocationRepository locationRepository = LocationRepository();

      List<LocationModel> _locations;

      if (session.activeSearchTab == 0) {
        _locations = await locationRepository.search();
      } else {
        _locations = await locationRepository.searchCategory(
            id: session.activeSearchTab);
      }

      if (_locations.isNotEmpty && session.q.isNotEmpty) {
        _locations = _locations
            .where((LocationModel location) =>
                location.name.toLowerCase().contains(session.q.toLowerCase()))
            .toList();
      }

      yield RefreshSuccessSearchState(session.rebuild(
        locations: _locations,
        isLoading: false,
        searchType: SearchType.map,
      ));
    }
  }
}
