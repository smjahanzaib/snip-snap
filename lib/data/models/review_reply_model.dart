import 'package:intl/intl.dart';

class ReviewReplyModel {
  ReviewReplyModel({
    this.replyDate,
    this.comment,
  });

  factory ReviewReplyModel.fromJson(Map<String, dynamic> json) {
    final String _replyDate = json['reply_date'] as String ?? DateFormat('yyyy-MM-dd', 'en').format(DateTime.now());

    return ReviewReplyModel(
      replyDate: DateTime.tryParse(_replyDate),
      comment: json['comment'] as String ?? '',
    );
  }

  final DateTime replyDate;
  final String comment;
}
