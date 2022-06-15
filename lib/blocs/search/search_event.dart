part of 'search_bloc.dart';

@immutable
abstract class SearchEvent {
  @override
  String toString() => '$runtimeType';
}

class SessionInitedSearchEvent extends SearchEvent {
  SessionInitedSearchEvent({
    this.selectedCity,
    this.activeSearchTab,
    this.currentSort,
    this.currentListType,
    this.currentGenderFilter,
  });

  final CityModel selectedCity;
  final int activeSearchTab;
  final ToolbarOptionModel currentSort;
  final ToolbarOptionModel currentListType;
  final ToolbarOptionModel currentGenderFilter;
}

class FilteredListRequestedSearchEvent extends SearchEvent {}

class CategoryFilteredSearchEvent extends SearchEvent {
  CategoryFilteredSearchEvent({this.activeSearchTab});

  final int activeSearchTab;
}

class ListTypeChangedSearchEvent extends SearchEvent {
  ListTypeChangedSearchEvent(this.newListType);

  final ToolbarOptionModel newListType;
}

class SortOrderChangedSearchEvent extends SearchEvent {
  SortOrderChangedSearchEvent(this.newSort);

  final ToolbarOptionModel newSort;
}

class GenderFilterChangedSearchEvent extends SearchEvent {
  GenderFilterChangedSearchEvent(this.genderFilter);

  final ToolbarOptionModel genderFilter;
}

class CitySelectedSearchEvent extends SearchEvent {
  CitySelectedSearchEvent(this.city);

  final CityModel city;
}

class NewDateRangeSelectedSearchEvent extends SearchEvent {
  NewDateRangeSelectedSearchEvent(this.dateRange);

  final int dateRange;
}

class KeywordChangedSearchEvent extends SearchEvent {
  KeywordChangedSearchEvent(this.q);

  final String q;
}

class QuickSearchRequestedSearchEvent extends SearchEvent {
  QuickSearchRequestedSearchEvent(this.q);

  final String q;
}

class MapSearchEvent extends SearchEvent {
  MapSearchEvent(this.boundingBox);

  final GeoBoundingBox boundingBox;
}
