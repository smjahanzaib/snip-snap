import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:SnipSnap/data/models/review_model.dart';
import 'package:SnipSnap/data/repositories/ratings_repository.dart';

part 'ratings_event.dart';
part 'ratings_state.dart';

class RatingsBloc extends Bloc<RatingsEvent, RatingsState> {
  RatingsBloc() : super(InitialRatingsState());

  @override
  Stream<RatingsState> mapEventToState(RatingsEvent event) async* {
    if (event is ListRequestedRatingsEvent) {
      yield* _mapGetRatingsEventToState(event);
    }
  }

  Stream<RatingsState> _mapGetRatingsEventToState(
      ListRequestedRatingsEvent event) async* {
    yield LoadInProgressRatingsState();

    List<ReviewModel> _reviews;

    _reviews = await const RatingsRepository().getRatings();

    yield LoadSuccessRatingsState(_reviews);
  }
}
