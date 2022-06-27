import 'package:flutter/material.dart';

class BookingWizardPageModel {
  BookingWizardPageModel(
    this.step,
    this.body,
    this.globalKey,
  );

  factory BookingWizardPageModel.fromJson(Map<String, dynamic> json) {
    return BookingWizardPageModel(
      json['step'] as int ?? 0,
      json['body'] as Widget ?? Container(),
      json['key'] as GlobalKey ?? GlobalKey(debugLabel: 'booking_step' + (json['step'] as int).toString()),
    );
  }

  final int step;
  final Widget body;
  final GlobalKey globalKey;
}
