import 'dart:io';

import 'package:SnipSnap/vendor/dialogs/settingSaveDialog.dart';
import 'package:SnipSnap/vendor/models/businessLayer/baseRoute.dart';
import 'package:SnipSnap/vendor/models/businessLayer/global.dart' as global;
import 'package:flutter/material.dart';
import 'package:SnipSnap/generated/l10n.dart';

class SettingScreen extends BaseRoute {
  SettingScreen({a, o}) : super(a: a, o: o, r: 'SettingScreen');
  @override
  _SettingScreenState createState() => new _SettingScreenState();
}

class _SettingScreenState extends BaseRouteState {
  bool shopValue = false;
  GlobalKey<ScaffoldState> _scaffoldKey;
  String onlineStatus;
  bool isloading = true;

  _SettingScreenState() : super();

  @override
  Widget build(BuildContext context) {
    return sc(
      WillPopScope(
        onWillPop: () {
          Navigator.of(context).pop();
          return null;
        },
        child: Scaffold(
          bottomNavigationBar: Container(
            margin: EdgeInsets.only(top: 15, bottom: 15, left: 10, right: 10),
            width: MediaQuery.of(context).size.width,
            height: 50,
            child: TextButton(
              onPressed: () {
                FocusScope.of(context).unfocus();
                _saveSetting();
              },
              child: Text(
                L10n.of(context).btn_save_setting,
              ),
            ),
            decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.all(Radius.circular(10))),
          ),
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
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Padding(
                        padding: Platform.isAndroid
                            ? EdgeInsets.only(bottom: 15, left: 10, top: 10)
                            : EdgeInsets.only(bottom: 15, left: 10, top: 20),
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
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 30, bottom: 10),
                        child: Text(L10n.of(context).lbl_settings,
                            style:
                                Theme.of(context).primaryTextTheme.headline3),
                      ),
                      Card(
                        margin: EdgeInsets.only(top: 8),
                        child: ListTile(
                          title: Text(L10n.of(context).lbl_shop_open),
                          trailing: Switch(
                            value: shopValue,
                            onChanged: (val) {
                              setState(() {
                                shopValue = val;
                              });
                            },
                            activeColor: Theme.of(context).primaryColor,
                          ),
                        ),
                      ),
                    ],
                  )),
            ],
          ),
        ),
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
    if (global.user.online_status != null) {
      if (global.user.online_status == "ON") {
        setState(() {
          shopValue = true;
        });
      } else {
        setState(() {
          shopValue = false;
        });
      }
    }
  }

  _saveSetting() async {
    try {
      if (shopValue) {
        setState(() {
          onlineStatus = "ON";
        });
      } else {
        setState(() {
          onlineStatus = "OFF";
        });
      }
      bool isConnected = await br.checkConnectivity();
      if (isConnected) {
        showOnlyLoaderDialog();
        await apiHelper.setting(global.user.id, onlineStatus).then((result) {
          if (result.status == "1") {
            hideLoader();
            setState(() {
              global.user.online_status = onlineStatus;
            });
            showDialog(
                context: context,
                builder: (BuildContext context) => SettingSaveDialog(
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
    } catch (e) {}
  }
}
