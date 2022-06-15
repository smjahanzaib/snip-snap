part of 'appointment_bloc.dart';

abstract class AppointmentEvent {
  @override
  String toString() => '$runtimeType';
}

class LoadedAppointmentEvent extends AppointmentEvent {
  LoadedAppointmentEvent({
    this.statuses,
    this.page,
    this.resultsPerPage,
  });

  final List<String> statuses;
  final int page;
  final int resultsPerPage;
}

class NotesUpdatedAppointmentEvent extends AppointmentEvent {
  NotesUpdatedAppointmentEvent(this.notes);

  final String notes;
}

class CanceledAppointmentEvent extends AppointmentEvent {
  CanceledAppointmentEvent({this.id});

  final int id;
}

class ReviewedAppointmentEvent extends AppointmentEvent {
  ReviewedAppointmentEvent({this.rate, this.comment});

  final double rate;
  final String comment;
}
