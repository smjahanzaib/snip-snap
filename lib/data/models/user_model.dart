class UserModel {
  UserModel(
      this._id,
      this.id,
      this.fullName,
      this.profilePhoto,
      this.email,
      this.phone,
      this.city,
      this.zip,
      this.address,
      this.upcomingAppointments,
      this.activeVouchers,
      this.role,
      this.salon);

  factory UserModel.fromJson(Map<String, dynamic> json) {
    final String _profilePhoto = json['profile_photo'] as String ?? '';

    return UserModel(
      json['_id'] as String ?? '',
      json['user_id'] as int ?? 0,
      json['full_name'] as String ?? json['fullName'] as String ?? '',
      _profilePhoto.isNotEmpty
          ? 'assets/images/data/users/' + _profilePhoto
          : '',
      json['email'] as String ?? '',
      json['phone'] as String ?? '',
      json['city'] as String ?? '',
      json['zip'] as String ?? '',
      json['address'] as String ?? '',
      json['upcoming_appointments'] as int ?? 0,
      json['active_vouchers'] as int ?? 0,
      json['role'] as String ?? 'user',
      json['salon'] as dynamic ?? {},
    );
  }

  final int id;
  final String fullName;
  final String profilePhoto;
  final String email;
  final String phone;
  final String city;
  final String zip;
  final String address;
  final int upcomingAppointments;
  final int activeVouchers;
  final String _id;
  String role;
  dynamic salon;
}
