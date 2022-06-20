import 'package:SnipSnap/screens/AddBeautyExpert/Model/base.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BaseRoute extends Base {
  BaseRoute({a, o, r})
      : super(
            routeName: r.toString(),
            analytics: a as FirebaseAnalytics,
            observer: o as FirebaseAnalyticsObserver);

  @override
  BaseRouteState createState() => BaseRouteState();
}

class BaseRouteState extends BaseState with RouteAware {
  BaseRouteState() : super();

  @override
  Widget build(BuildContext context) => null;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void didPopNext() {
    _setCurrentScreen();
    _sendAnalyticsEvent();
  }

  @override
  void didPush() {
    _setCurrentScreen();
    _sendAnalyticsEvent();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void hideLoader() {
    Navigator.pop(context);
  }

  @override
  void initState() {
    super.initState();
    _setCurrentScreen();
    _sendAnalyticsEvent();
  }

  Future<void> _sendAnalyticsEvent() async {
    await widget.observer.analytics.logEvent(
      name: widget.routeName,
      parameters: <String, dynamic>{},
    );
  }

  Future<void> _setCurrentScreen() async {
    await widget.observer.analytics.setCurrentScreen(
      screenName: widget.routeName,
      screenClassOverride: widget.routeName,
    );
  }
}
