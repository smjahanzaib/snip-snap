import 'dart:io';
import 'dart:ui';

import 'package:SnipSnap/vendor/models/businessLayer/baseRoute.dart';
import 'package:SnipSnap/vendor/models/businessLayer/global.dart' as global;
import 'package:SnipSnap/vendor/screens/generalInformationScreen.dart';
import 'package:SnipSnap/vendor/screens/privacyAndPolicyScreen.dart';
import 'package:SnipSnap/vendor/screens/signInScreen.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:SnipSnap/generated/l10n.dart';

class SignUpScreen extends BaseRoute {
  SignUpScreen({a, o}) : super(a: a, o: o, r: 'SignUpScreen');
  @override
  _SignUpScreenState createState() => new _SignUpScreenState();
}

class _SignUpScreenState extends BaseRouteState {
  bool _isValidate = false;
  bool _isacceptPrivacy = false;
  bool _showPassword = true;

  bool _showConfirmPassword = true;
  var _fEmail = FocusNode();
  GlobalKey<ScaffoldState> _scaffoldKey;
  var _fPassword = FocusNode();
  var _fConfirmPassword = FocusNode();
  var _fDismiss = FocusNode();
  TextEditingController _cEmail = new TextEditingController();
  TextEditingController _cPassword = new TextEditingController();
  TextEditingController _cConfirmPassword = new TextEditingController();
  _SignUpScreenState() : super();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        Navigator.of(context).pop();
        return null;
      },
      child: sc(
        Scaffold(
            resizeToAvoidBottomInset: false,
            body: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Stack(
                children: [
                  Container(
                    height: 100,
                    width: MediaQuery.of(context).size.width,
                    child: Stack(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          child: ColorFiltered(
                            colorFilter: ColorFilter.mode(
                              Theme.of(context).primaryColor,
                              BlendMode.screen,
                            ),
                            child: Image.asset(
                              'assets/banner.jpg',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Padding(
                          padding: Platform.isAndroid
                              ? EdgeInsets.only(bottom: 15, left: 10, top: 10)
                              : EdgeInsets.only(bottom: 15, left: 10, top: 20),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            child: Row(
                              children: [
                                Icon(
                                  Icons.keyboard_arrow_left_outlined,
                                  color: Colors.black,
                                ),
                                Text(
                                  L10n.of(context).lbl_back,
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 17.5),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20)),
                      ),
                      margin: EdgeInsets.only(top: 80),
                      child: Padding(
                        padding: const EdgeInsets.only(
                          left: 10.0,
                          right: 10,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                                margin: EdgeInsets.only(top: 30, bottom: 10),
                                child: Text(
                                  L10n.of(context).lbl_sign_up,
                                  style: Theme.of(context)
                                      .primaryTextTheme
                                      .headline3,
                                )),
                            Expanded(
                              child: SingleChildScrollView(
                                physics: AlwaysScrollableScrollPhysics(),
                                child: Padding(
                                  padding: EdgeInsets.only(
                                    bottom: MediaQuery.of(context)
                                        .viewInsets
                                        .bottom,
                                    top: 15,
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        L10n.of(context).lblEmail,
                                        style: Theme.of(context)
                                            .primaryTextTheme
                                            .subtitle2,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 5),
                                        child: TextFormField(
                                          controller: _cEmail,
                                          focusNode: _fEmail,
                                          onChanged: (val) {
                                            _isValidate =
                                                EmailValidator.validate(val);
                                          },
                                          onEditingComplete: () {
                                            FocusScope.of(context)
                                                .requestFocus(_fPassword);
                                          },
                                          decoration: InputDecoration(
                                            hintText:
                                                L10n.of(context).hnt_email,
                                            prefixIcon: Icon(Icons.mail),
                                            contentPadding:
                                                EdgeInsets.only(top: 5),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(top: 5),
                                        child: Text(
                                          L10n.of(context).lblPassword,
                                          style: Theme.of(context)
                                              .primaryTextTheme
                                              .subtitle2,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 5),
                                        child: TextFormField(
                                          controller: _cPassword,
                                          focusNode: _fPassword,
                                          obscureText: _showPassword,
                                          onFieldSubmitted: (val) {
                                            FocusScope.of(context).requestFocus(
                                                _fConfirmPassword);
                                          },
                                          decoration: InputDecoration(
                                            hintText:
                                                L10n.of(context).hnt_password,
                                            prefixIcon: Icon(Icons.lock),
                                            suffixIcon: IconButton(
                                              icon: Icon(_showPassword
                                                  ? Icons.visibility_off
                                                  : Icons.visibility),
                                              onPressed: () {
                                                _showPassword = !_showPassword;
                                                setState(() {});
                                              },
                                            ),
                                            contentPadding:
                                                EdgeInsets.only(top: 5),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(top: 5),
                                        child: Text(
                                          L10n.of(context).lbl_confirm_password,
                                          style: Theme.of(context)
                                              .primaryTextTheme
                                              .subtitle2,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 5),
                                        child: TextFormField(
                                          controller: _cConfirmPassword,
                                          obscureText: _showConfirmPassword,
                                          focusNode: _fConfirmPassword,
                                          onFieldSubmitted: (val) {
                                            FocusScope.of(context)
                                                .requestFocus(_fDismiss);
                                          },
                                          decoration: InputDecoration(
                                            hintText:
                                                L10n.of(context).hnt_password,
                                            prefixIcon: Icon(
                                              Icons.lock,
                                            ),
                                            suffixIcon: IconButton(
                                              icon: Icon(_showConfirmPassword
                                                  ? Icons.visibility_off
                                                  : Icons.visibility),
                                              onPressed: () {
                                                _showConfirmPassword =
                                                    !_showConfirmPassword;
                                                setState(() {});
                                              },
                                            ),
                                            contentPadding:
                                                EdgeInsets.only(top: 5),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        margin:
                                            EdgeInsets.only(top: 5, left: 2),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Row(
                                              children: [
                                                Container(
                                                  height: 17,
                                                  width: 17,
                                                  child: Checkbox(
                                                      value: _isacceptPrivacy,
                                                      onChanged: (val) {
                                                        _isacceptPrivacy = val;
                                                        setState(() {});
                                                      }),
                                                ),
                                                GestureDetector(
                                                  onTap: () {
                                                    _isacceptPrivacy =
                                                        !_isacceptPrivacy;
                                                    setState(() {});
                                                  },
                                                  child: Container(
                                                      margin: global.isRTL
                                                          ? EdgeInsets.only(
                                                              right: 7)
                                                          : EdgeInsets.only(
                                                              left: 7),
                                                      child: Text(
                                                        L10n.of(context)
                                                            .txt_i_accept_the,
                                                        style: Theme.of(context)
                                                            .primaryTextTheme
                                                            .subtitle2,
                                                      )),
                                                ),
                                              ],
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                Navigator.of(context).push(
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            PrivacyAndPolicyScreen(
                                                              a: widget
                                                                  .analytics,
                                                              o: widget
                                                                  .observer,
                                                            )));
                                              },
                                              child: Text(
                                                L10n.of(context)
                                                    .txt_privacy_and_policy,
                                                style: Theme.of(context)
                                                    .primaryTextTheme
                                                    .subtitle2
                                                    .copyWith(
                                                        color: Theme.of(context)
                                                            .primaryColor),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      Container(
                                        height: 50,
                                        margin: EdgeInsets.only(top: 30),
                                        width:
                                            MediaQuery.of(context).size.width,
                                        child: TextButton(
                                          onPressed: () {
                                            if (_cEmail.text.isNotEmpty &&
                                                _cPassword.text.isNotEmpty &&
                                                _cPassword.text.trim().length >=
                                                    2 &&
                                                _cConfirmPassword
                                                    .text.isNotEmpty &&
                                                _cPassword.text.trim() ==
                                                    _cConfirmPassword.text
                                                        .trim() &&
                                                _isacceptPrivacy &&
                                                _isValidate) {
                                              Navigator.of(context).push(
                                                MaterialPageRoute(
                                                  builder: (BuildContext
                                                          context) =>
                                                      GeneralInformationScreen(
                                                    _cEmail.text.trim(),
                                                    _cPassword.text.trim(),
                                                    a: widget.analytics,
                                                    o: widget.observer,
                                                  ),
                                                ),
                                              );
                                            } else if (_cEmail.text.isEmpty) {
                                              showSnackBar(
                                                  key: _scaffoldKey,
                                                  snackBarMessage: L10n.of(
                                                          context)
                                                      .txt_please_enter_email);
                                            } else if (_cPassword
                                                    .text.isEmpty ||
                                                _cPassword.text.trim().length <
                                                    2) {
                                              showSnackBar(
                                                  key: _scaffoldKey,
                                                  snackBarMessage: L10n.of(
                                                          context)
                                                      .txt_password_should_be_of_minimum_2_characters);
                                            } else if (_cConfirmPassword
                                                    .text.isEmpty ||
                                                _cConfirmPassword.text.trim() !=
                                                    _cPassword.text.trim()) {
                                              showSnackBar(
                                                  key: _scaffoldKey,
                                                  snackBarMessage: L10n.of(
                                                          context)
                                                      .txt_password_do_not_match);
                                            } else if (!_isacceptPrivacy) {
                                              showSnackBar(
                                                  key: _scaffoldKey,
                                                  snackBarMessage: L10n.of(
                                                          context)
                                                      .txt_please_accept_privacy_and_policy);
                                            } else if (_cEmail.text.isEmpty ||
                                                !_isValidate) {
                                              showSnackBar(
                                                  key: _scaffoldKey,
                                                  snackBarMessage: L10n.of(
                                                          context)
                                                      .txt_please_enter_valid_email);
                                            }
                                          },
                                          child: Text(
                                            L10n.of(context).btn_next,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        margin:
                                            EdgeInsets.only(top: 20, left: 30),
                                        alignment: Alignment.center,
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              L10n.of(context)
                                                  .txt_already_have_an_account,
                                              textAlign: TextAlign.center,
                                              style: Theme.of(context)
                                                  .primaryTextTheme
                                                  .subtitle2,
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                Navigator.of(context).push(
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            SignInScreen(
                                                              a: widget
                                                                  .analytics,
                                                              o: widget
                                                                  .observer,
                                                            )));
                                              },
                                              child: Text(
                                                L10n.of(context).btnSignIn,
                                                textAlign: TextAlign.center,
                                                style: Theme.of(context)
                                                    .primaryTextTheme
                                                    .subtitle2
                                                    .copyWith(
                                                        color: Theme.of(context)
                                                            .primaryColor),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ))
                ],
              ),
            )),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }
}
