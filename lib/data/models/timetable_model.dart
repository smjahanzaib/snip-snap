class TimetableModel {
  TimetableModel(this.date, this.timestamps);

  factory TimetableModel.fromJson(Map<String, dynamic> json, {String key = ''}) {
    if (key.isNotEmpty) {
      json = json[key] as Map<String, dynamic> ?? <String, dynamic>{};
    }

    final List<dynamic> _timestamps = json['times'] as List<dynamic> ?? <dynamic>[];

    return TimetableModel(
      DateTime.tryParse(json['date'] as String ?? '') ?? DateTime.now(),
      _timestamps.map<int>((dynamic val) => val as int).toList(),
    );
  }

  final DateTime date;
  final List<int> timestamps;

  @override
  String toString() => 'TimetableModel<date: $date, timestamps: $timestamps>';
}
