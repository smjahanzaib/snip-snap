part of 'favorites_bloc.dart';

abstract class FavoritesEvent {
  @override
  String toString() => '$runtimeType';
}

class DataLoadedFavoritesEvent extends FavoritesEvent {}

class ItemRemovedFavoritesEvent extends FavoritesEvent {
  ItemRemovedFavoritesEvent(this.locationId);

  final int locationId;
}

class ItemAddedFavoritesEvent extends FavoritesEvent {
  ItemAddedFavoritesEvent(this.locationId);

  final int locationId;
}
