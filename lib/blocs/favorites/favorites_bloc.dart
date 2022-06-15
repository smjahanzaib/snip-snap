import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:SnipSnap/data/models/location_model.dart';
import 'package:SnipSnap/data/repositories/favorites_repository.dart';

part 'favorites_event.dart';
part 'favorites_state.dart';

class FavoritesBloc extends Bloc<FavoritesEvent, FavoritesState> {
  FavoritesBloc() : super(InitialFavoritesState());

  @override
  Stream<FavoritesState> mapEventToState(FavoritesEvent event) async* {
    if (event is DataLoadedFavoritesEvent) {
      yield* _mapLoadFavoritesEventToState(event);
    }
  }

  Stream<FavoritesState> _mapLoadFavoritesEventToState(
      DataLoadedFavoritesEvent event) async* {
    yield LoadInProgressFavoritesState();

    final List<LocationModel> favorites =
        await const FavoritesRepository().getFavorites();

    yield LoadSuccessFavoritesState(favorites);
  }
}
