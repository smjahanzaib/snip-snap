class StaffModel {
  StaffModel(
    this.id,
    this.name,
    this.description,
    this.profilePhoto,
    this.rate,
    this.isOnline,
  );

  factory StaffModel.fromJson(Map<String, dynamic> json) {
    final String _profilePhoto = json['profile_photo'] as String ?? '';

    return StaffModel(
      json['id'] as int ?? 0,
      json['name'] as String ?? '',
      json['description'] as String ?? '',
      _profilePhoto.isNotEmpty ? 'assets/images/data/staff/' + _profilePhoto : '',
      json['rate'] as double ?? 0.0,
      json['is_online'] as bool ?? false,
    );
  }

  final int id;
  final String name;
  final String description;
  final String profilePhoto;
  final double rate;
  final bool isOnline;
}
