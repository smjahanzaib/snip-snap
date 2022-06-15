import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:SnipSnap/blocs/auth/auth_bloc.dart';
import 'package:SnipSnap/configs/constants.dart';
import 'package:SnipSnap/configs/routes.dart';
import 'package:SnipSnap/data/models/payment_card_model.dart';
import 'package:SnipSnap/generated/l10n.dart';
import 'package:SnipSnap/widgets/jumbotron.dart';
import 'package:SnipSnap/utils/text_style.dart';
import 'package:SnipSnap/widgets/strut_text.dart';

class PaymentCardScreen extends StatefulWidget {
  @override
  _PaymentCardScreenState createState() => _PaymentCardScreenState();
}

class _PaymentCardScreenState extends State<PaymentCardScreen> {
  PaymentCardModel _paymentCard;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (BuildContext context, AuthState state) {
        return BlocListener<AuthBloc, AuthState>(
          listener: (BuildContext context, AuthState state) {
            if (state is PaymentCardSaveSuccessAuthState) {
              setState(() => _paymentCard = state.paymentCard);
            }
          },
          child: Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: Text(L10n.of(context).paymentCardTitle),
            ),
            body: _paymentCardInfo(),
          ),
        );
      },
    );
  }

  Widget _paymentCardInfo() {
    if (_paymentCard == null) {
      return Padding(
        padding: const EdgeInsets.all(kPaddingM),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Jumbotron(
                title: L10n.of(context).paymentCardWarningTitle,
                icon: Icons.credit_card,
                padding: EdgeInsets.zero,
              ),
              StrutText(
                L10n.of(context).paymentCardWarningNote,
                style: Theme.of(context)
                    .textTheme
                    .subtitle1
                    .copyWith(color: Theme.of(context).disabledColor),
                textAlign: TextAlign.center,
              ),
              const Padding(padding: EdgeInsets.only(top: kPaddingM)),
              RaisedButton(
                child: StrutText(
                  L10n.of(context).paymentCardWarningBtn,
                  style: Theme.of(context).textTheme.button.fs16.white.w500,
                ),
                onPressed: () =>
                    Navigator.pushNamed(context, Routes.addPaymentCard),
              ),
            ],
          ),
        ),
      );
    }

    return Container();
  }
}
