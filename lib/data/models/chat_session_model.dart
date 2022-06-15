import 'package:SnipSnap/data/models/chat_message_model.dart';
import 'package:SnipSnap/data/models/location_model.dart';
import 'package:SnipSnap/data/models/staff_model.dart';

class ChatSessionModel {
  ChatSessionModel({
    this.id,
    this.staff,
    this.location,
    this.messages,
  });

  factory ChatSessionModel.fromJson(Map<String, dynamic> json) {
    final List<dynamic> _messages =
        json['messages'] as List<dynamic> ?? <dynamic>[];

    return ChatSessionModel(
      id: json['id'] as int ?? 0,
      location:
          LocationModel.fromJson(json['location'] as Map<String, dynamic>),
      staff: StaffModel.fromJson(json['staff'] as Map<String, dynamic>),
      messages: _messages
          .map<ChatMessageModel>((dynamic json) =>
              ChatMessageModel.fromJson(json as Map<String, dynamic>))
          .toList(),
    );
  }

  final int id;
  final StaffModel staff;
  final LocationModel location;
  final List<ChatMessageModel> messages;
}
