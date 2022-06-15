import 'package:flutter/material.dart';
import 'package:SnipSnap/configs/constants.dart';
import 'package:SnipSnap/data/models/appointment_model.dart';
import 'package:SnipSnap/generated/l10n.dart';
import 'package:SnipSnap/widgets/badge.dart';

/// [Badge] to represent appointment statuses.
class AppointmentStatusBadge extends StatelessWidget {
  const AppointmentStatusBadge({
    Key key,
    this.status,
    this.inverse = false,
  }) : super(key: key);

  final AppointmentStatus status;
  final bool inverse;

  @override
  Widget build(BuildContext context) {
    Color _color;
    Color _backgroundColor;

    switch (status) {
      case AppointmentStatus.completed:
        _color = kWhite;
        _backgroundColor = Colors.green;
        break;
      case AppointmentStatus.canceled:
        _color = kWhite;
        _backgroundColor = Colors.grey;
        break;
      case AppointmentStatus.declined:
      case AppointmentStatus.failed:
        _color = kWhite;
        _backgroundColor = Colors.red[600];
        break;
      case AppointmentStatus.active:
        _color = inverse ? kPrimaryColor : kWhite;
        _backgroundColor = inverse ? kWhite : kPrimaryColor;
        break;
      default:
        _color = Colors.black87;
        _backgroundColor = Theme.of(context).highlightColor;
        break;
    }

    return Badge(
      text: L10n.of(context)
          .commonAppointmentStatus(AppointmentModel.getStatus(status)),
      color: _color,
      backgroundColor: _backgroundColor,
    );
  }
}
