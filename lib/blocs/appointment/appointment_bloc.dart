import 'dart:async';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:SnipSnap/data/models/appointment_model.dart';
import 'package:SnipSnap/data/repositories/appointment_repository.dart';

part 'appointment_event.dart';
part 'appointment_state.dart';

class AppointmentBloc extends Bloc<AppointmentEvent, AppointmentState> {
  AppointmentBloc() : super(InitialAppointmentState());

  @override
  Stream<AppointmentState> mapEventToState(AppointmentEvent event) async* {
    if (event is LoadedAppointmentEvent) {
      yield* _mapGetAppointmentEventToState(event);
    } else if (event is NotesUpdatedAppointmentEvent) {
      yield* _mapUpdateNotesAppointmentEventToState(event);
    } else if (event is CanceledAppointmentEvent) {
      yield* _mapCancelAppointmentEventToState(event);
    } else if (event is ReviewedAppointmentEvent) {
      yield* _mapReviewAppointmentEventToState(event);
    }
  }

  Stream<AppointmentState> _mapGetAppointmentEventToState(
      LoadedAppointmentEvent event) async* {
    yield LoadInProgressAppointmentState();

    List<AppointmentModel> _appointments;

    _appointments = await const AppointmentRepository().getAppointments();
    _appointments = _appointments.where((AppointmentModel item) {
      return event.statuses.contains(describeEnum(item.status));
    }).toList();

    yield LoadSuccessAppointmentState(_appointments);
  }

  Stream<AppointmentState> _mapUpdateNotesAppointmentEventToState(
      NotesUpdatedAppointmentEvent event) async* {
    yield UpdateNotesInProgressAppointmentState(event.notes);
  }

  Stream<AppointmentState> _mapCancelAppointmentEventToState(
      CanceledAppointmentEvent event) async* {
    /// Wait for some random time. Simulate net activity ;)
    await Future<int>.delayed(Duration(seconds: Random().nextInt(2)));

    yield CancelSuccessAppointmentState();
  }

  Stream<AppointmentState> _mapReviewAppointmentEventToState(
      ReviewedAppointmentEvent event) async* {
    /// Wait for some random time. Simulate net activity ;)
    await Future<int>.delayed(Duration(seconds: Random().nextInt(2)));

    yield ReviewSuccessAppointmentState();
  }
}
