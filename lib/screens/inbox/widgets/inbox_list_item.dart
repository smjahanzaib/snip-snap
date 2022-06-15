import 'package:flutter/material.dart';
import 'package:SnipSnap/configs/constants.dart';
import 'package:SnipSnap/configs/routes.dart';
import 'package:SnipSnap/data/models/inbox_model.dart';
import 'package:SnipSnap/widgets/initials_circle_avatar.dart';
import 'package:SnipSnap/widgets/list_item.dart';
import 'package:SnipSnap/utils/string.dart';
import 'package:SnipSnap/utils/text_style.dart';
import 'package:SnipSnap/utils/datetime.dart';
import 'package:SnipSnap/widgets/strut_text.dart';

class InboxListItem extends StatelessWidget {
  const InboxListItem({
    Key key,
    @required this.inbox,
  }) : super(key: key);

  final InboxModel inbox;

  @override
  Widget build(BuildContext context) {
    return ListItem(
      title: inbox.staff.name,
      subtitle: inbox.message.truncateWithEllipsis(32),
      leading: Stack(
        alignment: Alignment.bottomRight,
        children: <Widget>[
          if (inbox.staff.profilePhoto.isNotNullOrEmpty)
            CircleAvatar(
              radius: kCircleAvatarSizeRadiusSmall,
              backgroundImage: AssetImage(inbox.staff.profilePhoto),
            )
          else
            InitialsCircleAvatar(initials: inbox.staff.name.initials),
          if (inbox.unreadMessages > 0)
            Container(
              height: 22,
              width: 22,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.white,
                  width: 2,
                ),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: Colors.grey.withOpacity(.3),
                    offset: const Offset(0, 2),
                    blurRadius: 5,
                  )
                ],
              ),
              child: CircleAvatar(
                backgroundColor: kPrimaryColor,
                radius: 10,
                child: StrutText(
                  inbox.unreadMessages.toString(),
                  style: Theme.of(context).textTheme.caption.white.bold,
                ),
              ),
            )
        ],
      ),
      trailing: Padding(
        padding: const EdgeInsetsDirectional.only(end: kPaddingM),
        child: StrutText(
          inbox.date.toLocalDateString,
          style: Theme.of(context).textTheme.caption,
        ),
      ),
      onPressed: () =>
          Navigator.pushNamed(context, Routes.chat, arguments: inbox.id),
    );
  }
}
