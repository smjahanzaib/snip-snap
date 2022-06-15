import 'package:flutter/material.dart';
import 'package:SnipSnap/configs/constants.dart';
import 'package:SnipSnap/configs/routes.dart';
import 'package:SnipSnap/data/models/appointment_model.dart';
import 'package:SnipSnap/generated/l10n.dart';
import 'package:SnipSnap/widgets/appointment_status_badge.dart';
import 'package:SnipSnap/utils/string.dart';
import 'package:SnipSnap/utils/datetime.dart';
import 'package:SnipSnap/utils/text_style.dart';
import 'package:SnipSnap/widgets/card_divider.dart';
import 'package:SnipSnap/widgets/link_button.dart';
import 'package:SnipSnap/widgets/star_rating.dart';
import 'package:SnipSnap/widgets/strut_text.dart';
import 'package:sprintf/sprintf.dart';

class AppointmentsListItem extends StatelessWidget {
  const AppointmentsListItem({
    Key key,
    this.appointment,
    this.routeName = '',
    this.leftMargin = kPaddingM,
    this.rightMargin = kPaddingM,
  }) : super(key: key);

  final AppointmentModel appointment;
  final String routeName;
  final double leftMargin;
  final double rightMargin;

  void openRatingScreen(BuildContext context) {
    Navigator.pushNamed(context, Routes.appointmentRating,
        arguments: appointment);
  }

  @override
  Widget build(BuildContext context) {
    Color _dateTimeColor;

    switch (appointment.status) {
      case AppointmentStatus.declined:
      case AppointmentStatus.failed:
      case AppointmentStatus.canceled:
        _dateTimeColor = Theme.of(context).hintColor;
        break;
      case AppointmentStatus.active:
        _dateTimeColor = null;
        break;
      // case AppointmentStatus.completed:
      //   _dateTimeColor = Colors.green;
      //   break;
      default:
        _dateTimeColor = null;
    }

    return InkWell(
      onTap: () {
        if (routeName.isNotNullOrEmpty) {
          Navigator.pushNamed(context, routeName, arguments: appointment);
        }
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(kBoxDecorationRadius),
        ),
        margin: EdgeInsetsDirectional.only(
          start: leftMargin,
          end: rightMargin,
          bottom: kPaddingS,
          top: kPaddingS,
        ),
        elevation: 1,
        child: Column(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(kPaddingM),
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: const BorderRadiusDirectional.only(
                  topStart: Radius.circular(kBoxDecorationRadius),
                  topEnd: Radius.circular(kBoxDecorationRadius),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  StrutText(
                    L10n.of(context).commonWeekdayShort(
                            DOW.values[appointment.requestDate.weekday - 1]) +
                        ', ' +
                        appointment.requestDate.toLocalDateString,
                    style: Theme.of(context)
                        .textTheme
                        .headline5
                        .bold
                        .copyWith(color: _dateTimeColor),
                  ),
                  StrutText(
                    appointment.requestTime,
                    style: Theme.of(context)
                        .textTheme
                        .headline5
                        .bold
                        .copyWith(color: _dateTimeColor),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.only(
                  left: kPaddingM, right: kPaddingM, bottom: kPaddingM),
              color: Theme.of(context).cardColor,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      StrutText(
                        appointment.location.name,
                        style: Theme.of(context).textTheme.subtitle1.w500.fs18,
                      ),
                      const Padding(
                          padding: EdgeInsets.only(top: kPaddingS / 2)),
                      StrutText(
                        appointment.location.address,
                        style: Theme.of(context).textTheme.bodyText2.copyWith(
                              color: Theme.of(context).hintColor,
                              fontWeight: FontWeight.normal,
                            ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: Container(
                      padding:
                          const EdgeInsetsDirectional.only(start: kPaddingS),
                      child: Column(
                        //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          StrutText(
                            L10n.of(context).commonCurrencyFormat(sprintf(
                                '%.2f', <double>[appointment.totalPrice])),
                            style: Theme.of(context).textTheme.subtitle1.fs18,
                          ),
                          const Padding(
                              padding: EdgeInsets.only(top: kPaddingS / 2)),
                          StrutText(
                            L10n.of(context).commonDurationFormat(
                                appointment.totalDuration),
                            style: Theme.of(context)
                                .textTheme
                                .bodyText2
                                .w400
                                .copyWith(color: Theme.of(context).hintColor),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              //padding: const EdgeInsets.all(2),
              margin: EdgeInsetsDirectional.only(
                  start: leftMargin, end: rightMargin),
              color: Theme.of(context).cardColor,
              child: const CardDivider(),
            ),
            Container(
              padding: const EdgeInsets.all(kPaddingM),
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: const BorderRadiusDirectional.only(
                  bottomStart: Radius.circular(kBoxDecorationRadius),
                  bottomEnd: Radius.circular(kBoxDecorationRadius),
                ),
              ),
              child: _reservationStatus(context, appointment),
            ),
          ],
        ),
      ),
    );
  }

  Widget _reservationStatus(
      BuildContext context, AppointmentModel appointment) {
    switch (appointment.status) {
      case AppointmentStatus.declined:
      case AppointmentStatus.failed:
      case AppointmentStatus.canceled:
        return Row(
          //mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            AppointmentStatusBadge(status: appointment.status),
          ],
        );
        break;
      case AppointmentStatus.completed:
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            StarRating(
              rating: 0,
              color: Colors.grey,
              borderColor: Colors.grey,
              onRatingChanged: (double rating) => openRatingScreen(context),
            ),
            LinkButton(
              onPressed: () => openRatingScreen(context),
              label: L10n.of(context).appointmentsLabelReview,
            ),
            AppointmentStatusBadge(status: appointment.status),
          ],
        );
        break;
      case AppointmentStatus.active:
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            StrutText(
              appointment.appointmentStartDateTime
                  .remainingTime(context)
                  .toUpperCase(),
              style: Theme.of(context).textTheme.bodyText2.w500.primaryColor,
            ),
            AppointmentStatusBadge(status: appointment.status),
          ],
        );
        break;
      default:
        return Container();
    }
  }
}
