import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:SnipSnap/blocs/auth/auth_bloc.dart';
import 'package:SnipSnap/configs/constants.dart';
import 'package:SnipSnap/configs/routes.dart';
import 'package:SnipSnap/generated/l10n.dart';
import 'package:SnipSnap/utils/form_utils.dart';
import 'package:SnipSnap/utils/form_validator.dart';
import 'package:SnipSnap/utils/ui.dart';
import 'package:SnipSnap/widgets/link_button.dart';
import 'package:SnipSnap/widgets/strut_text.dart';
import 'package:SnipSnap/widgets/theme_button.dart';
import 'package:SnipSnap/widgets/theme_text_input.dart';
import 'package:SnipSnap/utils/text_style.dart';
import 'package:SnipSnap/vendor/screens/addServicesScreen.dart';

/// Signin widget to be used wherever we need user to log in before taking any
/// action.
class SignInWidget extends StatefulWidget {
  const SignInWidget({
    Key key,
    this.title,
  }) : super(key: key);

  /// Optional widget title.
  final String title;

  @override
  _SignInWidgetState createState() => _SignInWidgetState();
}

class _SignInWidgetState extends State<SignInWidget>
    with SingleTickerProviderStateMixin {
  final TextEditingController _textEmailController = TextEditingController();
  final TextEditingController _textPassController = TextEditingController();
  final FocusNode _focusEmail = FocusNode();
  final FocusNode _focusPass = FocusNode();

  final GlobalKey<ThemeTextInputState> keyEmailInput =
      GlobalKey<ThemeTextInputState>();
  final GlobalKey<ThemeTextInputState> keyPasswordInput =
      GlobalKey<ThemeTextInputState>();

  AnimationController _controller;

  AuthBloc _loginBloc;
  bool _showPassword = false;
  bool _isloginAsVendor = false;

  String _title;

  @override
  void initState() {
    _controller = AnimationController(vsync: this);

    _loginBloc = BlocProvider.of<AuthBloc>(context);
    _textEmailController.text = kDemoEmail;
    _textPassController.text = kDemoPassword;

    _title = widget.title ?? '';

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _validateForm() {
    FormUtils.hideKeyboard(context);

    Navigator.pushNamed(context, Routes.addServices);
    // if (keyPasswordInput.currentState.validate() &&
    //     keyEmailInput.currentState.validate()) {
    //   _loginBloc.add(LoginRequestedAuthEvent(
    //     email: _textEmailController.text,
    //     password: _textPassController.text,
    //   ));
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: kPaddingM),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  if (_title.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.only(
                          top: kPaddingL, bottom: kPaddingM),
                      child: StrutText(
                        _title,
                        style: Theme.of(context).textTheme.headline5.bold,
                      ),
                    )
                  else
                    Container(),
                  ThemeTextInput(
                    key: keyEmailInput,
                    controller: _textEmailController,
                    hintText: L10n.of(context).signInHintEmail,
                    focusNode: _focusEmail,
                    keyboardType: TextInputType.emailAddress,
                    icon: const Icon(Icons.clear),
                    textInputAction: TextInputAction.next,
                    onTapIcon: () async {
                      await Future<dynamic>.delayed(
                          const Duration(milliseconds: 100));
                      _textEmailController.clear();
                    },
                    onSubmitted: (String text) => FormUtils.fieldFocusChange(
                        context, _focusEmail, _focusPass),
                    validator:
                        FormValidator.validators(<FormFieldValidator<String>>[
                      FormValidator.isRequired(
                          L10n.of(context).formValidatorRequired),
                      FormValidator.isEmail(
                          L10n.of(context).formValidatorEmail),
                    ]),
                  ),
                  const Padding(padding: EdgeInsets.only(top: kPaddingM)),
                  ThemeTextInput(
                    key: keyPasswordInput,
                    hintText: L10n.of(context).signInHintPassword,
                    textInputAction: TextInputAction.done,
                    onSubmitted: (String text) => _validateForm(),
                    onTapIcon: () =>
                        setState(() => _showPassword = !_showPassword),
                    obscureText: !_showPassword,
                    icon: Icon(_showPassword
                        ? Icons.visibility
                        : Icons.visibility_off),
                    controller: _textPassController,
                    focusNode: _focusPass,
                    validator:
                        FormValidator.validators(<FormFieldValidator<String>>[
                      FormValidator.isRequired(
                          L10n.of(context).formValidatorRequired),
                      FormValidator.isMinLength(
                        length: kMinimalPasswordLength,
                        errorMessage: L10n.of(context)
                            .formValidatorMinLength(kMinimalPasswordLength),
                      ),
                    ]),
                  ),
                  const Padding(padding: EdgeInsets.only(top: kPaddingM)),
                  BlocBuilder<AuthBloc, AuthState>(
                    builder: (BuildContext context, AuthState login) {
                      return BlocListener<AuthBloc, AuthState>(
                        listener:
                            (BuildContext context, AuthState loginListener) {
                          if (loginListener is LoginFailureAuthState) {
                            UI.showErrorDialog(
                              context,
                              message: loginListener.message,
                            );
                          }
                        },
                        child: ThemeButton(
                          onPressed: _validateForm,
                          text: L10n.of(context).signInButtonLogin,
                          showLoading: login is ProcessInProgressAuthState,
                          disableTouchWhenLoading: true,
                        ),
                      );
                    },
                  ),
                  FlatButton(
                    onPressed: () =>
                        Navigator.pushNamed(context, Routes.forgotPassword),
                    child: Text(L10n.of(context).signInButtonForgot),
                  ),
                  const Padding(padding: EdgeInsets.only(top: kPaddingM)),
                  CupertinoSwitch(
                      value: false,
                      onChanged: (bool value) {
                        setState(() {
                          _isloginAsVendor = true;
                        });
                      },
                      activeColor: CupertinoColors.activeOrange),
                  SizedBox(
                    child: Text("Login as vendor"),
                  ),
                  const Padding(padding: EdgeInsets.only(top: kPaddingS)),
                  const Padding(padding: EdgeInsets.only(top: kPaddingS)),
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: kPaddingM, vertical: kPaddingS),
          child: Row(
            children: <Widget>[
              StrutText(
                L10n.of(context).signInRegisterLabel,
                style: Theme.of(context).textTheme.subtitle1,
              ),
              const Spacer(),
              LinkButton(
                onPressed: () => Navigator.pushNamed(context, Routes.signUp),
                label: L10n.of(context).signInButtonRegister,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
