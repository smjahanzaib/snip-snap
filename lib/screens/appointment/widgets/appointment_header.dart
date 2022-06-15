import 'package:flutter/material.dart';
import 'package:SnipSnap/configs/constants.dart';
import 'package:SnipSnap/configs/routes.dart';
import 'package:SnipSnap/data/models/appointment_model.dart';
import 'package:SnipSnap/generated/l10n.dart';
import 'package:SnipSnap/widgets/appointment_status_badge.dart';
import 'package:SnipSnap/utils/datetime.dart';
import 'package:SnipSnap/utils/text_style.dart';
import 'package:SnipSnap/widgets/strut_text.dart';
import 'package:sprintf/sprintf.dart';

class AppointmentHeader extends StatefulWidget {
  const AppointmentHeader(this.appointment);

  @override
  _AppointmentHeaderState createState() => _AppointmentHeaderState();

  final AppointmentModel appointment;
}

class _AppointmentHeaderState extends State<AppointmentHeader> {
  @override
  Widget build(BuildContext context) {
    if (widget.appointment == null) {
      return Container();
    }

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(
          bottom: kPaddingM,
          left: kPaddingM,
          right: kPaddingM,
          top: kToolbarHeight,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                Flexible(
                  child: StrutText(
                    L10n.of(context).appointmentAt(
                      L10n.of(context).commonWeekdayShort(DOW
                          .values[widget.appointment.requestDate.weekday - 1]),
                      widget.appointment.requestDate.day,
                      L10n.of(context).commonMonthShort(Month
                          .values[widget.appointment.requestDate.month - 1]),
                      widget.appointment.requestDate.year,
                      widget.appointment.requestTime,
                    ),
                    style: Theme.of(context).textTheme.headline4.white.bold,
                    maxLines: 2,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: kPaddingS),
              child: Row(
                children: <Widget>[
                  AppointmentStatusBadge(
                    status: widget.appointment.status,
                    inverse:
                        kPrimaryColor == Theme.of(context).appBarTheme.color,
                  ),
                ],
              ),
            ),
            InkWell(
              onTap: () => Navigator.pushNamed(context, Routes.location,
                  arguments: widget.appointment.location.id),
              child: Padding(
                padding: const EdgeInsets.only(top: kPaddingM),
                child: StrutText(
                  widget.appointment.location.name,
                  style: Theme.of(context).textTheme.headline6.white,
                  maxLines: 1,
                ),
              ),
            ),
            InkWell(
              onTap: () => Navigator.pushNamed(context, Routes.location,
                  arguments: widget.appointment.location.id),
              child: Padding(
                padding: const EdgeInsets.only(top: kPaddingS),
                child: StrutText(
                  sprintf('%s, %s', <String>[
                    widget.appointment.location.address,
                    widget.appointment.location.city
                  ]),
                  style: Theme.of(context)
                      .textTheme
                      .subtitle1
                      .copyWith(color: Colors.white70),
                  maxLines: 1,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: kPaddingS),
              child: StrutText(
                widget.appointment.code,
                style: Theme.of(context).textTheme.subtitle1.white,
                maxLines: 1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
