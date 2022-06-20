import 'package:SnipSnap/vendor/models/businessLayer/baseRoute.dart';
import 'package:SnipSnap/vendor/screens/chooseSignUpSignInScreen.dart';
import 'package:flutter/material.dart';
import 'package:SnipSnap/generated/l10n.dart';
import 'package:introduction_screen/introduction_screen.dart';

class IntroScreen extends BaseRoute {
  IntroScreen({a, o}) : super(a: a, o: o, r: 'IntroScreen');
  @override
  _IntroScreenState createState() => new _IntroScreenState();
}

class _IntroScreenState extends BaseRouteState {
  _IntroScreenState() : super();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return exitAppDialog();
      },
      child: Scaffold(
          body: Stack(children: [
        IntroductionScreen(
          dotsDecorator: DotsDecorator(
            activeSize: const Size(28, 12),
            size: const Size(17, 12),
            activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(50.0))),
            activeColor: Theme.of(context).primaryColor,
            color: Theme.of(context).primaryColorLight,
          ),
          showNextButton: false,
          showSkipButton: false,
          pages: [
            PageViewModel(
              decoration: PageDecoration(
                descriptionPadding: EdgeInsets.only(left: 28, right: 28),
                titleTextStyle: Theme.of(context).primaryTextTheme.headline3,
                titlePadding:
                    EdgeInsets.only(top: 60, bottom: 10, right: 35, left: 35),
                contentPadding: const EdgeInsets.only(bottom: 35),
                bodyTextStyle: Theme.of(context).primaryTextTheme.subtitle2,
              ),
              image: Container(
                padding: EdgeInsets.only(top: 10),
                child: Image.asset(
                  'assets/intro_1.png',
                  fit: BoxFit.cover,
                ),
              ),
              title: L10n.of(context).txt_easy_to_find_customer,
              body: L10n.of(context).txt_easy_to_find_customer_detail_text,
            ),
            PageViewModel(
              decoration: PageDecoration(
                descriptionPadding: EdgeInsets.only(left: 28, right: 28),
                titleTextStyle: Theme.of(context).primaryTextTheme.headline3,
                titlePadding:
                    EdgeInsets.only(top: 60, bottom: 10, right: 35, left: 35),
                contentPadding: EdgeInsets.only(bottom: 35),
                bodyTextStyle: Theme.of(context).primaryTextTheme.subtitle2,
              ),
              image: Container(
                padding: EdgeInsets.only(top: 40),
                child: Image.asset(
                  'assets/intro_2.png',
                  fit: BoxFit.cover,
                ),
              ),
              title: L10n.of(context).txt_branding_for_your_parlour,
              body: L10n.of(context).txt_branding_for_your_parlour_detail_text,
            ),
            PageViewModel(
              image: Container(
                padding: EdgeInsets.only(top: 40),
                child: Image.asset(
                  'assets/intro_3.png',
                  fit: BoxFit.cover,
                ),
              ),
              title: L10n.of(context).txt_get_customer_feedback,
              body: L10n.of(context).txt_get_customer_feedback_detail_text,
              decoration: PageDecoration(
                descriptionPadding: EdgeInsets.only(left: 28, right: 28),
                titleTextStyle: Theme.of(context).primaryTextTheme.headline3,
                titlePadding:
                    EdgeInsets.only(top: 60, bottom: 10, right: 35, left: 35),
                contentPadding: EdgeInsets.only(bottom: 35),
                bodyTextStyle: Theme.of(context).primaryTextTheme.subtitle2,
                footerPadding: EdgeInsets.only(top: 20),
              ),
              footer: TextButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (context) => ChooseSignUpSignInScreen(
                              a: widget.analytics,
                              o: widget.observer,
                            )),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    L10n.of(context).btn_get_started,
                  ),
                ),
              ),
            )
          ],
          done: null,
          onDone: () {},
        ),
      ])),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }
}
