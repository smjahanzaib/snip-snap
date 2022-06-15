import 'package:flutter/material.dart';
import 'package:SnipSnap/configs/app_globals.dart';
import 'package:SnipSnap/configs/constants.dart';
import 'package:SnipSnap/main.dart';
import 'package:SnipSnap/utils/text_style.dart';
import 'package:SnipSnap/widgets/strut_text.dart';

enum InitialsCircleAvatarSize { small, large }

class InitialsCircleAvatar extends StatelessWidget {
  const InitialsCircleAvatar({
    Key key,
    @required this.initials,
    this.size = InitialsCircleAvatarSize.small,
  }) : super(key: key);

  final String initials;
  final InitialsCircleAvatarSize size;

  @override
  Widget build(BuildContext context) {
    final bool isSmall = size == InitialsCircleAvatarSize.small;

    TextStyle textStyle;

    if (isSmall) {
      textStyle = getIt.get<AppGlobals>().isPlatformBrightnessDark
          ? Theme.of(context)
              .textTheme
              .subtitle1
              .bold
              .copyWith(color: kWhite.withAlpha(128))
          : Theme.of(context).textTheme.subtitle1.bold.white;
    } else {
      textStyle = getIt.get<AppGlobals>().isPlatformBrightnessDark
          ? Theme.of(context)
              .textTheme
              .headline3
              .bold
              .copyWith(color: kWhite.withAlpha(128))
          : Theme.of(context).textTheme.headline3.bold.white;
    }

    return CircleAvatar(
      radius:
          isSmall ? kCircleAvatarSizeRadiusSmall : kCircleAvatarSizeRadiusLarge,
      backgroundColor: getIt.get<AppGlobals>().isPlatformBrightnessDark
          ? kWhite.withAlpha(20)
          : kPrimaryColor.withAlpha(64),
      child: StrutText(
        initials,
        style: textStyle,
      ),
    );
  }
}
