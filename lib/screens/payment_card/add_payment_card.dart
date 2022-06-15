import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:SnipSnap/blocs/auth/auth_bloc.dart';
import 'package:SnipSnap/configs/constants.dart';
import 'package:SnipSnap/data/models/payment_card_model.dart';
import 'package:SnipSnap/generated/l10n.dart';
import 'package:SnipSnap/screens/payment_card/widgets/payment_card_form.dart';
import 'package:SnipSnap/screens/payment_card/widgets/payment_card_widget.dart';
import 'package:SnipSnap/widgets/loading_overlay.dart';
import 'package:SnipSnap/widgets/portrait_mode_mixin.dart';
import 'package:SnipSnap/widgets/theme_button.dart';

class AddPaymentCardScreen extends StatefulWidget {
  @override
  _AddPaymentCardScreenState createState() => _AddPaymentCardScreenState();
}

class _AddPaymentCardScreenState extends State<AddPaymentCardScreen>
    with PortraitStatefulModeMixin<AddPaymentCardScreen> {
  PaymentCardModel _paymentCardModel = PaymentCardModel();

  bool _isLoading = false;

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return BlocBuilder<AuthBloc, AuthState>(
      builder: (BuildContext context, AuthState state) {
        return BlocListener<AuthBloc, AuthState>(
          listener: (BuildContext context, AuthState state) {
            if (state is PaymentCardSaveSuccessAuthState) {
              setState(() => _isLoading = false);
              Navigator.pop(context);
            }
          },
          child: Scaffold(
            backgroundColor: Theme.of(context).cardColor,
            resizeToAvoidBottomInset: true,
            appBar: AppBar(
              centerTitle: true,
              title: Text(L10n.of(context).addPaymentCardTitle),
              actions: <Widget>[
                IconButton(
                  icon: const Icon(Icons.save),
                  onPressed: _savePaymentCard,
                ),
              ],
            ),
            body: SafeArea(
              child: LoadingOverlay(
                isLoading: _isLoading,
                child: Column(
                  children: <Widget>[
                    Expanded(
                      child: ListView(children: <Widget>[
                        PaymentCardWidget(
                          cardNumber: _paymentCardModel.cardNumber,
                          expirationDate: _paymentCardModel.expirationDate,
                          cardHolderName: _paymentCardModel.cardHolderName,
                          cvvCode: _paymentCardModel.cvvCode,
                          showBackView: _paymentCardModel.isCvvFocused,
                          cardBgColor: Colors.black87,
                        ),
                        PaymentCardForm(
                            onCreditCardModelChange: _onCreditCardModelChange),
                      ]),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(kPaddingM),
                      child: ThemeButton(
                        text: L10n.of(context).addPaymentCardButton,
                        onPressed: _savePaymentCard,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  void _onCreditCardModelChange(PaymentCardModel creditCardModel) {
    setState(() => _paymentCardModel = creditCardModel);
  }

  void _savePaymentCard() {
    setState(() => _isLoading = true);
    BlocProvider.of<AuthBloc>(context)
        .add(PaymentCardSavedAuthEvent(paymentCard: _paymentCardModel));
  }
}
