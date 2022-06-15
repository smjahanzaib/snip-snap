import 'package:flutter/material.dart';
import 'package:SnipSnap/configs/constants.dart';
import 'package:SnipSnap/utils/text_style.dart';
import 'package:SnipSnap/widgets/strut_text.dart';

/// Generic purpose badge style label.
class Badge extends StatelessWidget {
  const Badge({
    Key key,
    @required this.text,
    this.color = Colors.black87,
    this.backgroundColor,
    this.showLoading = false,
  }) : super(key: key);

  final String text;
  final Color color;
  final Color backgroundColor;
  final bool showLoading;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
          vertical: kPaddingS / 2, horizontal: kPaddingS),
      alignment: AlignmentDirectional.center,
      decoration: BoxDecoration(
        color: backgroundColor ?? Theme.of(context).highlightColor,
        borderRadius: const BorderRadius.all(Radius.circular(kBadgeRadius)),
      ),
      child: StrutText(
        showLoading ? '?' : text,
        style:
            Theme.of(context).textTheme.bodyText2.w500.copyWith(color: color),
      ),
    );
  }
}
