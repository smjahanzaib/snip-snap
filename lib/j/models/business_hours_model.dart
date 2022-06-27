class BusinessHoursModel {
  BusinessHoursModel(
    this.dayOfWeek,
    this.startTime,
    this.endTime,
  );

  factory BusinessHoursModel.fromJson(Map<String, dynamic> json, {String key = ''}) {
    if (key.isNotEmpty) {
      json = json[key] as Map<String, dynamic> ?? <String, dynamic>{};
    }

    return BusinessHoursModel(
      json['dow'] as int ?? 0,
      json['start_time'] as String ?? '',
      json['end_time'] as String ?? '',
    );
  }

  final int dayOfWeek;
  final String startTime;
  final String endTime;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'dow': dayOfWeek,
        'start_time': startTime,
        'end_time': endTime,
      };
}
