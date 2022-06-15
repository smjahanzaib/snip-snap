import 'dart:math';

import 'package:flutter/material.dart';
import 'package:SnipSnap/configs/constants.dart';
import 'package:SnipSnap/generated/l10n.dart';
import 'package:SnipSnap/widgets/bold_title.dart';
import 'package:SnipSnap/widgets/strut_text.dart';
import 'package:SnipSnap/widgets/theme_button.dart';
import 'package:SnipSnap/utils/text_style.dart';
import 'package:share/share.dart';

class InviteScreen extends StatefulWidget {
  @override
  _InviteScreenState createState() => _InviteScreenState();
}

class _InviteScreenState extends State<InviteScreen> {
  /// Chars to generate random strings from.
  final String _chars = 'ABCDEFGHIJKLMNPQRSTUVWXYZ123456789';

  /// Random number generator.
  final Random _rnd = Random();

  /// Function to generate a random string.
  String getRandomString({int length = 5}) => String.fromCharCodes(
        Iterable<int>.generate(
          length,
          (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length)),
        ),
      );

  /// Summon a platform-dependent [Share] dialog box.
  void _share(String code) {
    Share.share(L10n.of(context).inviteShareText(code));
  }

  @override
  Widget build(BuildContext context) {
    final String randomString = getRandomString();

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(L10n.of(context).inviteTitle),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.share),
            onPressed: () => _share(randomString),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: ListView(
                children: <Widget>[
                  BoldTitle(
                    title: L10n.of(context).inviteSubtitle,
                    maxLines: 2,
                    textAlign: TextAlign.center,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(kPaddingM),
                    child: StrutText(
                      L10n.of(context).inviteDescription,
                      style: Theme.of(context)
                          .textTheme
                          .subtitle1
                          .w400
                          .copyWith(color: Theme.of(context).hintColor),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: kPaddingM, vertical: kPaddingS),
                    child: Container(
                      height: 50,
                      width:
                          double.infinity, // Stretch the container full width.
                      decoration: BoxDecoration(
                        color: Theme.of(context).inputDecorationTheme.fillColor,
                        borderRadius: BorderRadius.circular(kFormFieldsRadius),
                        border: Border.all(
                          width: 2,
                          color:
                              Theme.of(context).inputDecorationTheme.fillColor,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(top: kPaddingS),
                        child: StrutText(
                          randomString,
                          style: Theme.of(context).textTheme.headline5.w800,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: kPaddingM),
                    child: ThemeButton(
                      text: L10n.of(context).inviteButton,
                      onPressed: () => _share(randomString),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 6,
              color: Theme.of(context).dividerColor,
            ),
            Padding(
              padding: const EdgeInsets.all(kPaddingM),
              child: Column(
                children: <Widget>[
                  StrutText(
                    L10n.of(context).inviteEarningsLabel,
                    style: Theme.of(context)
                        .textTheme
                        .subtitle1
                        .copyWith(color: Theme.of(context).hintColor),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(kPaddingS),
                    child: StrutText(
                      L10n.of(context).commonCurrencyFormat('0.00'),
                      style: Theme.of(context)
                          .textTheme
                          .headline3
                          .bold
                          .copyWith(color: Theme.of(context).accentColor),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
