import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:SnipSnap/data/models/chat_session_model.dart';
import 'package:SnipSnap/data/models/inbox_model.dart';
import 'package:SnipSnap/data/repositories/chat_repository.dart';

part 'chat_event.dart';
part 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  ChatBloc() : super(InitialChatState());

  @override
  Stream<ChatState> mapEventToState(ChatEvent event) async* {
    if (event is InboxLoadedChatEvent) {
      yield* _mapLoadInboxChatEventToState(event);
    } else if (event is MessagesLoadedChatEvent) {
      yield* _mapLoadMessagesChatEventToState(event);
    }
  }

  Stream<ChatState> _mapLoadInboxChatEventToState(
      InboxLoadedChatEvent event) async* {
    yield LoadInboxInProgressChatState();

    final List<InboxModel> _messages = await const ChatRepository().getInbox();

    yield LoadInboxSuccessChatState(_messages);
  }

  Stream<ChatState> _mapLoadMessagesChatEventToState(
      MessagesLoadedChatEvent event) async* {
    yield LoadMessagesInProgressChatState();

    final ChatSessionModel _session =
        await const ChatRepository().getChatSession(sessionId: event.sessionId);

    yield LoadMessagesSuccessChatState(_session);
  }
}
