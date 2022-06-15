part of 'ratings_bloc.dart';

abstract class RatingsEvent {
  @override
  String toString() => '$runtimeType';
}

class ListRequestedRatingsEvent extends RatingsEvent {
  ListRequestedRatingsEvent({
    this.page,
    this.resultsPerPage,
  });

  final int page;
  final int resultsPerPage;
}
