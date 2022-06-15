import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:SnipSnap/blocs/auth/auth_bloc.dart';
import 'package:SnipSnap/blocs/base_bloc.dart';
import 'package:SnipSnap/data/models/booking_session_model.dart';
import 'package:SnipSnap/data/models/location_model.dart';
import 'package:SnipSnap/data/models/service_model.dart';
import 'package:SnipSnap/data/models/staff_model.dart';
import 'package:SnipSnap/data/models/timetable_model.dart';
import 'package:SnipSnap/data/repositories/appointment_repository.dart';
import 'package:SnipSnap/data/repositories/location_repository.dart';

part 'booking_event.dart';
part 'booking_state.dart';

enum PaymentMethod { cc, inStore }

class BookingBloc extends BaseBloc<BookingEvent, BookingState> {
  BookingBloc({@required this.authBloc}) : super(InitialBookingState());

  final AuthBloc authBloc;

  @override
  Stream<BookingState> mapEventToState(BookingEvent event) async* {
    if (event is LocationLoadedBookingEvent) {
      yield* _mapLoadLocationBookingEventToState(event);
    } else if (event is ServiceSelectedBookingEvent) {
      yield* _mapSelectServiceBookingEventToState(event);
    } else if (event is ServiceUnselectedBookingEvent) {
      yield* _mapUnselectServiceBookingEventToState(event);
    } else if (event is StaffSelectedBookingEvent) {
      yield* _mapSelectStaffBookingEventToState(event);
    } else if (event is TimetablesRequestedBookingEvent) {
      yield* _mapGetTimetablesBookingEventToState(event);
    } else if (event is DateRangeSetBookingEvent) {
      yield* _mapSetDateRangeBookingEventToState(event);
    } else if (event is TimestampSelectedBookingEvent) {
      yield* _mapSelectTimestampBookingEventToState(event);
    } else if (event is PaymentMethodSelectedBookingEvent) {
      yield* _mapSelectPaymentMethodBookingEventToState(event);
    } else if (event is NotesUpdatedBookingEvent) {
      yield* _mapUpdateNotesdBookingEventToState(event);
    } else if (event is SubmittedBookingEvent) {
      yield* _mapSubmitBookingEventToState();
    }
  }

  Stream<BookingState> _mapLoadLocationBookingEventToState(
      LocationLoadedBookingEvent event) async* {
    final LocationModel _location =
        await const LocationRepository().getLocation(id: event.locationId);

    if (_location == null) {
      yield LoadFailureBookingState();
    } else {
      yield SessionRefreshSuccessBookingState(BookingSessionModel(
        location: _location,
        selectedServiceIds: <int>[],
        selectedStaff: null,
        appointmentId: 0,
      ));
    }
  }

  Stream<BookingState> _mapSelectServiceBookingEventToState(
      ServiceSelectedBookingEvent event) async* {
    if (state is SessionRefreshSuccessBookingState) {
      final BookingSessionModel session =
          (state as SessionRefreshSuccessBookingState).session;

      session.selectedServiceIds.add(event.service.id);

      final int totalDuration = session.totalDuration + event.service.duration;
      final BookingSessionModel newSession = session.rebuild(
        selectedServiceIds: session.selectedServiceIds,
        totalPrice: session.totalPrice + event.service.price,
        totalDuration: totalDuration,
      );

      yield SessionRefreshSuccessBookingState(newSession);

      add(TimetablesRequestedBookingEvent(
        locationId: session.location.id,
        duration: totalDuration,
      ));
    }
  }

  Stream<BookingState> _mapUnselectServiceBookingEventToState(
      ServiceUnselectedBookingEvent event) async* {
    if (state is SessionRefreshSuccessBookingState) {
      final BookingSessionModel session =
          (state as SessionRefreshSuccessBookingState).session;
      session.selectedServiceIds.remove(event.service.id);

      final int totalDuration = session.totalDuration - event.service.duration;
      final BookingSessionModel newSession = session.rebuild(
        selectedServiceIds: session.selectedServiceIds,
        totalPrice: session.totalPrice - event.service.price,
        totalDuration: totalDuration,
      );

      yield SessionRefreshSuccessBookingState(newSession);

      add(TimetablesRequestedBookingEvent(
        locationId: session.location.id,
        duration: totalDuration,
      ));
    }
  }

  Stream<BookingState> _mapSelectStaffBookingEventToState(
      StaffSelectedBookingEvent event) async* {
    if (state is SessionRefreshSuccessBookingState) {
      final BookingSessionModel session =
          (state as SessionRefreshSuccessBookingState).session;

      final BookingSessionModel newSession =
          session.rebuild(selectedStaff: event.staff);

      yield StaffSelectionSuccessBookingState();
      yield SessionRefreshSuccessBookingState(newSession);
    }
  }

  Stream<BookingState> _mapGetTimetablesBookingEventToState(
      TimetablesRequestedBookingEvent event) async* {
    if (state is SessionRefreshSuccessBookingState) {
      final List<TimetableModel> _timetables =
          await const AppointmentRepository().getTimetable(
        locationId: event.locationId,
        duration: event.duration,
      );
      final BookingSessionModel session =
          (state as SessionRefreshSuccessBookingState).session;
      final BookingSessionModel newSession =
          session.rebuild(timetables: _timetables);

      yield SessionRefreshSuccessBookingState(newSession);
    }
  }

  Stream<BookingState> _mapSetDateRangeBookingEventToState(
      DateRangeSetBookingEvent event) async* {
    if (state is SessionRefreshSuccessBookingState) {
      final BookingSessionModel session =
          (state as SessionRefreshSuccessBookingState).session;
      if (session.selectedDateRange != event.dateRange) {
        final BookingSessionModel newSession = session.rebuild(
          selectedDateRange: event.dateRange,
          selectedTimestamp: 0,
        );

        yield SessionRefreshSuccessBookingState(newSession);
      }
    }
  }

  Stream<BookingState> _mapSelectTimestampBookingEventToState(
      TimestampSelectedBookingEvent event) async* {
    if (state is SessionRefreshSuccessBookingState) {
      final BookingSessionModel session =
          (state as SessionRefreshSuccessBookingState).session;
      if (session.selectedTimestamp != event.timestamp) {
        final BookingSessionModel newSession =
            session.rebuild(selectedTimestamp: event.timestamp);

        yield SessionRefreshSuccessBookingState(newSession);
      }
    }
  }

  Stream<BookingState> _mapSelectPaymentMethodBookingEventToState(
      PaymentMethodSelectedBookingEvent event) async* {
    if (state is SessionRefreshSuccessBookingState) {
      final BookingSessionModel session =
          (state as SessionRefreshSuccessBookingState).session;
      if (session.paymentMethod != event.paymentMethod) {
        final BookingSessionModel newSession =
            session.rebuild(paymentMethod: event.paymentMethod);

        yield SessionRefreshSuccessBookingState(newSession);
      }
    }
  }

  Stream<BookingState> _mapUpdateNotesdBookingEventToState(
      NotesUpdatedBookingEvent event) async* {
    if (state is SessionRefreshSuccessBookingState) {
      final BookingSessionModel session =
          (state as SessionRefreshSuccessBookingState).session;
      final BookingSessionModel newSession =
          session.rebuild(notes: event.notes);

      yield SessionRefreshSuccessBookingState(newSession);
    }
  }

  Stream<BookingState> _mapSubmitBookingEventToState() async* {
    if (state is SessionRefreshSuccessBookingState) {
      final BookingSessionModel session =
          (state as SessionRefreshSuccessBookingState).session;

      yield SessionRefreshSuccessBookingState(
          session.rebuild(isSubmitting: true));

      // Wait for some random time. Simulate net activity ;)
      await Future<int>.delayed(Duration(seconds: Random().nextInt(2)));

      yield SessionRefreshSuccessBookingState(session.rebuild(
        isSubmitting: false,
        appointmentId: 1,
      ));
    }
  }
}
