import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:SnipSnap/blocs/chat/chat_bloc.dart';
import 'package:SnipSnap/configs/constants.dart';
import 'package:SnipSnap/data/models/chat_message_model.dart';
import 'package:SnipSnap/data/models/chat_session_model.dart';
import 'package:SnipSnap/generated/l10n.dart';
import 'package:SnipSnap/screens/inbox/widgets/chat_list_item.dart';
import 'package:SnipSnap/utils/form_utils.dart';
import 'package:SnipSnap/widgets/loading_overlay.dart';
import 'package:SnipSnap/utils/string.dart';
import 'package:SnipSnap/utils/text_style.dart';
import 'package:SnipSnap/widgets/portrait_mode_mixin.dart';
import 'package:SnipSnap/widgets/pull_to_refresh.dart';
import 'package:SnipSnap/widgets/strut_text.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({
    Key key,
    this.sessionId,
  }) : super(key: key);

  final int sessionId;

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen>
    with PortraitStatefulModeMixin<ChatScreen> {
  final RefreshController _controller =
      RefreshController(initialRefresh: false);
  final TextEditingController _textController = TextEditingController();

  ChatSessionModel _session;

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    BlocProvider.of<ChatBloc>(context)
        .add(MessagesLoadedChatEvent(sessionId: widget.sessionId));
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
    super.build(context);

    return BlocBuilder<ChatBloc, ChatState>(
      builder: (BuildContext context, ChatState state) {
        if (state is LoadMessagesSuccessChatState) {
          _session = state.session;
        }

        return Scaffold(
          appBar: AppBar(
            title: _appBarTitle(),
            actions: <Widget>[
              IconButton(
                icon: const Icon(Icons.videocam),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(Icons.phone),
                onPressed: () {},
              ),
            ],
          ),
          body: SafeArea(
            child: LoadingOverlay(
              isLoading: state is LoadMessagesInProgressChatState,
              child: _messages(),
            ),
          ),
        );
      },
    );
  }

  Widget _appBarTitle() {
    if (_session == null) {
      return Container();
    }

    return Row(
      children: <Widget>[
        if (_session.staff.profilePhoto.isNotNullOrEmpty)
          CircleAvatar(
            radius: kCircleAvatarSizeRadiusAppBar,
            backgroundImage: AssetImage(_session.staff.profilePhoto),
          ),
        const SizedBox(width: kPaddingS),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(_session.staff.name),
              if (_session.staff.isOnline)
                StrutText(
                  L10n.of(context).chatOnlineLabel,
                  style: Theme.of(context).textTheme.caption.white.w500,
                )
            ],
          ),
        ),
      ],
    );
  }

  void _postMessage() {
    if (_textController.text.isEmpty) {
      return;
    }

    setState(() {
      _session.messages.add(ChatMessageModel(
        id: 9999,
        message: _textController.text,
        date: DateTime.now(),
        status: ChatMessageStatus.sent,
      ));
    });

    _textController.text = '';

    FormUtils.hideKeyboard(context);
  }

  Widget _messages() {
    if (_session == null) {
      return Container();
    }

    return Column(
      children: <Widget>[
        Expanded(
          child: PullToRefresh(
            onRefresh: _onRefresh,
            onLoading: _onLoading,
            controller: _controller,
            child: ListView.builder(
              padding: const EdgeInsets.all(kPaddingM),
              itemCount: _session.messages.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: kPaddingM),
                  child: ChatListItem(
                    message: _session.messages[index],
                    staff: _session.staff,
                  ),
                );
              },
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: kPaddingS),
          child: Container(
            padding: const EdgeInsets.only(top: kPaddingS),
            decoration: BoxDecoration(
              //color: Theme.of(context).cardColor,
              border: Border(
                top: BorderSide(
                  width: 1,
                  color: Theme.of(context).highlightColor,
                ),
              ),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: kPaddingM),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(kFormFieldsRadius),
                      color: Theme.of(context).inputDecorationTheme.fillColor,
                      border:
                          Border.all(color: Theme.of(context).highlightColor),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: L10n.of(context).chatPlaceholder,
                              border: InputBorder.none,
                            ),
                            controller: _textController,
                            onSubmitted: (String value) => _postMessage(),
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.attach_file),
                          onPressed: () {},
                        ),
                        IconButton(
                          icon: const Icon(Icons.face),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
