import 'package:flutter/material.dart';
import 'package:SnipSnap/configs/constants.dart';
import 'package:SnipSnap/data/models/payment_card_model.dart';
import 'package:SnipSnap/generated/l10n.dart';
import 'package:SnipSnap/utils/masked_text_editing_controller.dart';
import 'package:SnipSnap/widgets/form_label.dart';
import 'package:SnipSnap/widgets/theme_text_input.dart';

class PaymentCardForm extends StatefulWidget {
  const PaymentCardForm({
    Key key,
    this.cardNumber,
    this.expiryDate,
    this.cardHolderName,
    this.cvvCode,
    @required this.onCreditCardModelChange,
  }) : super(key: key);

  final String cardNumber;
  final String expiryDate;
  final String cardHolderName;
  final String cvvCode;
  final void Function(PaymentCardModel) onCreditCardModelChange;

  @override
  _PaymentCardFormState createState() => _PaymentCardFormState();
}

class _PaymentCardFormState extends State<PaymentCardForm> {
  String cardNumber;
  String expiryDate;
  String cardHolderName;
  String cvvCode;
  bool isCvvFocused = false;

  void Function(PaymentCardModel) onCreditCardModelChange;
  PaymentCardModel creditCardModel;

  final MaskedTextEditingController _cardNumberController =
      MaskedTextEditingController(mask: '0000 0000 0000 0000');
  final MaskedTextEditingController _expiryDateController =
      MaskedTextEditingController(mask: '00/00');
  final TextEditingController _cardHolderNameController =
      TextEditingController();
  final MaskedTextEditingController _cvvCodeController =
      MaskedTextEditingController(mask: '0000');

  FocusNode cvvFocusNode = FocusNode();

  void textFieldFocusDidChange() {
    creditCardModel.isCvvFocused = cvvFocusNode.hasFocus;
    onCreditCardModelChange(creditCardModel);
  }

  void createCreditCardModel() {
    cardNumber = widget.cardNumber ?? '';
    expiryDate = widget.expiryDate ?? '';
    cardHolderName = widget.cardHolderName ?? '';
    cvvCode = widget.cvvCode ?? '';

    creditCardModel = PaymentCardModel(
      cardNumber: cardNumber,
      expirationDate: expiryDate,
      cardHolderName: cardHolderName,
      cvvCode: cvvCode,
      isCvvFocused: isCvvFocused,
    );
  }

  @override
  void initState() {
    super.initState();

    createCreditCardModel();

    onCreditCardModelChange = widget.onCreditCardModelChange;

    cvvFocusNode.addListener(textFieldFocusDidChange);

    _cvvCodeController.addListener(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: kPaddingM, right: kPaddingM),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          FormLabel(text: L10n.of(context).paymentCardWidgetCardNumberLabel),
          ThemeTextInput(
            controller: _cardNumberController,
            hintText: 'XXXX XXXX XXXX XXXX',
            keyboardType: TextInputType.number,
            onChanged: (String value) {
              setState(() {
                cardNumber = _cardNumberController.text;
                creditCardModel.cardNumber = cardNumber;
                onCreditCardModelChange(creditCardModel);
              });
            },
            textInputAction: TextInputAction.next,
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: const EdgeInsetsDirectional.only(end: kPaddingS),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      FormLabel(
                          text: L10n.of(context)
                              .paymentCardWidgetExpirationDateLabel),
                      ThemeTextInput(
                        controller: _expiryDateController,
                        hintText: L10n.of(context)
                            .paymentCardWidgetExpirationDatePlaceholder,
                        keyboardType: TextInputType.number,
                        onChanged: (String value) {
                          setState(() {
                            expiryDate = _expiryDateController.text;
                            creditCardModel.expirationDate = expiryDate;
                            onCreditCardModelChange(creditCardModel);
                          });
                        },
                        textInputAction: TextInputAction.next,
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsetsDirectional.only(start: kPaddingS),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      FormLabel(
                          text: L10n.of(context)
                              .paymentCardWidgetSecurityCodeLabel),
                      ThemeTextInput(
                        controller: _cvvCodeController,
                        focusNode: cvvFocusNode,
                        keyboardType: TextInputType.text,
                        hintText: 'XXX',
                        onChanged: (String value) {
                          setState(() {
                            cvvCode = _cvvCodeController.text;
                            creditCardModel.cvvCode = cvvCode;
                            onCreditCardModelChange(creditCardModel);
                          });
                        },
                        textInputAction: TextInputAction.done,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          FormLabel(text: L10n.of(context).paymentCardWidgetCardHolderLabel),
          ThemeTextInput(
            controller: _cardHolderNameController,
            keyboardType: TextInputType.text,
            onChanged: (String value) {
              setState(() {
                cardHolderName = _cardHolderNameController.text;
                creditCardModel.cardHolderName = cardHolderName;
                onCreditCardModelChange(creditCardModel);
              });
            },
            textInputAction: TextInputAction.next,
          ),
        ],
      ),
    );
  }
}
