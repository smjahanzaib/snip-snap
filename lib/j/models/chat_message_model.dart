enum ChatMessageStatus { received, read, sent, unknown }

class ChatMessageModel {
  ChatMessageModel({
    this.id,
    this.message,
    this.date,
    this.status,
  });

  factory ChatMessageModel.fromJson(Map<String, dynamic> json) {
    return ChatMessageModel(
      id: json['id'] as int ?? 0,
      message: json['message'] as String ?? '',
      date: DateTime.tryParse(json['date'] as String ?? '') ?? DateTime.now(),
      status: setStatus(json['status'] as String ?? ''),
    );
  }

  static ChatMessageStatus setStatus(String type) {
    switch (type) {
      case 'received':
        return ChatMessageStatus.received;
      case 'read':
        return ChatMessageStatus.read;
      case 'sent':
        return ChatMessageStatus.sent;
      default:
        return ChatMessageStatus.unknown;
    }
  }

  static String getStatus(ChatMessageStatus type) {
    switch (type) {
      case ChatMessageStatus.received:
        return 'received';
      case ChatMessageStatus.read:
        return 'read';
      case ChatMessageStatus.sent:
        return 'sent';
      default:
        return '';
    }
  }

  bool get isSent {
    return status == ChatMessageStatus.sent;
  }

  final int id;
  final String message;
  final DateTime date;
  final ChatMessageStatus status;
}
