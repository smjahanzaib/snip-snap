import 'package:SnipSnap/data/models/city_model.dart';
import 'package:SnipSnap/data/models/location_model.dart';
import 'package:SnipSnap/data/models/toolbar_option_model.dart';

enum SearchType { full, quick, map }

class SearchSessionModel {
  SearchSessionModel({
    this.locations,
    this.currentSort,
    this.currentListType,
    this.currentGenderFilter,
    this.selectedCity,
    this.q = '',
    this.currentPage = 1,
    this.selectedDateRange = 0,
    this.activeSearchTab = 0,
    this.isLoading = false,
    this.searchType = SearchType.full,
  });

  SearchSessionModel rebuild({
    String q,
    int currentPage,
    int selectedDateRange,
    ToolbarOptionModel currentSort,
    ToolbarOptionModel currentListType,
    ToolbarOptionModel currentGenderFilter,
    int activeSearchTab,
    CityModel selectedCity,
    bool isLoading,
    List<LocationModel> locations,
    SearchType searchType,
  }) {
    return SearchSessionModel(
      locations: locations ?? this.locations,
      currentPage: currentPage ?? this.currentPage,
      selectedDateRange: selectedDateRange ?? this.selectedDateRange,
      currentSort: currentSort ?? this.currentSort,
      currentListType: currentListType ?? this.currentListType,
      currentGenderFilter: currentGenderFilter ?? this.currentGenderFilter,
      activeSearchTab: activeSearchTab ?? this.activeSearchTab,
      selectedCity: selectedCity ?? this.selectedCity,
      q: q ?? this.q,
      isLoading: isLoading ?? this.isLoading,
      searchType: searchType ?? this.searchType,
    );
  }

  final String q;
  final int currentPage;
  final int selectedDateRange;
  final ToolbarOptionModel currentSort;
  final ToolbarOptionModel currentListType;
  final ToolbarOptionModel currentGenderFilter;
  final int activeSearchTab;
  final CityModel selectedCity;
  final bool isLoading;
  final SearchType searchType;

  final List<LocationModel> locations;

  @override
  String toString() {
    return '''SearchSessionModel:
    q: $q
    currentSort: $currentSort
    currentListType: $currentListType
    currentGenderFilter: $currentGenderFilter
    activeSearchTab: $activeSearchTab
    searchType: $searchType
    locations: $locations''';
  }
}
