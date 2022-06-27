import 'package:SnipSnap/data/data_provider.dart';
import 'package:SnipSnap/data/models/chat_session_model.dart';
import 'package:SnipSnap/data/models/data_response_model.dart';
import 'package:SnipSnap/data/models/inbox_model.dart';

class ChatRepository {
  const ChatRepository({
    this.dataProvider = const DataProvider(),
  });

  final DataProvider dataProvider;

  Future<List<InboxModel>> getInbox() async {
    final DataResponseModel rawData = await dataProvider.get('inbox');

    final List<dynamic> _ratings =
        rawData.data['inbox'] as List<dynamic> ?? <dynamic>[];

    return _ratings
        .map<InboxModel>(
            (dynamic json) => InboxModel.fromJson(json as Map<String, dynamic>))
        .toList();
  }

  Future<ChatSessionModel> getChatSession({int sessionId}) async {
    final DataResponseModel rawData =
        await dataProvider.get('messages_' + sessionId.toString());

    return ChatSessionModel.fromJson(
        rawData.data['session'] as Map<String, dynamic>);
  }
}
