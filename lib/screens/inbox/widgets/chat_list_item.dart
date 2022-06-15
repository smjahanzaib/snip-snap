import 'package:flutter/material.dart';
import 'package:SnipSnap/configs/constants.dart';
import 'package:SnipSnap/data/models/chat_message_model.dart';
import 'package:SnipSnap/data/models/staff_model.dart';
import 'package:SnipSnap/utils/text_style.dart';
import 'package:SnipSnap/utils/datetime.dart';
import 'package:SnipSnap/utils/string.dart';
import 'package:SnipSnap/widgets/initials_circle_avatar.dart';
import 'package:SnipSnap/widgets/strut_text.dart';

class ChatListItem extends StatelessWidget {
  const ChatListItem({
    Key key,
    @required this.message,
    this.staff,
  }) : super(key: key);

  final ChatMessageModel message;
  final StaffModel staff;

  @override
  Widget build(BuildContext context) {
    if (message.isSent) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Container(
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width * .66,
              maxHeight: MediaQuery.of(context).size.width * .3,
            ),
            decoration: BoxDecoration(
              color: Theme.of(context).accentColor,
              borderRadius: const BorderRadiusDirectional.only(
                topStart: Radius.circular(kBoxDecorationRadius),
                topEnd: Radius.circular(kBoxDecorationRadius),
                bottomStart: Radius.circular(kBoxDecorationRadius),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(kPaddingS),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  StrutText(
                    message.message,
                    style: Theme.of(context).textTheme.bodyText2.white,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: kPaddingS),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        StrutText(
                          message.date.toLocalDateTimeString,
                          style: Theme.of(context)
                              .textTheme
                              .caption
                              .copyWith(color: kWhite.withAlpha(200)),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      );
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        if (staff.profilePhoto.isNotNullOrEmpty)
          CircleAvatar(
            radius: kCircleAvatarSizeRadiusSmall,
            backgroundImage: AssetImage(staff.profilePhoto),
          )
        else
          InitialsCircleAvatar(initials: staff.name.initials),
        const SizedBox(width: kPaddingS),
        Container(
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width * .66,
            maxHeight: MediaQuery.of(context).size.width * .3,
          ),
          decoration: BoxDecoration(
            color: Theme.of(context).highlightColor,
            borderRadius: const BorderRadiusDirectional.only(
              topEnd: Radius.circular(kBoxDecorationRadius),
              bottomStart: Radius.circular(kBoxDecorationRadius),
              bottomEnd: Radius.circular(kBoxDecorationRadius),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(kPaddingS),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                StrutText(
                  message.message,
                  style: Theme.of(context).textTheme.bodyText2,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: kPaddingS),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      StrutText(
                        message.date.toLocalDateTimeString,
                        style: Theme.of(context).textTheme.caption,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
