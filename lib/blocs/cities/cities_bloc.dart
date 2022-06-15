import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:SnipSnap/configs/constants.dart';
import 'package:SnipSnap/data/models/city_model.dart';
import 'package:SnipSnap/data/repositories/location_repository.dart';

part 'cities_event.dart';
part 'cities_state.dart';

class CitiesBloc extends Bloc<CitiesEvent, CitiesState> {
  CitiesBloc() : super(InitialCitiesState());

  @override
  Stream<CitiesState> mapEventToState(CitiesEvent event) async* {
    if (event is SearchRequestedCitiesEvent) {
      yield* _mapSearchCitiesEventToState(event);
    }
  }

  Stream<CitiesState> _mapSearchCitiesEventToState(
      SearchRequestedCitiesEvent event) async* {
    if (event.q.length >= kMinimalNameQueryLength) {
      yield LoadCitiesInProgressState();

      final String q = event.q.toLowerCase();
      const LocationRepository locationRepository = LocationRepository();

      List<CityModel> _cities =
          await locationRepository.searchCities(q: event.q);

      if (_cities.isNotEmpty) {
        _cities = _cities
            .where((CityModel city) => city.name.toLowerCase().contains(q))
            .toList();
      }

      yield LoadCitiesSuccessState(_cities);
    }
  }
}
