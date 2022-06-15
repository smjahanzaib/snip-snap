import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:SnipSnap/configs/constants.dart';
import 'package:SnipSnap/generated/l10n.dart';
import 'package:SnipSnap/widgets/strut_text.dart';
import 'package:SnipSnap/widgets/theme_button.dart';
import 'package:SnipSnap/utils/text_style.dart';

enum SuccessDialogIconStatus { hidden, becomingVisible, visible }

/// Full screen success dialog presented on the end of a wizard process.
///
/// Used at the end of a booking or reviewing process.
class SuccessDialog extends StatefulWidget {
  const SuccessDialog({
    Key key,
    this.iconVisibilityDuration = const Duration(milliseconds: 150),
    this.iconSizeDuration = const Duration(milliseconds: 150),
    this.delay = const Duration(milliseconds: 100),
    this.title,
    this.subtitle,
    this.btnLabel,
    this.startIcon,
    this.endIcon,
  }) : super(key: key);

  /// Duration of the main icon fade in process.
  final Duration iconVisibilityDuration;

  /// Duration of the main icon resizing process.
  final Duration iconSizeDuration;

  /// Start delay duration.
  final Duration delay;

  /// Dialog title.
  final String title;

  /// Dialog subtitle.
  final String subtitle;

  /// Bottom button label text.
  final String btnLabel;

  /// Animation start icon.
  final IconData startIcon;

  /// Animation end icon.
  final IconData endIcon;

  @override
  _BookingSuccessDialogState createState() => _BookingSuccessDialogState();
}

class _BookingSuccessDialogState extends State<SuccessDialog>
    with TickerProviderStateMixin {
  SuccessDialogIconStatus _successIconStatus = SuccessDialogIconStatus.hidden;
  bool _showButton = false;

  AnimationController iconVisibilityAnimationController,
      iconSizeAnimationController;

  Random random;

  @override
  void initState() {
    super.initState();

    random = Random();

    iconVisibilityAnimationController = AnimationController(
      vsync: this,
      duration: widget.iconVisibilityDuration,
    );
    iconVisibilityAnimationController.addListener(() => setState(() {}));
    iconVisibilityAnimationController
        .addStatusListener((AnimationStatus status) {
      if (status == AnimationStatus.completed) {
        iconSizeAnimationController.forward(from: 0.0);
      }
    });

    iconSizeAnimationController = AnimationController(
      vsync: this,
      duration: widget.iconSizeDuration,
    );
    iconSizeAnimationController.addListener(() => setState(() {}));
    iconSizeAnimationController.addStatusListener((AnimationStatus status) {
      if (status == AnimationStatus.completed) {
        _successIconStatus = SuccessDialogIconStatus.visible;
        _showButton = true;

        iconSizeAnimationController.reverse();
      }
    });

    asyncInitState();
  }

  @override
  void dispose() {
    iconVisibilityAnimationController.dispose();
    iconSizeAnimationController.dispose();
    super.dispose();
  }

  Future<void> asyncInitState() async {
    await Future<void>.delayed(widget.delay);

    if (mounted) {
      setState(() {
        _successIconStatus = SuccessDialogIconStatus.becomingVisible;
        iconVisibilityAnimationController.forward(from: 0.0);
      });
    }
  }

  Widget _drawIcon() {
    double extraSize, iconOpacity;

    switch (_successIconStatus) {
      case SuccessDialogIconStatus.hidden:
        extraSize = 0.0;
        iconOpacity = 0.0;
        break;
      case SuccessDialogIconStatus.becomingVisible:
      case SuccessDialogIconStatus.visible:
        iconOpacity = iconVisibilityAnimationController.value;
        extraSize = iconSizeAnimationController.value * 20;
        break;
    }

    return Opacity(
      opacity: iconOpacity,
      child: Icon(
        _successIconStatus == SuccessDialogIconStatus.visible
            ? widget.endIcon
            : widget.startIcon,
        size: 160 + extraSize,
        color: kPrimaryColor,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: Theme.of(context).brightness == Brightness.dark
          ? SystemUiOverlayStyle.light
          : SystemUiOverlayStyle.dark,
      child: Container(
        color: Theme.of(context).cardColor,
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(kPaddingM),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      _drawIcon(),
                      Padding(
                        padding: const EdgeInsets.only(top: kPaddingM),
                        child: StrutText(
                          widget.title ?? '',
                          style: Theme.of(context).textTheme.headline5.bold,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: kPaddingM, left: kPaddingM, right: kPaddingM),
                        child: StrutText(
                          widget.subtitle ?? '',
                          style: Theme.of(context).textTheme.subtitle1.copyWith(
                              color: Theme.of(context).textTheme.caption.color),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(kPaddingM),
                child: Opacity(
                  opacity: _showButton ? 1 : 0,
                  child: ThemeButton(
                    text: widget.btnLabel ?? L10n.of(context).commonBtnClose,

                    /// We shall go back to the very first screen in the queue...
                    onPressed: () => Navigator.of(context)
                        .popUntil((Route<dynamic> route) => route.isFirst),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
