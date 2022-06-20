// ignore_for_file: prefer_final_locals, prefer_single_quotes

import 'package:flutter/material.dart';

class VendorTiming {
  int vendor_id;
  int status;
  String days;
  TimeOfDay open_hour;
  TimeOfDay close_hour;
  int time_slot_id;

  VendorTiming();
  // ignore: prefer_if_null_operators
  Map<String, dynamic> toJson() => {
        'vendor_id': vendor_id != null ? vendor_id : null,
        'status': status != null ? status : null,
        'days': days != null ? days : null,
        'time_slot_id': time_slot_id != null ? time_slot_id : null
      };

  VendorTiming.fromJson(Map<String, dynamic> json) {
    try {
      vendor_id = int.parse((json['vendor_id'] ?? 0).toString());
      status = int.parse((json['status'] ?? 0).toString());
      time_slot_id = int.parse((json['time_slot_id'] ?? 0).toString());
      days = (json['days'] ?? '').toString();
      if (json['open_hour'] != null) {
        List<String> _tTimeList = json['open_hour'].toString().split(":");
        int hr = int.parse(_tTimeList[0]);
        int min = int.parse(_tTimeList[1]);
        open_hour = TimeOfDay(hour: hr, minute: min);
      } else {
        open_hour = null;
      }
      if (json['close_hour'] != null) {
        List<String> _tTimeList = json['close_hour'].toString().split(":");
        int hr = int.parse(_tTimeList[0]);
        int min = int.parse(_tTimeList[1]);
        close_hour = TimeOfDay(hour: hr, minute: min);
      } else {
        close_hour = null;
      }
    } catch (e) {
      print("Exception - vendorTimingModel.dart - VendorTiming.fromJson():" +
          e.toString());
    }
  }
}
