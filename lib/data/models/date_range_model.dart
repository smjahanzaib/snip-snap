class DateRangeModel {
  DateRangeModel(
    this.label,
    this.range,
  );

  factory DateRangeModel.fromJson(Map<String, dynamic> json) {
    return DateRangeModel(
      json['label'] as String ?? '',
      json['range'] as int ?? 0,
    );
  }

  final String label;
  final int range;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'label': label,
        'range': range,
      };
}
