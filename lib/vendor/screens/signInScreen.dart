import 'dart:async';
import 'dart:io';

import 'package:SnipSnap/vendor/models/businessLayer/baseRoute.dart';
import 'package:SnipSnap/vendor/models/businessLayer/global.dart' as global;
import 'package:SnipSnap/vendor/models/partnerUserModel.dart';
import 'package:SnipSnap/vendor/screens/chooseSignUpSignInScreen.dart';
import 'package:SnipSnap/vendor/screens/signUpScreen.dart';
import 'package:SnipSnap/vendor/screens/verifyOtpScreen.dart';
import 'package:SnipSnap/vendor/widgets/bottomNavigationBar.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:SnipSnap/generated/l10n.dart';

class SignInScreen extends BaseRoute {
  final int screenId;
  SignInScreen({a, o, this.screenId}) : super(a: a, o: o, r: 'SignInScreen');
  @override
  _SignInScreenState createState() =>
      new _SignInScreenState(screenId: screenId);
}

class _SignInScreenState extends BaseRouteState {
  bool _isValidateEmail = false;
  bool _isValidate = false;
  var _fPassword = new FocusNode();

  TextEditingController _cEmail = new TextEditingController();
  TextEditingController _cPassword = new TextEditingController();
  TextEditingController _cForgotEmail = new TextEditingController();
  GlobalKey<ScaffoldState> _scaffoldKey;
  int screenId;
  CurrentUser user = new CurrentUser();
  bool _showPassword = true;
  bool _isRemember = false;
  _SignInScreenState({this.screenId}) : super();
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        screenId == 1
            ? exitAppDialog()
            : Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => ChooseSignUpSignInScreen(
                      a: widget.analytics,
                      o: widget.observer,
                    )));
        return null;
      },
      child: sc(
        Scaffold(
            resizeToAvoidBottomInset: false,
            body: Stack(
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
                            screenId == 1
                                ? exitAppDialog()
                                : Navigator.of(context).push(
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            ChooseSignUpSignInScreen(
                                              a: widget.analytics,
                                              o: widget.observer,
                                            )),
                                  );
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
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: Container(
                      margin: EdgeInsets.only(left: 10, right: 10),
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        children: [
                          Container(
                              margin: EdgeInsets.only(top: 30, bottom: 10),
                              child: Text(
                                L10n.of(context).lblSignIn,
                                style: Theme.of(context)
                                    .primaryTextTheme
                                    .headline3,
                              )),
                          Container(
                            margin: EdgeInsets.only(top: 15),
                            width: MediaQuery.of(context).size.width,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
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
                                    onEditingComplete: () {
                                      FocusScope.of(context)
                                          .requestFocus(_fPassword);
                                    },
                                    controller: _cEmail,
                                    onChanged: (val) {
                                      _isValidate =
                                          EmailValidator.validate(val);
                                    },
                                    decoration: InputDecoration(
                                      hintText: L10n.of(context).hnt_email,
                                      prefixIcon: Icon(Icons.mail),
                                      contentPadding: EdgeInsets.only(top: 5),
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
                                    focusNode: _fPassword,
                                    controller: _cPassword,
                                    obscureText: _showPassword,
                                    onFieldSubmitted: (val) {},
                                    decoration: InputDecoration(
                                      hintText: '******',
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
                                      contentPadding: EdgeInsets.only(top: 5),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      height: 17,
                                      width: 17,
                                      child: Checkbox(
                                          value: _isRemember,
                                          onChanged: (val) {
                                            _isRemember = val;
                                            setState(() {});
                                            if (!_isRemember) {
                                              global.sp
                                                  .remove('isRememberMeEmail');
                                            }
                                          }),
                                    ),
                                    Container(
                                        margin: global.isRTL
                                            ? EdgeInsets.only(right: 7)
                                            : EdgeInsets.only(left: 7),
                                        child: GestureDetector(
                                          onTap: () {
                                            _isRemember = !_isRemember;
                                            setState(() {});
                                            if (!_isRemember) {
                                              global.sp
                                                  .remove('isRememberMeEmail');
                                            }
                                          },
                                          child: Text(
                                            L10n.of(context).lblRememberMe,
                                            style: Theme.of(context)
                                                .primaryTextTheme
                                                .subtitle2,
                                          ),
                                        )),
                                  ],
                                ),
                                GestureDetector(
                                  onTap: () {
                                    _forgotPassword();
                                  },
                                  child: Text(
                                    L10n.of(context).lblForgotPassword,
                                    style: Theme.of(context)
                                        .primaryTextTheme
                                        .headline1,
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            height: 50,
                            margin: EdgeInsets.only(top: 25),
                            width: MediaQuery.of(context).size.width,
                            child: TextButton(
                              onPressed: () {
                                _loginWithEmail();
                              },
                              child: Text(
                                L10n.of(context).btnSignIn,
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 25, left: 30),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  L10n.of(context).txt_if_you_have_no_account,
                                  style: Theme.of(context)
                                      .primaryTextTheme
                                      .subtitle2,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.of(context)
                                        .push(MaterialPageRoute(
                                            builder: (context) => SignUpScreen(
                                                  a: widget.analytics,
                                                  o: widget.observer,
                                                )));
                                  },
                                  child: Text(
                                    L10n.of(context).btnSignUp,
                                    style: Theme.of(context)
                                        .primaryTextTheme
                                        .headline1,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ))
              ],
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
    if (global.sp.getString('isRememberMeEmail') != null) {
      _cEmail.text = global.sp.getString('isRememberMeEmail');
      _isRemember = true;
      _isValidate = true;
    }
  }

  Future _forgotPassword() async {
    try {
      await showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: Text(
                  L10n.of(context).lbl_forgot_password,
                  textAlign: TextAlign.center,
                ),
                titleTextStyle: Theme.of(context).primaryTextTheme.headline3,
                content: Container(
                  height: 200,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 5),
                        child: Text(
                          L10n.of(context).lblEmail,
                          style: Theme.of(context).primaryTextTheme.subtitle2,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: TextFormField(
                          controller: _cForgotEmail,
                          decoration: InputDecoration(
                            hintText: L10n.of(context).hnt_email,
                            prefixIcon: Icon(Icons.mail),
                            contentPadding: EdgeInsets.only(top: 5, left: 10),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 17),
                        height: 50,
                        width: MediaQuery.of(context).size.width,
                        child: TextButton(
                          onPressed: () async {
                            _isValidateEmail = EmailValidator.validate(
                                _cForgotEmail.text.trim());
                            if (_isValidateEmail &&
                                _cForgotEmail.text.isNotEmpty) {
                              bool isConnected = await br.checkConnectivity();
                              if (isConnected) {
                                showOnlyLoaderDialog();
                                await apiHelper
                                    .forGotPassword(_cForgotEmail.text.trim())
                                    .then((result) {
                                  if (result.status == "1") {
                                    hideLoader();
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                VerifyOtpScreen(
                                                  _cForgotEmail.text.trim(),
                                                  a: widget.analytics,
                                                  o: widget.observer,
                                                )));
                                  } else {
                                    hideLoader();
                                    Navigator.of(context).pop();
                                    showSnackBar(
                                        key: _scaffoldKey,
                                        snackBarMessage: '${result.message}');
                                  }
                                });
                              } else {
                                showNetworkErrorSnackBar(_scaffoldKey);
                              }
                            } else {
                              showSnackBar(
                                  key: _scaffoldKey,
                                  snackBarMessage: L10n.of(context)
                                      .txt_please_enter_valid_email);
                            }
                          },
                          child: Text(
                            L10n.of(context).btn_send_code,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )).then((paymentMode2) {});
    } catch (e) {
      print('Exception: signInScreen: _forgotPassword(): ${e.toString()}');
    }
  }

  _loginWithEmail() async {
    try {
      FocusScope.of(context).unfocus();
      user.vendor_email = _cEmail.text.trim();
      user.vendor_password = _cPassword.text.trim();
      user.device_id = global.appDeviceId;

      if (_cEmail.text.isNotEmpty &&
          _cPassword.text.isNotEmpty &&
          _cPassword.text.trim().length >= 2 &&
          _isValidate) {
        bool isConnected = await br.checkConnectivity();
        if (isConnected) {
          showOnlyLoaderDialog();
          // await apiHelper.loginWithEmail(user).then((result) async {
          //   if (result != null) {
          //     if (result.status == "1") {
          //       // global.user = result.recordList as CurrentUser;
          //       br.saveUser(global.user);
          //       if (_isRemember) {
          //         await global.sp
          //             .setString('isRememberMeEmail', _cEmail.text.trim());
          //       }
          //       hideLoader();

          //       Navigator.of(context).push(
          //         MaterialPageRoute(
          //             builder: (context) => BottomNavigationWidget(
          //                   a: widget.analytics,
          //                   o: widget.observer,
          //                 )),
          //       );
          //     } else {
          //       hideLoader();
          //       showSnackBar(
          //           key: _scaffoldKey, snackBarMessage: '${result.message}');
          //     }
          //   }
          // });
        } else {
          showNetworkErrorSnackBar(_scaffoldKey);
        }
      } else if (_cEmail.text.isEmpty) {
        showSnackBar(
            key: _scaffoldKey, snackBarMessage: 'Please enter valid Email Id');
      } else if (_cPassword.text.isEmpty || _cPassword.text.trim().length < 2) {
        showSnackBar(
            key: _scaffoldKey,
            snackBarMessage: 'Password should be of minimun 2 characters');
      } else if (_cEmail.text.isEmpty || !_isValidate) {
        showSnackBar(
            key: _scaffoldKey, snackBarMessage: 'Please enter valid email');
      }
    } catch (e) {
      print(
          "Exception - signInScreen.dart - _loginWithEmail():" + e.toString());
    }
  }
}
