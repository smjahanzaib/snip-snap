// ignore_for_file: sort_constructors_first, prefer_single_quotes, prefer_if_null_operators

import 'package:SnipSnap/screens/AddBeautyExpert/Model/userModel.dart';

class AppointmentHistory {
  int vendorId;
  int id;
  String serviceDate;
  String serviceTime;
  String totalPrice;
  int status;
  String statustext;

  User user;

  AppointmentHistory();
  AppointmentHistory.fromJson(Map<String, dynamic> json) {
    try {
      vendorId = int.parse((json['vendor_id'] ?? 0).toString());

      serviceDate = (json['service_date'] ?? '').toString();
      id = int.parse((json['id'] ?? 0).toString());

      statustext = (json['statustext'] ?? '').toString();
      user = (json['user'] != null)
          ? User.fromJson(json['user'] as Map<String, dynamic>)
          : null;
      totalPrice = (json['total_price'] ?? '').toString();
      serviceTime = (json['service_time'] ?? '').toString();
    } catch (e) {
      print(
          "Exception - appointmentHistoryModel.dart - AppointmentHistory.fromJson():" +
              e.toString());
    }
  }

  Map<String, dynamic> toJson() => {
        'vendor_id': vendorId != null ? vendorId : null,
        'service_date': serviceDate != null ? serviceDate : null,
        'service_time': serviceTime != null ? serviceTime : null,
      };
}
