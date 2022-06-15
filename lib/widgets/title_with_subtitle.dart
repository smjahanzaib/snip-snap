import 'package:flutter/material.dart';
import 'package:SnipSnap/widgets/strut_text.dart';

/// [AppBar] title with subtitle.
class TitleWithSubtitle extends StatelessWidget {
  const TitleWithSubtitle({
    Key key,
    @required this.title,
    @required this.subtitle,
  }) : super(key: key);

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(title),
        StrutText(
          subtitle,
          style: Theme.of(context)
              .textTheme
              .bodyText2
              .copyWith(color: Colors.white70),
        ),
      ],
    );
  }
}
