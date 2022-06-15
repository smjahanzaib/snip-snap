import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:SnipSnap/configs/constants.dart';
import 'package:SnipSnap/generated/l10n.dart';
import 'package:SnipSnap/utils/text_style.dart';
import 'package:SnipSnap/widgets/strut_text.dart';

/// [Text] widget with an option to be expanded on tap.
class ExpandableText extends StatefulWidget {
  const ExpandableText(this.text);

  final String text;

  @override
  _ExpandableTextState createState() => _ExpandableTextState();
}

class _ExpandableTextState extends State<ExpandableText>
    with TickerProviderStateMixin<ExpandableText> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return widget.text.isNotEmpty
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              AnimatedSize(
                vsync: this,
                duration: const Duration(milliseconds: 250),
                child: ConstrainedBox(
                  constraints: isExpanded
                      ? const BoxConstraints()
                      : const BoxConstraints(maxHeight: 60.0),
                  child: Markdown(
                    data: widget.text,
                    padding: const EdgeInsets.all(0),
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    styleSheet: MarkdownStyleSheet.fromTheme(Theme.of(context))
                        .copyWith(
                            p: Theme.of(context).textTheme.subtitle1.h15.w300),
                  ),
                ),
              ),
              const Padding(padding: EdgeInsets.only(top: kPaddingS)),
              if (isExpanded || widget.text.length < 128)
                ConstrainedBox(constraints: const BoxConstraints())
              else
                InkWell(
                  onTap: () => setState(() => isExpanded = true),
                  child: Row(
                    children: <Widget>[
                      StrutText(
                        L10n.of(context).commonReadMore.toUpperCase(),
                        style: Theme.of(context)
                            .textTheme
                            .overline
                            .copyWith(color: Theme.of(context).hintColor),
                      ),
                      Icon(
                        Icons.keyboard_arrow_down,
                        size: 18,
                        color: Theme.of(context).hintColor,
                      )
                    ],
                  ),
                ),
            ],
          )
        : Container();
  }
}
