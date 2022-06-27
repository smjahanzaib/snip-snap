import 'package:SnipSnap/data/models/staff_model.dart';

class InboxModel {
  InboxModel({
    this.id,
    this.message,
    this.staff,
    this.date,
    this.unreadMessages,
  });

  factory InboxModel.fromJson(Map<String, dynamic> json) {
    return InboxModel(
      id: json['id'] as int ?? 0,
      message: json['message'] as String ?? '',
      date: DateTime.tryParse(json['date'] as String ?? '') ?? DateTime.now(),
      staff: StaffModel.fromJson(json['staff'] as Map<String, dynamic>),
      unreadMessages: json['unread_messages'] as int ?? 0,
    );
  }

  final int id;
  final String message;
  final StaffModel staff;
  final DateTime date;
  final int unreadMessages;
}
