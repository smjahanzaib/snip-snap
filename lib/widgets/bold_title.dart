import 'package:flutter/material.dart';
import 'package:SnipSnap/configs/constants.dart';
import 'package:SnipSnap/utils/text_style.dart';
import 'package:SnipSnap/widgets/strut_text.dart';

/// Bold title.
///
/// Used on [HomeScreen].
class BoldTitle extends StatelessWidget {
  const BoldTitle({
    Key key,
    @required this.title,
    this.onNavigate,
    this.padding,
    this.textAlign,
    this.maxLines = 1,
  }) : super(key: key);

  final String title;
  final VoidCallback onNavigate;
  final EdgeInsetsGeometry padding;
  final int maxLines;
  final TextAlign textAlign;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding ??
          const EdgeInsetsDirectional.only(
            start: kPaddingM,
            end: kPaddingS,
            top: kPaddingL,
            bottom: kPaddingM,
          ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            child: StrutText(
              title,
              style: Theme.of(context).textTheme.headline5.w800,
              maxLines: maxLines,
              overflow: TextOverflow.ellipsis,
              textAlign: textAlign ?? TextAlign.start,
            ),
          ),
          if (onNavigate != null)
            InkWell(
              child: const Icon(
                Icons.navigate_next,
                size: 32,
              ),
              onTap: onNavigate,
            ),
        ],
      ),
    );
  }
}
