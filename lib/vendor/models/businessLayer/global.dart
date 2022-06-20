// ignore_for_file: unused_local_variable, directives_ordering

import 'dart:convert';
import 'dart:io';

// import 'package:SnipSnap/vendor/models/currencyModel.dart';
// import 'package:SnipSnap/vendor/models/partnerUserModel.dart';
// import 'package:device_info_plus/device_info_plus.dart';
import 'package:SnipSnap/screens/AddBeautyExpert/Model/currencyModel.dart';
import 'package:SnipSnap/screens/AddBeautyExpert/Model/partnerUserModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

String appName = 'Secure Wallet';

String appVersion = '1.0';
String appDeviceId;
SharedPreferences sp;
Currency currency = Currency();
CurrentUser user = CurrentUser();
// String baseUrl = 'https://thecodecafe.in/gofresha/api/partner/';
String baseUrl = 'https://gofresha.tecmanic.com/api/partner/';
//  String baseUrlForImage = 'https://thecodecafe.in/gofresha/';
String baseUrlForImage = 'https://gofresha.tecmanic.com/';
List<String> rtlLanguageCodeLList = [
  'ar',
  'arc',
  'ckb',
  'dv',
  'fa',
  'ha',
  'he',
  'khw',
  'ks',
  'ps',
  'ur',
  'uz_AF',
  'yi'
];
String languageCode;

bool isRTL = false;
Future<Map<String, String>> getApiHeaders(bool authorizationRequired) async {
  Map<String, String> apiHeader = new Map<String, String>();
  if (authorizationRequired) {
    sp = await SharedPreferences.getInstance();
    if (sp.getString('currentUser') != null) {
      var data = json.decode(sp.getString('currentUser'));
      final CurrentUser currentUser =
          CurrentUser.fromJson(data as Map<String, dynamic>);
    }
  }
  apiHeader.addAll({'Content-Type': 'application/json'});
  apiHeader.addAll({'Accept': 'application/json'});
  return apiHeader;
}

// Future<String> getDeviceId() async {
//   String deviceId;
//   final DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();

//   if (Platform.isAndroid) {
//     AndroidDeviceInfo androidDeviceInfo = await deviceInfo.androidInfo;
//     deviceId = androidDeviceInfo.androidId;
//   } else if (Platform.isIOS) {
//     IosDeviceInfo androidDeviceInfo = await deviceInfo.iosInfo;
//     deviceId = androidDeviceInfo.identifierForVendor;
//   }
//   return deviceId;
// }
