import 'package:flutter/material.dart';
import 'package:SnipSnap/configs/constants.dart';
import 'package:SnipSnap/generated/l10n.dart';
import 'package:SnipSnap/utils/datetime.dart';
import 'package:SnipSnap/widgets/strut_text.dart';

/// Vertically scrollable timeline date item.
class TimelineDate extends StatelessWidget {
  const TimelineDate({
    Key key,
    this.isSelected = false,
    this.dateRange = 0,
    this.onTap,
  }) : super(key: key);

  /// Is selected?
  final bool isSelected;

  /// Date range: number of days from today.
  final int dateRange;

  /// Ontap function call.
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final DateTime date = DateTime.now().add(Duration(days: dateRange));

    return InkWell(
      child: Container(
        width: kTimelineDateSize,
        margin: const EdgeInsets.all(3.0),
        decoration: BoxDecoration(
          borderRadius:
              const BorderRadius.all(Radius.circular(kBoxDecorationRadius)),
          color: isSelected ? kPrimaryColor : Theme.of(context).dividerColor,
        ),
        child: Padding(
          padding: const EdgeInsets.all(kPaddingS),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              StrutText(
                dateRange > 0
                    ? L10n.of(context)
                        .commonWeekdayShort(DOW.values[date.weekday - 1])
                    : L10n.of(context).commonWeekdayToday.toUpperCase(),
                style: Theme.of(context).textTheme.bodyText2.copyWith(
                    color: isSelected
                        ? kWhite
                        : Theme.of(context).textTheme.bodyText2.color),
              ),
              StrutText(
                date.day.toString(),
                style: Theme.of(context).textTheme.headline6.copyWith(
                    color: isSelected
                        ? kWhite
                        : Theme.of(context).textTheme.headline6.color),
              ),
              StrutText(
                L10n.of(context)
                    .commonMonthShort(Month.values[date.month - 1])
                    .toUpperCase(),
                style: Theme.of(context).textTheme.bodyText2.copyWith(
                    color: isSelected
                        ? kWhite
                        : Theme.of(context).textTheme.bodyText2.color),
              ),
            ],
          ),
        ),
      ),
      onTap: onTap,
    );
  }
}
