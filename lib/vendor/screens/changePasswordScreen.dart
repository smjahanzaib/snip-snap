import 'dart:io';
import 'dart:ui';

import 'package:SnipSnap/vendor/dialogs/changePasswordSuccessDialog.dart';
import 'package:SnipSnap/vendor/models/businessLayer/baseRoute.dart';
import 'package:SnipSnap/vendor/models/businessLayer/global.dart' as global;
import 'package:flutter/material.dart';
import 'package:SnipSnap/generated/l10n.dart';

class ChangePasswordScreen extends BaseRoute {
  final bool isFromVarifyOtp;

  ChangePasswordScreen(this.isFromVarifyOtp, {a, o})
      : super(a: a, o: o, r: 'ChangePasswordScreen');
  @override
  _ChangePasswordScreenState createState() =>
      new _ChangePasswordScreenState(this.isFromVarifyOtp);
}

class _ChangePasswordScreenState extends BaseRouteState {
  bool isFromVarifyOtp;
  TextEditingController _cEmail = new TextEditingController();
  TextEditingController _cPassword = new TextEditingController();
  TextEditingController _cConfirmPassword = new TextEditingController();
  TextEditingController _cOldPassword = new TextEditingController();
  bool _showOldPassword = true;
  bool _showNewPassword = true;
  bool _showConfirmPassword = true;
  GlobalKey<ScaffoldState> _scaffoldKey;
  var _fOldPassword = FocusNode();
  var _fPassword = FocusNode();

  var _fConfirmPassword = FocusNode();
  var _fDismiss = FocusNode();
  _ChangePasswordScreenState(this.isFromVarifyOtp) : super();

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
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Container(
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
                                : EdgeInsets.only(
                                    bottom: 15, left: 10, top: 20),
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
                          )
                        ],
                      ),
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
                                margin: EdgeInsets.only(top: 25),
                                child: Text(
                                  L10n.of(context).lbl_change_password,
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
                                      !isFromVarifyOtp
                                          ? Text(
                                              L10n.of(context).lbl_old_password,
                                              style: Theme.of(context)
                                                  .primaryTextTheme
                                                  .subtitle2,
                                            )
                                          : SizedBox(),
                                      !isFromVarifyOtp
                                          ? Padding(
                                              padding:
                                                  const EdgeInsets.only(top: 5),
                                              child: TextFormField(
                                                controller: _cOldPassword,
                                                obscureText: _showOldPassword,
                                                focusNode: _fOldPassword,
                                                onFieldSubmitted: (val) {
                                                  FocusScope.of(context)
                                                      .requestFocus(_fPassword);
                                                },
                                                decoration: InputDecoration(
                                                  hintText: L10n.of(context)
                                                      .hnt_email,
                                                  prefixIcon: Icon(
                                                    Icons.lock,
                                                  ),
                                                  suffixIcon: IconButton(
                                                    onPressed: () {
                                                      _showOldPassword =
                                                          !_showOldPassword;
                                                      setState(() {});
                                                    },
                                                    icon: Icon(_showOldPassword
                                                        ? Icons.visibility_off
                                                        : Icons.visibility),
                                                    color: Colors.black,
                                                  ),
                                                  contentPadding:
                                                      EdgeInsets.only(top: 5),
                                                ),
                                              ),
                                            )
                                          : SizedBox(),
                                      isFromVarifyOtp
                                          ? Container(
                                              margin: EdgeInsets.only(top: 10),
                                              child: Text(
                                                L10n.of(context).lblEmail,
                                                style: Theme.of(context)
                                                    .primaryTextTheme
                                                    .subtitle2,
                                              ),
                                            )
                                          : SizedBox(),
                                      isFromVarifyOtp
                                          ? Padding(
                                              padding:
                                                  const EdgeInsets.only(top: 5),
                                              child: TextFormField(
                                                controller: _cEmail,
                                                onFieldSubmitted: (val) {
                                                  FocusScope.of(context)
                                                      .requestFocus(
                                                          _fConfirmPassword);
                                                },
                                                decoration: InputDecoration(
                                                  hintText: L10n.of(context)
                                                      .hnt_email,
                                                  prefixIcon: Icon(Icons.mail),
                                                  contentPadding:
                                                      EdgeInsets.only(top: 5),
                                                ),
                                              ),
                                            )
                                          : SizedBox(),
                                      Container(
                                        margin: EdgeInsets.only(top: 10),
                                        child: Text(
                                          isFromVarifyOtp
                                              ? L10n.of(context).lblPassword
                                              : L10n.of(context)
                                                  .lbl_new_password,
                                          style: Theme.of(context)
                                              .primaryTextTheme
                                              .subtitle2,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 5),
                                        child: TextFormField(
                                          controller: _cPassword,
                                          obscureText: _showNewPassword,
                                          onFieldSubmitted: (val) {
                                            FocusScope.of(context).requestFocus(
                                                _fConfirmPassword);
                                          },
                                          decoration: InputDecoration(
                                            hintText:
                                                L10n.of(context).hnt_email,
                                            prefixIcon: Icon(Icons.lock),
                                            suffixIcon: IconButton(
                                              icon: Icon(_showNewPassword
                                                  ? Icons.visibility_off
                                                  : Icons.visibility),
                                              color: Colors.black,
                                              onPressed: () {
                                                _showNewPassword =
                                                    !_showNewPassword;
                                                setState(() {});
                                              },
                                            ),
                                            contentPadding:
                                                EdgeInsets.only(top: 5),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(top: 10),
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
                                          obscureText: _showConfirmPassword,
                                          controller: _cConfirmPassword,
                                          onFieldSubmitted: (val) {
                                            FocusScope.of(context)
                                                .requestFocus(_fDismiss);
                                          },
                                          decoration: InputDecoration(
                                            hintText:
                                                L10n.of(context).hnt_email,
                                            prefixIcon: Icon(
                                              Icons.lock,
                                            ),
                                            suffixIcon: IconButton(
                                              icon: Icon(_showConfirmPassword
                                                  ? Icons.visibility_off
                                                  : Icons.visibility),
                                              color: Colors.black,
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
                                        height: 50,
                                        margin: EdgeInsets.only(top: 25),
                                        width:
                                            MediaQuery.of(context).size.width,
                                        child: TextButton(
                                          onPressed: () {
                                            _changePassword();
                                          },
                                          child: Text(
                                            L10n.of(context)
                                                .btn_change_password,
                                          ),
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

  _changePassword() async {
    try {
      if (isFromVarifyOtp) // change password from otp...
      {
        if (_cPassword.text.isNotEmpty &&
            _cPassword.text == _cConfirmPassword.text) {
          bool isConnected = await br.checkConnectivity();
          if (isConnected) {
            showOnlyLoaderDialog();

            await apiHelper
                .changePasswordFromOtp(
                    _cEmail.text.trim(), _cPassword.text.trim())
                .then((result) {
              if (result.status == "1") {
                hideLoader();

                showDialog(
                    context: context,
                    builder: (BuildContext context) =>
                        ChangePasswordSuccessDialog(
                          a: widget.analytics,
                          o: widget.observer,
                        ));
              } else {
                hideLoader();
                showSnackBar(
                    key: _scaffoldKey, snackBarMessage: '${result.message}');
              }
            });
          } else {
            showNetworkErrorSnackBar(_scaffoldKey);
          }
        } else if (_cEmail.text.isEmpty) {
          showSnackBar(
              key: _scaffoldKey,
              snackBarMessage: L10n.of(context).txt_please_enter_email);
        } else if (_cPassword.text != _cConfirmPassword.text) {
          showSnackBar(
              key: _scaffoldKey,
              snackBarMessage: L10n.of(context)
                  .txt_password_and_confirm_password_do_not_match);
        }
      } else //simple change password
      {
        if (_cPassword.text.isNotEmpty &&
            _cPassword.text == _cConfirmPassword.text &&
            _cOldPassword.text.isNotEmpty) {
          bool isConnected = await br.checkConnectivity();
          if (isConnected) {
            showOnlyLoaderDialog();

            await apiHelper
                .changePassword(global.user.id, _cOldPassword.text.trim(),
                    _cPassword.text.trim(), _cConfirmPassword.text.trim())
                .then((result) {
              if (result.status == "1") {
                hideLoader();

                showDialog(
                    context: context,
                    builder: (BuildContext context) =>
                        ChangePasswordSuccessDialog(
                          a: widget.analytics,
                          o: widget.observer,
                        ));
              } else {
                hideLoader();
                showSnackBar(
                    key: _scaffoldKey, snackBarMessage: '${result.message}');
              }
            });
          } else {
            showNetworkErrorSnackBar(_scaffoldKey);
          }
        } else if (_cOldPassword.text.isEmpty) {
          showSnackBar(
              key: _scaffoldKey,
              snackBarMessage: L10n.of(context).txt_please_enter_old_password);
        } else if (_cPassword.text != _cConfirmPassword.text) {
          showSnackBar(
              key: _scaffoldKey,
              snackBarMessage: L10n.of(context)
                  .txt_password_and_confirm_password_do_not_match);
        } else if (_cPassword.text.isEmpty) {
          showSnackBar(
              key: _scaffoldKey,
              snackBarMessage: L10n.of(context).txt_please_enter_new_password);
        }
      }
    } catch (e) {
      print("Exception - changePassword.dart - _changePassword():" +
          e.toString());
    }
  }
}
