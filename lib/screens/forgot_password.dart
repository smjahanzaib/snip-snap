import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:SnipSnap/blocs/auth/auth_bloc.dart';
import 'package:SnipSnap/configs/constants.dart';
import 'package:SnipSnap/generated/l10n.dart';
import 'package:SnipSnap/utils/form_validator.dart';
import 'package:SnipSnap/utils/ui.dart';
import 'package:SnipSnap/widgets/bold_title.dart';
import 'package:SnipSnap/widgets/strut_text.dart';
import 'package:SnipSnap/widgets/theme_button.dart';
import 'package:SnipSnap/widgets/theme_text_input.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key key}) : super(key: key);

  @override
  _ForgotPasswordScreenState createState() {
    return _ForgotPasswordScreenState();
  }
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final TextEditingController _textEmailController = TextEditingController();
  final GlobalKey<ThemeTextInputState> keyEmailInput =
      GlobalKey<ThemeTextInputState>();

  Future<void> _resetPassword() async {
    if (keyEmailInput.currentState.validate()) {
      BlocProvider.of<AuthBloc>(context)
          .add(NewPasswordRequestedAuthEvent(_textEmailController.text));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(L10n.of(context).forgotPasswordTitle),
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: kPaddingM),
          alignment: Alignment.center,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                BoldTitle(
                  title: L10n.of(context).forgotPasswordTitle,
                  padding: const EdgeInsets.only(bottom: kPaddingM),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: kPaddingS),
                  child: StrutText(
                    L10n.of(context).forgotPasswordLabel,
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                ),
                ThemeTextInput(
                  key: keyEmailInput,
                  controller: _textEmailController,
                  hintText: L10n.of(context).signInHintEmail,
                  keyboardType: TextInputType.emailAddress,
                  icon: const Icon(Icons.clear),
                  textInputAction: TextInputAction.next,
                  onTapIcon: () async {
                    await Future<dynamic>.delayed(
                        const Duration(milliseconds: 100));
                    _textEmailController.clear();
                  },
                  validator:
                      FormValidator.validators(<FormFieldValidator<String>>[
                    FormValidator.isRequired(
                        L10n.of(context).formValidatorRequired),
                    FormValidator.isEmail(L10n.of(context).formValidatorEmail),
                  ]),
                ),
                const Padding(padding: EdgeInsets.only(top: kPaddingM)),
                BlocBuilder<AuthBloc, AuthState>(
                  builder: (BuildContext context, AuthState authState) {
                    return BlocListener<AuthBloc, AuthState>(
                      listener: (BuildContext context, AuthState authState) {
                        if (authState is ForgetPasswordSuccessAuthState) {
                          UI.showMessage(
                            context,
                            title: L10n.of(context).forgotPasswordDialogTitle,
                            message: L10n.of(context).forgotPasswordDialogText,
                            buttonText: L10n.of(context).commonBtnClose,
                            onPressed: () => Navigator.pop(context),
                          );
                          _textEmailController.text = '';
                        }
                      },
                      child: ThemeButton(
                        onPressed: _resetPassword,
                        text: L10n.of(context).forgotPasswordBtn,
                        showLoading: authState is ProcessInProgressAuthState,
                        disableTouchWhenLoading: true,
                      ),
                    );
                  },
                ),
                const Padding(padding: EdgeInsets.only(top: kPaddingS)),
                Center(
                  child: FlatButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text(L10n.of(context).forgotPasswordBack),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
