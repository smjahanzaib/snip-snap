import 'package:flutter/material.dart';
import 'package:SnipSnap/configs/constants.dart';
import 'package:SnipSnap/utils/text_style.dart';
import 'package:SnipSnap/widgets/strut_text.dart';

/// A material design "raised button" using primary theme colors.
///
/// A raised button is based on a [Material] widget whose [Material.elevation]
/// increases when the button is pressed.
class AppButton extends StatelessWidget {
  const AppButton({
    Key key,
    this.onPressed,
    this.text,
    this.showLoading = false,
    this.disableTouchWhenLoading = false,
  }) : super(key: key);

  final VoidCallback onPressed;
  final String text;
  final bool showLoading;
  final bool disableTouchWhenLoading;

  Widget _loadingProgressIndicator() {
    if (!showLoading) {
      return Container();
    }

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: kPaddingS),
      width: 14,
      height: 14,
      child: const CircularProgressIndicator(strokeWidth: 2),
    );
  }

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: disableTouchWhenLoading && showLoading ? null : onPressed,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          StrutText(
            text.toUpperCase(),
            style: Theme.of(context).textTheme.subtitle1.white.w600,
          ),
          _loadingProgressIndicator()
        ],
      ),
    );
  }
}
