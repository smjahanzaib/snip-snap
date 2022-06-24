import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:SnipSnap/blocs/auth/auth_bloc.dart';
import 'package:SnipSnap/configs/constants.dart';
import 'package:SnipSnap/generated/l10n.dart';
import 'package:SnipSnap/utils/async.dart';
import 'package:SnipSnap/utils/form_utils.dart';
import 'package:SnipSnap/utils/form_validator.dart';
import 'package:SnipSnap/utils/ui.dart';
import 'package:SnipSnap/widgets/bold_title.dart';
import 'package:SnipSnap/widgets/form_label.dart';
import 'package:SnipSnap/widgets/link_button.dart';
import 'package:SnipSnap/widgets/theme_button.dart';
import 'package:SnipSnap/widgets/theme_text_input.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key key}) : super(key: key);

  @override
  _SignUpScreenState createState() {
    return _SignUpScreenState();
  }
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _textNameController = TextEditingController();
  final TextEditingController _textPassController = TextEditingController();
  final TextEditingController _textEmailController = TextEditingController();
  final FocusNode _focusName = FocusNode();
  final FocusNode _focusPass = FocusNode();
  final FocusNode _focusEmail = FocusNode();
  final GlobalKey<ThemeTextInputState> keyEmailInput =
      GlobalKey<ThemeTextInputState>();
  final GlobalKey<ThemeTextInputState> keyPasswordInput =
      GlobalKey<ThemeTextInputState>();
  final GlobalKey<ThemeTextInputState> keyNameInput =
      GlobalKey<ThemeTextInputState>();

  bool _showPassword = false;
  bool _consentGiven = false;
  bool _isloginAsVendor = false;

  void _signUp() {
    FormUtils.hideKeyboard(context);

    if (!_consentGiven) {
      UI.showErrorDialog(
        context,
        message: L10n.of(context).signUpErrorConsent,
        onPressed: () {},
      );
      return;
    }

    if (keyNameInput.currentState.validate() &&
        keyEmailInput.currentState.validate() &&
        keyPasswordInput.currentState.validate()) {
      BlocProvider.of<AuthBloc>(context).add(UserRegisteredAuthEvent(
          fullName: _textNameController.text,
          email: _textEmailController.text,
          password: _textPassController.text,
          role: _isloginAsVendor ? 'admin' : 'user'));
      debugPrint('_isloginAsVendor: $_isloginAsVendor');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(L10n.of(context).signUpTitle),
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
                  title: L10n.of(context).signUpTitle,
                  padding: const EdgeInsets.only(bottom: kPaddingM),
                ),
                FormLabel(text: L10n.of(context).signUpLabelFullName),
                ThemeTextInput(
                  key: keyNameInput,
                  hintText: L10n.of(context).signUpHintFullName,
                  icon: const Icon(Icons.clear),
                  controller: _textNameController,
                  focusNode: _focusName,
                  textInputAction: TextInputAction.next,
                  onSubmitted: (String text) => FormUtils.fieldFocusChange(
                      context, _focusName, _focusEmail),
                  onTapIcon: () async {
                    await Future<dynamic>.delayed(
                        const Duration(milliseconds: 100));
                    _textNameController.clear();
                  },
                  validator: FormValidator.isRequired(
                      L10n.of(context).formValidatorRequired),
                ),
                FormLabel(text: L10n.of(context).signupLabelEmail),
                ThemeTextInput(
                  key: keyEmailInput,
                  hintText: L10n.of(context).signupHintLabelEmail,
                  focusNode: _focusEmail,
                  onTapIcon: () async {
                    await Future<dynamic>.delayed(
                        const Duration(milliseconds: 100));
                    _textEmailController.clear();
                  },
                  onSubmitted: (String text) => FormUtils.fieldFocusChange(
                      context, _focusEmail, _focusPass),
                  icon: const Icon(Icons.clear),
                  controller: _textEmailController,
                  keyboardType: TextInputType.emailAddress,
                  validator:
                      FormValidator.validators(<FormFieldValidator<String>>[
                    FormValidator.isRequired(
                        L10n.of(context).formValidatorRequired),
                    FormValidator.isEmail(L10n.of(context).formValidatorEmail),
                  ]),
                ),
                FormLabel(text: L10n.of(context).signUpLabelPassword),
                ThemeTextInput(
                  key: keyPasswordInput,
                  hintText: L10n.of(context).signUpHintLabelPassword,
                  helpText: L10n.of(context)
                      .signUpHelptextPassword(kMinimalPasswordLength),
                  textInputAction: TextInputAction.next,
                  onSubmitted: (String text) => FormUtils.fieldFocusChange(
                      context, _focusPass, _focusEmail),
                  onTapIcon: () {
                    setState(() => _showPassword = !_showPassword);
                  },
                  obscureText: !_showPassword,
                  icon: Icon(
                      _showPassword ? Icons.visibility : Icons.visibility_off),
                  controller: _textPassController,
                  focusNode: _focusPass,
                  validator:
                      FormValidator.validators(<FormFieldValidator<String>>[
                    FormValidator.isRequired(
                        L10n.of(context).formValidatorRequired),
                    FormValidator.matchesRegex(
                      regex: kPasswordRegex,
                      errorMessage:
                          L10n.of(context).formValidatorInvalidPassword,
                    ),
                  ]),
                ),
                const Padding(padding: EdgeInsets.only(top: kPaddingM)),
                Padding(
                  padding: const EdgeInsets.only(bottom: kPaddingM),
                  child: CheckboxListTile(
                    contentPadding: EdgeInsets.zero,
                    activeColor: Theme.of(context).accentColor,
                    title: Text(L10n.of(context).signUpLabelConsent),
                    value: _consentGiven,
                    onChanged: (bool value) {
                      setState(() => _consentGiven = value);
                    },
                    dense: true,
                    controlAffinity: ListTileControlAffinity.leading,
                  ),
                ),
                CupertinoSwitch(
                    value: _isloginAsVendor,
                    onChanged: (bool value) {
                      setState(() {
                        _isloginAsVendor = !_isloginAsVendor;
                        // debugPrint('_isloginAsVendor: $_isloginAsVendor');
                      });
                    },
                    activeColor: CupertinoColors.activeOrange),
                const SizedBox(
                  child: Text('Create account as vendor'),
                ),
                const Padding(padding: EdgeInsets.only(top: kPaddingM)),
                BlocBuilder<AuthBloc, AuthState>(
                  builder: (BuildContext context, AuthState authState) {
                    return BlocListener<AuthBloc, AuthState>(
                      listener: (BuildContext context, AuthState authState) {
                        if (authState is RegistrationFailureAuthState) {
                          UI.showErrorDialog(
                            context,
                            message: authState.message,
                          );
                        }
                      },
                      child: ThemeButton(
                        onPressed: _signUp,
                        text: L10n.of(context).signUpBtnSend,
                        showLoading: authState is ProcessInProgressAuthState,
                        disableTouchWhenLoading: true,
                      ),
                    );
                  },
                ),
                // Padding(
                //   padding: const EdgeInsets.symmetric(vertical: kPaddingM),
                //   child: LinkButton(
                //     trailing: Icon(
                //       Icons.open_in_browser,
                //       color: Theme.of(context).hintColor,
                //     ),
                //     label: L10n.of(context).signUpReadMore,
                //     onPressed: () => Async.launchUrl(kTermsOfServiceURL),
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
