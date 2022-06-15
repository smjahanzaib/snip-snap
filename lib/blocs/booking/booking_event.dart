part of 'booking_bloc.dart';

abstract class BookingEvent {
  @override
  String toString() => '$runtimeType';
}

class LocationLoadedBookingEvent extends BookingEvent {
  LocationLoadedBookingEvent({this.locationId});

  final int locationId;
}

class ServicesLoadedBookingEvent extends BookingEvent {}

class ServiceSelectedBookingEvent extends BookingEvent {
  ServiceSelectedBookingEvent({this.service});

  final ServiceModel service;
}

class ServiceUnselectedBookingEvent extends BookingEvent {
  ServiceUnselectedBookingEvent({this.service});

  final ServiceModel service;
}

class TimetablesRequestedBookingEvent extends BookingEvent {
  TimetablesRequestedBookingEvent({this.locationId, this.duration});

  final int locationId;
  final int duration;
}

class StaffSelectedBookingEvent extends BookingEvent {
  StaffSelectedBookingEvent({this.staff});

  final StaffModel staff;
}

class DateRangeSetBookingEvent extends BookingEvent {
  DateRangeSetBookingEvent(this.dateRange);

  final int dateRange;
}

class TimestampSelectedBookingEvent extends BookingEvent {
  TimestampSelectedBookingEvent(this.timestamp);

  final int timestamp;
}

class PaymentMethodSelectedBookingEvent extends BookingEvent {
  PaymentMethodSelectedBookingEvent(this.paymentMethod);

  final PaymentMethod paymentMethod;
}

class NotesUpdatedBookingEvent extends BookingEvent {
  NotesUpdatedBookingEvent(this.notes);

  final String notes;
}

class SubmittedBookingEvent extends BookingEvent {}
