part of 'booking_bloc.dart';

abstract class BookingState {
  @override
  String toString() => '$runtimeType';
}

class InitialBookingState extends BookingState {}

class SessionRefreshSuccessBookingState extends BookingState {
  SessionRefreshSuccessBookingState(this.session);

  final BookingSessionModel session;
}

class LoadFailureBookingState extends BookingState {}

class StaffSelectionSuccessBookingState extends BookingState {}
