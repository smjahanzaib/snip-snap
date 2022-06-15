import 'package:intl/intl.dart';
import 'package:SnipSnap/data/models/location_model.dart';
import 'package:SnipSnap/data/models/review_reply_model.dart';
import 'package:SnipSnap/data/models/user_model.dart';

class ReviewModel {
  ReviewModel({
    this.id,
    this.reviewDate,
    this.rate,
    this.comment,
    this.user,
    this.reply,
    this.location,
  });

  factory ReviewModel.fromJson(Map<String, dynamic> json) {
    final String _reviewDate = json['review_date'] as String ??
        DateFormat('yyyy-MM-dd', 'en').format(DateTime.now());

    return ReviewModel(
      id: json['review_id'] as int ?? 0,
      reviewDate: DateTime.tryParse(_reviewDate),
      rate: json['rate'] as double ?? 0.0,
      comment: json['comment'] as String ?? '',
      user: json.containsKey('user')
          ? UserModel.fromJson(json['user'] as Map<String, dynamic>)
          : null,
      reply: json.containsKey('reply')
          ? ReviewReplyModel.fromJson(json['reply'] as Map<String, dynamic>)
          : null,
      location: json.containsKey('location')
          ? LocationModel.fromJson(json['location'] as Map<String, dynamic>)
          : null,
    );
  }

  final int id;
  final DateTime reviewDate;
  final double rate;
  final String comment;
  final UserModel user;
  final ReviewReplyModel reply;
  final LocationModel location;
}
