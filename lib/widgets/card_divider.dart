import 'package:flutter/material.dart';

/// Divider line.
///
/// Used usually in [Card]s.
class CardDivider extends StatelessWidget {
  const CardDivider({
    Key key,
    this.lineColor,
    this.dashWidth = 10.0,
    this.height = 2.0,
  }) : super(key: key);

  final double dashWidth;
  final double height;
  final Color lineColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          final double boxWidth = constraints.constrainWidth();
          final int dashCount = (boxWidth / (2 * dashWidth)).floor();
          return Flex(
            children: List<Widget>.generate(dashCount, (_) {
              return SizedBox(
                width: dashWidth,
                height: height,
                child: DecoratedBox(
                  decoration: BoxDecoration(color: lineColor ?? Theme.of(context).highlightColor),
                ),
              );
            }),
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            direction: Axis.horizontal,
          );
        },
      ),
    );
  }
}
