import 'dart:async';
import 'dart:core';
import 'dart:io';

import 'package:SnipSnap/screens/AddBeautyExpert/Model/apiHelper.dart';
import 'package:SnipSnap/screens/AddBeautyExpert/Model/businessRule.dart';

import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Base extends StatefulWidget {
  final FirebaseAnalytics analytics;
  final FirebaseAnalyticsObserver observer;
  final String routeName;

  Base({this.analytics, this.observer, this.routeName});

  @override
  BaseState createState() => BaseState();
}

class BaseState extends State<Base>
    with TickerProviderStateMixin, WidgetsBindingObserver {
  bool bannerAdLoaded = false;

  APIHelper apiHelper;
  BusinessRule br;

  BaseState() {
    apiHelper = APIHelper();
    br = BusinessRule(apiHelper);
  }

  @override
  void setState(fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  @override
  Widget build(BuildContext context) {
    return null;
  }

  void closeDialog() {
    Navigator.of(context).pop();
  }

  showNetworkErrorSnackBar(GlobalKey<ScaffoldState> scaffoldKey) {
    // try {
    //   bool isConnected;
    //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    //     duration: Duration(days: 1),
    //     content: Row(
    //       mainAxisSize: MainAxisSize.min,
    //       mainAxisAlignment: MainAxisAlignment.start,
    //       crossAxisAlignment: CrossAxisAlignment.center,
    //       children: <Widget>[
    //         Icon(
    //           Icons.signal_wifi_off,
    //           color: Colors.white,
    //         ),
    //         Expanded(
    //           child: Padding(
    //             padding: const EdgeInsets.only(
    //               left: 16.0,
    //             ),
    //             child: Text(
    //               'No internet available',
    //               textAlign: TextAlign.start,
    //             ),
    //           ),
    //         ),
    //       ],
    //     ),
    //     action: SnackBarAction(
    //         textColor: Colors.white,
    //         label: 'RETRY',
    //         onPressed: () async {
    //           isConnected = await br.checkConnectivity();
    //           if (isConnected) {
    //             // ScaffoldMessenger.of(context).removeCurrentSnackBar();
    //           } else {
    //             showNetworkErrorSnackBar(scaffoldKey);
    //           }
    //         }),
    //     backgroundColor: Colors.grey,
    //   ));
    // } catch (e) {
    //   print("Exception -  base.dart - showNetworkErrorSnackBar():" +
    //       e.toString());
    // }
  }

  Widget sc(Widget body) {
    return Platform.isIOS ? body : SafeArea(child: body);
  }

  void showSnackBar({String snackBarMessage, Key key}) {
    // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    //   key: key,
    //   content: Text(
    //     snackBarMessage,
    //     textAlign: TextAlign.center,
    //   ),
    //   duration: Duration(seconds: 2),
    // ));
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    super.didChangeAppLifecycleState(state);
  }

  showOnlyLoaderDialog() {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          elevation: 0,
          backgroundColor: Colors.transparent,
          child: Center(child: new CircularProgressIndicator()),
        );
      },
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<bool> dontCloseDialog() async {
    return false;
  }

  void hideLoader() {
    Navigator.pop(context);
  }

  Future exitAppDialog() async {
    try {
      showCupertinoDialog(
          context: context,
          builder: (BuildContext context) {
            return Theme(
              data: ThemeData(dialogBackgroundColor: Colors.white),
              child: CupertinoAlertDialog(
                title: Text(
                  "Exit app",
                ),
                content: Text(
                  "Are you sure you want to exit app?",
                ),
                actions: <Widget>[
                  CupertinoDialogAction(
                    child: Text(
                      'Cancel',
                      style: TextStyle(color: Colors.red),
                    ),
                    onPressed: () {
                      return Navigator.of(context).pop(false);
                    },
                  ),
                  CupertinoDialogAction(
                    child: Text("Exit"),
                    onPressed: () async {
                      exit(0);
                    },
                  ),
                ],
              ),
            );
          });
    } catch (e) {
      print('Exception - base.dart - exitAppDialog(): ' + e.toString());
    }
  }

  @override
  void initState() async {
    super.initState();
  }
}
