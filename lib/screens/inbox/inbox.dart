import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:SnipSnap/blocs/chat/chat_bloc.dart';
import 'package:SnipSnap/configs/constants.dart';
import 'package:SnipSnap/data/models/inbox_model.dart';
import 'package:SnipSnap/generated/l10n.dart';
import 'package:SnipSnap/screens/inbox/widgets/inbox_list_item.dart';
import 'package:SnipSnap/widgets/pull_to_refresh.dart';

class InboxScreen extends StatefulWidget {
  const InboxScreen({Key key}) : super(key: key);

  @override
  _InboxScreenState createState() => _InboxScreenState();
}

class _InboxScreenState extends State<InboxScreen> {
  final RefreshController _controller =
      RefreshController(initialRefresh: false);
  final SlidableController _slideController = SlidableController();

  List<InboxModel> _messages;

  @override
  void initState() {
    super.initState();

    BlocProvider.of<ChatBloc>(context).add(InboxLoadedChatEvent());
  }

  /// Callback for footer [SmartRefresher].
  ///
  /// You should use [RefreshController] to end loading state.
  Future<void> _onLoading() async {
    await Future<int>.delayed(const Duration(seconds: 1));
    _controller.loadComplete();
  }

  /// Callback for header [SmartRefresher].
  ///
  /// You should use [RefreshController] to end loading state.
  Future<void> _onRefresh() async {
    await Future<int>.delayed(const Duration(seconds: 1));
    _controller.refreshCompleted();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatBloc, ChatState>(
      builder: (BuildContext context, ChatState state) {
        if (state is LoadInboxSuccessChatState) {
          _messages = state.messages;
        }

        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(L10n.of(context).inboxTitle),
          ),
          body: SafeArea(
            child: PullToRefresh(
              onRefresh: _onRefresh,
              onLoading: _onLoading,
              controller: _controller,
              child: Padding(
                padding: const EdgeInsetsDirectional.only(start: kPaddingM),
                child: _messageList(),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _messageList() {
    if (_messages == null) {
      return Container();
    }

    return ListView.builder(
      itemCount: _messages.length,
      itemBuilder: (BuildContext context, int index) {
        return Slidable(
          controller: _slideController,
          actionPane: const SlidableDrawerActionPane(),
          child: InboxListItem(inbox: _messages[index]),
          secondaryActions: <Widget>[
            IconSlideAction(
              caption: L10n.of(context).inboxSlideButtonArchive,
              color: Theme.of(context).hintColor,
              icon: Icons.archive,
              onTap: () {},
            ),
            IconSlideAction(
              caption: L10n.of(context).inboxSlideButtonDelete,
              color: Colors.red,
              icon: Icons.delete,
              onTap: () {},
            ),
          ],
        );
      },
    );
  }
}
