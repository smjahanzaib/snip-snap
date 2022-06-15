part of 'favorites_bloc.dart';

abstract class FavoritesState {
  @override
  String toString() => '$runtimeType';
}

class InitialFavoritesState extends FavoritesState {}

class LoadInProgressFavoritesState extends FavoritesState {}

class LoadSuccessFavoritesState extends FavoritesState {
  LoadSuccessFavoritesState(this.favorites);

  final List<LocationModel> favorites;
}
