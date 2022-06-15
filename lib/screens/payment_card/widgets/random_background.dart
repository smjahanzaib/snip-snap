import 'package:flutter/material.dart';
import 'package:SnipSnap/configs/constants.dart';

class RandomBackground extends StatelessWidget {
  const RandomBackground({
    Key key,
    this.height,
    this.width,
    this.url = 'https://placeimg.com/680/400/nature',
  }) : super(key: key);

  final String url;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Flex(
        direction: Axis.horizontal,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(kBoxDecorationRadius),
              child: Image.network(
                url,
                width: width,
                height: height,
                fit: BoxFit.cover,
              ),
            ),
          )
        ],
      ),
    );
  }
}
