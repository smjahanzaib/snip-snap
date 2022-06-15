part of 'chat_bloc.dart';

abstract class ChatEvent {
  @override
  String toString() => '$runtimeType';
}

class InboxLoadedChatEvent extends ChatEvent {}

class MessagesLoadedChatEvent extends ChatEvent {
  MessagesLoadedChatEvent({this.sessionId});

  final int sessionId;
}
