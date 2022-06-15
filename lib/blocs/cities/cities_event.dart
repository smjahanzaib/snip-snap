part of 'cities_bloc.dart';

abstract class CitiesEvent {
  @override
  String toString() => '$runtimeType';
}

class SearchRequestedCitiesEvent extends CitiesEvent {
  SearchRequestedCitiesEvent(this.q);

  final String q;
}
