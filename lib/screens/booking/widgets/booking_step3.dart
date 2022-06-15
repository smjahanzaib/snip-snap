import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:SnipSnap/blocs/booking/booking_bloc.dart';
import 'package:SnipSnap/configs/constants.dart';
import 'package:SnipSnap/data/models/booking_session_model.dart';
import 'package:SnipSnap/data/models/timetable_model.dart';
import 'package:SnipSnap/generated/l10n.dart';
import 'package:SnipSnap/utils/text_style.dart';
import 'package:SnipSnap/utils/datetime.dart';
import 'package:SnipSnap/widgets/jumbotron.dart';
import 'package:SnipSnap/widgets/list_item.dart';
import 'package:SnipSnap/widgets/strut_text.dart';
import 'package:SnipSnap/widgets/timeline_date.dart';

class BookingStep3 extends StatefulWidget {
  @override
  _BookingStep3State createState() => _BookingStep3State();
}

class _BookingStep3State extends State<BookingStep3> {
  final ScrollController _controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookingBloc, BookingState>(
      builder: (BuildContext context, BookingState state) {
        final BookingSessionModel session =
            (state as SessionRefreshSuccessBookingState).session;

        final DateTime selectedDate =
            DateTime.now().add(Duration(days: session.selectedDateRange));
        final TimetableModel timetableModel = session.timetables != null
            ? session.timetables.firstWhere((TimetableModel t) {
                return t.date.day == selectedDate.day &&
                    t.date.month == selectedDate.month &&
                    t.date.year == selectedDate.year;
              }, orElse: () => null)
            : null;

        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(kPaddingM),
                child: StrutText(
                  L10n.of(context).bookingSubtitleDate,
                  style: Theme.of(context).textTheme.headline5.w600,
                ),
              ),
              Container(
                child: Container(
                  height: kTimelineDateSize,
                  child: ListView.builder(
                    padding: const EdgeInsetsDirectional.only(start: kPaddingM),
                    itemCount: kReservationsDateRange,
                    scrollDirection: Axis.horizontal,
                    controller: _controller,
                    itemBuilder: (BuildContext context, int index) {
                      return TimelineDate(
                        dateRange: index,
                        isSelected: session.selectedDateRange == index,
                        onTap: () {
                          if (session.selectedDateRange != index) {
                            context
                                .read<BookingBloc>()
                                .add(DateRangeSetBookingEvent(index));
                          }
                        },
                      );
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(kPaddingM),
                child: StrutText(
                  L10n.of(context).bookingSubtitleTime,
                  style: Theme.of(context).textTheme.headline6.w600,
                ),
              ),
              if (timetableModel != null &&
                  timetableModel.timestamps.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: kPaddingM),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: List<ListItem>.generate(
                        timetableModel.timestamps.length, (int index) {
                      return _timetableItem(timetableModel.timestamps[index],
                          session.selectedTimestamp);
                    }),
                  ),
                )
              else
                Center(
                  child: Jumbotron(
                    title: session.selectedStaff == null ||
                            session.selectedStaff.id == 0
                        ? L10n.of(context).bookingWarningNoSlots
                        : L10n.of(context).bookingWarningStaffUnavailable(
                            session.selectedStaff.name),
                    icon: Icons.access_time,
                    padding: const EdgeInsets.only(top: kPaddingM),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }

  ListItem _timetableItem(int timestamp, int selectedTimestamp) {
    final DateTime date = DateTime.fromMillisecondsSinceEpoch(timestamp);

    return ListItem(
      leading: Padding(
        padding: const EdgeInsets.only(top: kPaddingS / 2),
        child: Radio<int>(
          value: timestamp,
          groupValue: selectedTimestamp,
          onChanged: (int selected) => selectTimestampEvent(timestamp),
        ),
      ),
      title: date.toLocalTimeString,
      onPressed: () => selectTimestampEvent(timestamp),
    );
  }

  void selectTimestampEvent(int timestamp) {
    context.read<BookingBloc>().add(TimestampSelectedBookingEvent(timestamp));
  }
}
