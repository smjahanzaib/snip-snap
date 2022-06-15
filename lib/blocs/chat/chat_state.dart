part of 'chat_bloc.dart';

abstract class ChatState {
  @override
  String toString() => '$runtimeType';
}

class InitialChatState extends ChatState {}

class LoadInboxInProgressChatState extends ChatState {}

class LoadMessagesInProgressChatState extends ChatState {}

class LoadInboxSuccessChatState extends ChatState {
  LoadInboxSuccessChatState(this.messages);

  final List<InboxModel> messages;
}

class LoadMessagesSuccessChatState extends ChatState {
  LoadMessagesSuccessChatState(this.session);

  final ChatSessionModel session;
}
