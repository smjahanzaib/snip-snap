part of 'ratings_bloc.dart';

abstract class RatingsState {
  @override
  String toString() => '$runtimeType';
}

class InitialRatingsState extends RatingsState {}

class LoadInProgressRatingsState extends RatingsState {}

class LoadSuccessRatingsState extends RatingsState {
  LoadSuccessRatingsState(this.reviews);

  final List<ReviewModel> reviews;
}
