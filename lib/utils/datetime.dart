import 'package:flutter/material.dart';
import 'package:SnipSnap/configs/constants.dart';
import 'package:intl/intl.dart';
import 'package:SnipSnap/generated/l10n.dart';

/// Day of week enumeration.
enum DOW {
  monday,
  tuesday,
  wednesday,
  thursday,
  friday,
  saturday,
  sunday,
}

/// Month enumeration.
enum Month {
  january,
  february,
  march,
  april,
  may,
  june,
  july,
  august,
  september,
  october,
  november,
  december,
}

/// [DateTieme] extensions.
extension DateTimeExtension on DateTime {
  String get toLocalDateString {
    return DateFormat(kDateFormat).format(this);
  }

  String get toLocalTimeString {
    return DateFormat(kTimeFormat).format(this);
  }

  String get toLocalDateTimeString {
    return DateFormat(kDateTimeFormat).format(this);
  }

  String remainingTime(BuildContext context) {
    final DateTime now = DateTime.now();
    final Duration difference = this.difference(now);

    if (difference.inDays > 1) {
      return L10n.of(context).commonElapsedDays(difference.inDays);
    }

    if (difference.inHours > 24) {
      return L10n.of(context).commonElapsedDayHours(difference.inHours - 24);
    }

    if (difference.inHours > 1) {
      return L10n.of(context).commonElapsedHours(difference.inHours);
    }

    if (difference.inMinutes > 1) {
      return L10n.of(context).commonElapsedMins(difference.inMinutes);
    }

    return L10n.of(context).commonElapsedNow;
  }
}
