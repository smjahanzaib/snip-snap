import 'package:add_2_calendar/add_2_calendar.dart';
import 'package:flutter/material.dart';
import 'package:SnipSnap/data/models/appointment_model.dart';
import 'package:SnipSnap/generated/l10n.dart';
import 'package:SnipSnap/utils/async.dart';
import 'package:SnipSnap/utils/ui.dart';
import 'package:SnipSnap/widgets/labeled_icon_button.dart';
import 'package:sprintf/sprintf.dart';

class AppointmentTabBar extends StatefulWidget {
  const AppointmentTabBar(
    this.appointment, {
    this.onCancelTap,
    this.onNotesTap,
  });

  @override
  _AppointmentTabBarState createState() => _AppointmentTabBarState();

  final AppointmentModel appointment;
  final VoidCallback onCancelTap;
  final VoidCallback onNotesTap;
}

class _AppointmentTabBarState extends State<AppointmentTabBar> {
  @override
  Widget build(BuildContext context) {
    if (widget.appointment == null ||
        widget.appointment.status != AppointmentStatus.active) {
      return Container();
    }

    final List<Widget> _widgets = <Widget>[];

    if (widget.appointment.location.phone.isNotEmpty) {
      _widgets.add(LabeledIconButton(
        icon: Icons.call,
        text: L10n.of(context).bookingBtnCall,
        onTap: () {
          UI.confirmationDialogBox(
            context,
            message: L10n.of(context)
                .bookingCallConfirmation(widget.appointment.location.phone),
            onConfirmation: () =>
                Async.launchUrl(widget.appointment.location.phone),
          );
        },
        disableTouchWhenLoading: true,
      ));
    }

    _widgets.add(LabeledIconButton(
      icon: Icons.calendar_today,
      text: L10n.of(context).bookingBtnCalendar,
      onTap: () {
        Add2Calendar.addEvent2Cal(Event(
          title: widget.appointment.location.name,
          description: widget.appointment.services.join('\n'),
          location: sprintf('%s, %s', <String>[
            widget.appointment.location.address,
            widget.appointment.location.city
          ]),
          startDate: widget.appointment.appointmentStartDateTime,
          endDate: widget.appointment.appointmentEndDateTime,
        ));
      },
      disableTouchWhenLoading: true,
    ));

    _widgets.add(LabeledIconButton(
      icon: Icons.edit,
      text: L10n.of(context).bookingBtnNotes,
      onTap: widget.onNotesTap,
      disableTouchWhenLoading: true,
    ));

    if (widget.onCancelTap != null) {
      _widgets.add(LabeledIconButton(
        icon: Icons.cancel,
        text: L10n.of(context).bookingBtnCancel,
        onTap: widget.onCancelTap,
        disableTouchWhenLoading: true,
      ));
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: _widgets,
    );
  }
}
