import 'dart:math';
import 'package:intl/intl.dart';
import 'package:SnipSnap/configs/constants.dart';
import 'package:SnipSnap/data/data_provider.dart';
import 'package:SnipSnap/data/models/appointment_model.dart';
import 'package:SnipSnap/data/models/data_response_model.dart';
import 'package:SnipSnap/data/models/timetable_model.dart';

class AppointmentRepository {
  const AppointmentRepository({
    this.dataProvider = const DataProvider(),
  });

  final DataProvider dataProvider;

  Future<List<AppointmentModel>> getAppointments() async {
    final DataResponseModel rawData = await dataProvider.get('appointments');

    final List<dynamic> _appointments =
        rawData.data['appointments'] as List<dynamic> ?? <dynamic>[];

    return _appointments
        .map<AppointmentModel>((dynamic json) =>
            AppointmentModel.fromJson(json as Map<String, dynamic>))
        .toList();
  }

  Future<List<TimetableModel>> getTimetable(
      {int locationId, int duration}) async {
    final List<TimetableModel> timetables = <TimetableModel>[];
    final DateTime now = DateTime.now();
    final Random rng = Random();

    for (int days = 0; days < kReservationsDateRange; days++) {
      final DateTime dateTime = now.add(Duration(days: days));

      /// Random timetable.
      final List<int> _times = <int>[];

      /// Opening time: between 8h and 12h
      final int openingTime = rng.nextInt(4) + 8;

      /// Closing time: between 16 and 24h
      final int closingTime = rng.nextInt(8) + 16;

      for (int t = openingTime; t <= closingTime; t++) {
        final DateTime dateTimeCandidate =
            DateTime(dateTime.year, dateTime.month, dateTime.day, t, 0, 0);
        if (dateTimeCandidate.millisecondsSinceEpoch >
                now.millisecondsSinceEpoch &&
            rng.nextInt(5) > 1) {
          _times.add(
              DateTime(dateTime.year, dateTime.month, dateTime.day, t, 0, 0)
                  .millisecondsSinceEpoch);
        }
      }

      timetables.add(TimetableModel.fromJson(<String, dynamic>{
        'date': DateFormat('yyyy-MM-dd', 'en')
            .format(now.add(Duration(days: days))),
        'times': _times,
      }));
    }

    return timetables;
  }
}
