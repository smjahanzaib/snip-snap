import 'package:flutter/material.dart';
import 'package:SnipSnap/configs/app_globals.dart';
import 'package:SnipSnap/configs/constants.dart';
import 'package:SnipSnap/generated/l10n.dart';
import 'package:SnipSnap/main.dart';
import 'package:SnipSnap/utils/bottom_bar_items.dart';
import 'package:SnipSnap/utils/text_style.dart';
import 'package:SnipSnap/widgets/link_button.dart';
import 'package:SnipSnap/widgets/strut_text.dart';
import 'package:SnipSnap/widgets/theme_button.dart';

class AppointmentsWelcomeScreen extends StatelessWidget {
  const AppointmentsWelcomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: kPaddingL),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(
                top: kPaddingL,
                bottom: kPaddingS,
              ),
              child: Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  Container(
                    width: 128,
                    height: 128,
                    decoration: BoxDecoration(
                      color: Theme.of(context).highlightColor,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(kCardRadius)),
                    ),
                  ),
                  Icon(
                    Icons.date_range,
                    size: 90,
                    color: Theme.of(context).hintColor,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: kPaddingS,
                bottom: kPaddingS,
              ),
              child: StrutText(
                L10n.of(context).appointmentsWelcomeTitle,
                style: Theme.of(context).textTheme.headline5.w800,
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: kPaddingS,
                bottom: kPaddingL,
              ),
              child: StrutText(
                L10n.of(context).appointmentsWelcomeSubtitle,
                style: Theme.of(context).textTheme.subtitle1.fs18,
                textAlign: TextAlign.center,
              ),
            ),
            ThemeButton(
              text: L10n.of(context).appointmentsBtnExplore,
              onPressed: () {
                (getIt.get<AppGlobals>().globalKeyBottomBar.currentWidget
                        as BottomNavigationBar)
                    .onTap(getIt
                        .get<BottomBarItems>()
                        .getBottomBarItem('explore'));
              },
            ),
            const Padding(padding: EdgeInsets.only(top: kPaddingL)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                StrutText(
                  L10n.of(context).appointmentsWelcomeSignInLabel,
                  style: Theme.of(context).textTheme.subtitle1,
                ),
                LinkButton(
                  padding: const EdgeInsetsDirectional.only(start: kPaddingS),
                  label: L10n.of(context).appointmentsWelcomeSignInBtn,
                  onPressed: () {
                    (getIt.get<AppGlobals>().globalKeyBottomBar.currentWidget
                            as BottomNavigationBar)
                        .onTap(getIt
                            .get<BottomBarItems>()
                            .getBottomBarItem('profile'));
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
