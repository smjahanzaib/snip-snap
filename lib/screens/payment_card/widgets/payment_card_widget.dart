import 'dart:math';

import 'package:flutter/material.dart';
import 'package:SnipSnap/configs/constants.dart';
import 'package:SnipSnap/data/models/payment_card_model.dart';
import 'package:SnipSnap/generated/l10n.dart';
import 'package:SnipSnap/screens/payment_card/widgets/animation_card.dart';
import 'package:SnipSnap/screens/payment_card/widgets/random_background.dart';
import 'package:SnipSnap/utils/string.dart';
import 'package:SnipSnap/widgets/strut_text.dart';

class PaymentCardWidget extends StatefulWidget {
  const PaymentCardWidget({
    Key key,
    this.cardNumber = '',
    this.expirationDate = '',
    this.cardHolderName = '',
    this.cvvCode = '',
    this.showBackView = false,
    this.height,
    this.width,
    this.cardBgColor,
  }) : super(key: key);

  final String cardNumber;
  final String expirationDate;
  final String cardHolderName;
  final String cvvCode;
  final Color cardBgColor;
  final bool showBackView;
  final double height;
  final double width;

  @override
  _PaymentCardWidgetState createState() => _PaymentCardWidgetState();
}

class _PaymentCardWidgetState extends State<PaymentCardWidget>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _frontRotation;
  Animation<double> _backRotation;
  Gradient backgroundGradientColor;

  bool isAmex = false;

  @override
  void initState() {
    super.initState();

    /// initialize the animation controller
    _controller = AnimationController(
      duration: kPaymentCardAnimationDuration,
      vsync: this,
    );

    backgroundGradientColor = LinearGradient(
      // Where the linear gradient begins and ends
      begin: Alignment.topRight,
      end: Alignment.bottomLeft,
      // Add one stop for each color. Stops should increase from 0 to 1
      stops: const <double>[0.1, 0.4, 0.7, 0.9],
      colors: <Color>[
        widget.cardBgColor.withOpacity(0.5),
        widget.cardBgColor.withOpacity(0.45),
        widget.cardBgColor.withOpacity(0.4),
        widget.cardBgColor.withOpacity(0.3),
      ],
    );

    ///Initialize the Front to back rotation tween sequence.
    _frontRotation = TweenSequence<double>(
      <TweenSequenceItem<double>>[
        TweenSequenceItem<double>(
          tween: Tween<double>(begin: 0.0, end: pi / 2)
              .chain(CurveTween(curve: Curves.easeIn)),
          weight: 50.0,
        ),
        TweenSequenceItem<double>(
          tween: ConstantTween<double>(pi / 2),
          weight: 50.0,
        ),
      ],
    ).animate(_controller);

    _backRotation = TweenSequence<double>(
      <TweenSequenceItem<double>>[
        TweenSequenceItem<double>(
          tween: ConstantTween<double>(pi / 2),
          weight: 50.0,
        ),
        TweenSequenceItem<double>(
          tween: Tween<double>(begin: -pi / 2, end: 0.0)
              .chain(CurveTween(curve: Curves.easeOut)),
          weight: 50.0,
        ),
      ],
    ).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    final Orientation orientation = MediaQuery.of(context).orientation;

    /// If user adds CVV then toggle the card from front to back..
    /// controller forward starts animation and shows back layout.
    /// controller reverse starts animation and shows front layout.
    ///
    if (widget.showBackView) {
      _controller.forward();
    } else {
      _controller.reverse();
    }

    return Stack(
      children: <Widget>[
        AnimationCard(
          animation: _frontRotation,
          child: _buildFrontContainer(width, height, context, orientation),
        ),
        AnimationCard(
          animation: _backRotation,
          child: _buildBackContainer(width, height, context, orientation),
        ),
      ],
    );
  }

  Container _buildFrontContainer(
    double width,
    double height,
    BuildContext context,
    Orientation orientation,
  ) {
    return Container(
      margin: const EdgeInsets.all(kPaddingM),
      width: widget.width ?? width,
      height: widget.height ??
          max(230,
              orientation == Orientation.portrait ? height / 4 : height / 2),
      child: Stack(
        children: <Widget>[
          RandomBackground(
            height: height,
            width: width,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(kBoxDecorationRadius),
              boxShadow: const <BoxShadow>[
                BoxShadow(
                  color: Colors.black26,
                  offset: Offset(0, 0),
                  blurRadius: 24,
                )
              ],
              gradient: backgroundGradientColor,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(height: kPaddingM),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: kPaddingM),
                  child: Image.asset(
                    AssetsImages.chip,
                    height: 52,
                    width: 52,
                  ),
                ),
                Container(height: kPaddingM),
                Padding(
                  padding: const EdgeInsetsDirectional.only(start: kPaddingM),
                  child: StrutText(
                    widget.cardNumber.isNullOrEmpty
                        ? 'XXXX XXXX XXXX XXXX'
                        : widget.cardNumber,
                    style: const TextStyle(
                      color: kWhite,
                      fontFamily: 'halter',
                      fontSize: 18,
                    ),
                  ),
                ),
                Container(height: kPaddingS),
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsetsDirectional.only(start: kPaddingM),
                    child: Row(
                      children: <Widget>[
                        StrutText(
                          L10n.of(context).paymentCardWidgetValidityLabel,
                          style: const TextStyle(
                            color: kWhite,
                            fontFamily: 'halter',
                            fontSize: 9,
                          ),
                        ),
                        Container(width: kPaddingS),
                        StrutText(
                          widget.expirationDate.isNullOrEmpty
                              ? L10n.of(context)
                                  .paymentCardWidgetExpirationDatePlaceholder
                              : widget.expirationDate,
                          style: const TextStyle(
                            color: kWhite,
                            fontFamily: 'halter',
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: kPaddingM, right: kPaddingM, bottom: kPaddingM),
                    child: StrutText(
                      widget.cardHolderName.isEmpty ||
                              widget.cardHolderName == null
                          ? L10n.of(context)
                              .paymentCardWidgetCardHolderPlaceholder
                          : widget.cardHolderName.toUpperCase(),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: kWhite,
                        fontFamily: 'halter',
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: AlignmentDirectional.bottomEnd,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: kPaddingM, vertical: kPaddingS),
              child: _getCardTypeIcon(widget.cardNumber),
            ),
          ),
        ],
      ),
    );
  }

  Container _buildBackContainer(
    double width,
    double height,
    BuildContext context,
    Orientation orientation,
  ) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(kBoxDecorationRadius),
        boxShadow: const <BoxShadow>[
          BoxShadow(
            color: Colors.black26,
            offset: Offset(0, 0),
            blurRadius: 24,
          ),
        ],
        gradient: backgroundGradientColor,
      ),
      margin: const EdgeInsets.all(kPaddingM),
      width: widget.width ?? width,
      height: widget.height ??
          max(230,
              orientation == Orientation.portrait ? height / 4 : height / 2),
      child: Stack(
        children: <Widget>[
          RandomBackground(
            height: height,
            width: width,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(kBoxDecorationRadius),
              boxShadow: const <BoxShadow>[
                BoxShadow(
                  color: Colors.black26,
                  offset: Offset(0, 0),
                  blurRadius: 24,
                )
              ],
              gradient: backgroundGradientColor,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  flex: 2,
                  child: Container(
                    margin: const EdgeInsets.only(top: kPaddingM),
                    height: 48,
                    color: Colors.black,
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    margin: const EdgeInsets.only(top: kPaddingM),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Expanded(
                          flex: 9,
                          child: Container(
                            height: 40,
                            color: const Color(0xffdddddd),
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Container(
                            color: kWhite,
                            child: Padding(
                              padding: const EdgeInsets.all(5),
                              child: StrutText(
                                widget.cvvCode.isEmpty
                                    ? isAmex
                                        ? 'XXXX'
                                        : 'XXX'
                                    : isAmex
                                        ? widget.cvvCode.length > 4
                                            ? widget.cvvCode.substring(0, 4)
                                            : widget.cvvCode
                                        : widget.cvvCode.length > 3
                                            ? widget.cvvCode.substring(0, 3)
                                            : widget.cvvCode,
                                maxLines: 1,
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'halter',
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Align(
                    alignment: AlignmentDirectional.topEnd,
                    child: Padding(
                      padding: const EdgeInsetsDirectional.only(
                          start: kPaddingM, end: kPaddingM, bottom: kPaddingM),
                      child: _getCardTypeIcon(widget.cardNumber),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Returns the [Image.asset] for the payment card type.
  Widget _getCardTypeIcon(String cardNumber) {
    Widget icon;
    switch (cardNumber.getCCType) {
      case PaymentCardType.visa:
        icon = Image.asset(
          AssetsImages.cardVisa,
          height: 64,
          width: 64,
        );
        isAmex = false;
        break;

      case PaymentCardType.americanExpress:
        icon = Image.asset(
          AssetsImages.cardAmex,
          height: 64,
          width: 64,
        );
        isAmex = true;
        break;

      case PaymentCardType.mastercard:
        icon = Image.asset(
          AssetsImages.cardMastercard,
          height: 64,
          width: 64,
        );
        isAmex = false;
        break;

      case PaymentCardType.discover:
        icon = Image.asset(
          AssetsImages.cardDiscover,
          height: 64,
          width: 64,
        );
        isAmex = false;
        break;

      default:
        icon = Container(
          height: 64,
          width: 64,
        );
        isAmex = false;
        break;
    }

    return icon;
  }
}
