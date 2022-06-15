part of 'cities_bloc.dart';

abstract class CitiesState {
  @override
  String toString() => '$runtimeType';
}

class InitialCitiesState extends CitiesState {}

class LoadCitiesInProgressState extends CitiesState {}

class LoadCitiesSuccessState extends CitiesState {
  LoadCitiesSuccessState(this.cities);

  final List<CityModel> cities;
}
