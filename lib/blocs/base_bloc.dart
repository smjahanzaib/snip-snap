import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:SnipSnap/data/models/data_response_error_model.dart';
import 'package:SnipSnap/utils/console.dart';

/// Abstract [Bloc] that contains console logging.
abstract class BaseBloc<Event, State> extends Bloc<Event, State> {
  BaseBloc(State initialState) : super(initialState);

  /// Log api errors via [Console] and return string representation.
  String apiError(List<DataResponseErrorModel> errors) {
    Console.log('API ERROR', errors.first.message, error: errors.first);

    return errors.first.message;
  }
}
