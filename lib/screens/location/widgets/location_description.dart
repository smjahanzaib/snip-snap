import 'package:flutter/material.dart';
import 'package:SnipSnap/configs/constants.dart';
import 'package:SnipSnap/generated/l10n.dart';
import 'package:SnipSnap/widgets/expandable_text.dart';
import 'package:SnipSnap/widgets/uppercase_title.dart';
import 'package:shimmer/shimmer.dart';

class LocationDescription extends StatelessWidget {
  const LocationDescription({Key key, this.description}) : super(key: key);

  final String description;

  @override
  Widget build(BuildContext context) {
    if (description == null) {
      return Shimmer.fromColors(
        baseColor: Theme.of(context).hoverColor,
        highlightColor: Theme.of(context).dividerColor,
        enabled: true,
        child: Padding(
          padding: const EdgeInsets.all(kPaddingM),
          child: Container(
            height: 64,
            color: kWhite,
          ),
        ),
      );
    }

    if (description.isEmpty) {
      return Container();
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: kPaddingM),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          UppercaseTitle(title: L10n.of(context).locationTitleAboutUs),
          Padding(
            padding: const EdgeInsets.only(top: kPaddingM),
            child: ExpandableText(description),
          ),
        ],
      ),
    );
  }
}
