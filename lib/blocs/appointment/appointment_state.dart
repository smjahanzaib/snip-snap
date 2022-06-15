part of 'appointment_bloc.dart';

abstract class AppointmentState {
  @override
  String toString() => '$runtimeType';
}

class InitialAppointmentState extends AppointmentState {}

class LoadInProgressAppointmentState extends AppointmentState {}

class LoadSuccessAppointmentState extends AppointmentState {
  LoadSuccessAppointmentState(this.appointments);

  final List<AppointmentModel> appointments;
}

class UpdateNotesInProgressAppointmentState extends AppointmentState {
  UpdateNotesInProgressAppointmentState(this.notes);

  final String notes;
}

class CancelSuccessAppointmentState extends AppointmentState {}

class ReviewSuccessAppointmentState extends AppointmentState {}
