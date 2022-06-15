import 'package:intl/intl.dart';
import 'package:SnipSnap/data/models/location_model.dart';
import 'package:SnipSnap/data/models/service_model.dart';

enum AppointmentStatus {
  active,
  completed,
  canceled,
  declined,
  failed,
  unknown,
}

class AppointmentModel {
  AppointmentModel({
    this.id,
    this.location,
    this.totalPrice,
    this.totalDuration,
    this.status,
    this.requestDate,
    this.requestTime,
    this.code,
    this.notes,
    this.services,
  });

  factory AppointmentModel.fromJson(Map<String, dynamic> json) {
    final List<dynamic> _services =
        json['services'] as List<dynamic> ?? <dynamic>[];

    return AppointmentModel(
      id: json['id'] as int ?? 0,
      location:
          LocationModel.fromJson(json['location'] as Map<String, dynamic>),
      totalPrice: json['total_price'] as double ?? 0.0,
      totalDuration: json['total_duration'] as int ?? 0,
      status: setStatus(json['status'] as String ?? ''),
      requestDate: DateTime.tryParse(json['request_date'] as String ?? '') ??
          DateTime.now(),
      requestTime: json['request_time'] as String ?? '00:00',
      code: json['code'] as String ?? '',
      notes: json['notes'] as String ?? '',
      services: _services
          .map<ServiceModel>((dynamic json) =>
              ServiceModel.fromJson(json as Map<String, dynamic>))
          .toList(),
    );
  }

  AppointmentModel rebuild({
    String notes,
    AppointmentStatus status,
  }) {
    return AppointmentModel(
      id: id,
      location: location,
      totalPrice: totalPrice,
      totalDuration: totalDuration,
      status: status ?? this.status,
      requestDate: requestDate,
      requestTime: requestTime,
      code: code,
      notes: notes ?? this.notes,
      services: services,
    );
  }

  final int id;
  final LocationModel location;
  final double totalPrice;
  final int totalDuration;
  final AppointmentStatus status;
  final DateTime requestDate;
  final String requestTime;
  final String code;
  final String notes;
  final List<ServiceModel> services;

  DateTime get appointmentStartDateTime {
    return DateTime.tryParse(
        DateFormat('yyyy-MM-dd', 'en').format(requestDate) + ' ' + requestTime);
  }

  DateTime get appointmentEndDateTime {
    return appointmentStartDateTime.add(Duration(minutes: totalDuration));
  }

  static AppointmentStatus setStatus(String type) {
    switch (type) {
      case 'active':
        return AppointmentStatus.active;
      case 'completed':
        return AppointmentStatus.completed;
      case 'canceled':
        return AppointmentStatus.canceled;
      case 'declined':
        return AppointmentStatus.declined;
      case 'failed':
        return AppointmentStatus.failed;
      default:
        return AppointmentStatus.unknown;
    }
  }

  static String getStatus(AppointmentStatus type) {
    switch (type) {
      case AppointmentStatus.active:
        return 'active';
      case AppointmentStatus.completed:
        return 'completed';
      case AppointmentStatus.canceled:
        return 'canceled';
      case AppointmentStatus.declined:
        return 'declined';
      case AppointmentStatus.failed:
        return 'failed';
      default:
        return '';
    }
  }

  @override
  String toString() {
    return '''AppointmentModel:
    id: $id
    totalPrice: $totalPrice
    totalDuration: $totalDuration
    status: $status
    requestDate: $requestDate
    requestTime: $requestTime
    code: $code''';
  }
}
