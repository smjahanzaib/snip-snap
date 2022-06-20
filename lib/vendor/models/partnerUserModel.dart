// ignore_for_file: avoid_bool_literals_in_conditional_expressions, always_specify_types, directives_ordering

import 'dart:io';

import 'package:SnipSnap/screens/AddBeautyExpert/Model/reviewModel.dart';
import 'package:SnipSnap/screens/AddBeautyExpert/Model/vendorTimingModel.dart';
import 'package:SnipSnap/screens/AddBeautyExpert/Model/global.dart' as global;

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class CurrentUser {
  int id;
  String vendor_phone;
  String salon_name;
  double rating;

  String vendor_name;
  String owner_name;
  String vendor_email;
  String vendor_password;
  String vendor_address;
  File vendor_image;
  TimeOfDay open_hour;
  TimeOfDay close_hour;
  List<VendorTiming> weekly_time = [];
  int cityadmin_id;

  int type;
  String vendor_logo;

  String name;
  String firstname;
  String lastname;
  String image;
  String email;
  int otp;
  String facebook_id;
  DateTime email_verified_at;
  String password;
  String device_id;
  int wallet_credits;
  int rewards;
  bool phone_verified;
  String referral_code;
  String remember_token;
  DateTime created_at;
  DateTime updated_at;
  String token;
  String description;

  String user_name;
  String user_email;
  String user_password;
  var user_image;
  String fb_id;
  String online_status;
  List<Review> review = [];
  CurrentUser();

  Map<String, dynamic> toJson() => {
        'vendor_id': id,
        'vendor_phone': vendor_phone != null && vendor_phone.isNotEmpty
            ? vendor_phone
            : null,
        'vendor_name':
            vendor_name != null && vendor_name.isNotEmpty ? vendor_name : null,
        'owner':
            owner_name != null && owner_name.isNotEmpty ? owner_name : null,
        'firstname':
            firstname != null && firstname.isNotEmpty ? firstname : null,
        'lastname': lastname != null && lastname.isNotEmpty ? lastname : null,
        'user_image': user_image != null ? user_image : null,
        'vendor_email': vendor_email != null && vendor_email.isNotEmpty
            ? vendor_email
            : null,
        'email_verified_at': email_verified_at != null
            ? email_verified_at.toIso8601String()
            : null,
        'fb_id': fb_id != null && fb_id.isNotEmpty ? fb_id : null,
        'user_password': user_password != null && user_password.isNotEmpty
            ? user_password
            : null,
        'created_at': created_at != null ? created_at.toIso8601String() : null,
        'updated_at': updated_at != null ? updated_at.toIso8601String() : null,
        'otp': otp != null ? otp : null,
        'device_id': device_id != null && device_id.isNotEmpty
            ? global.appDeviceId
            : null,
        'wallet_credits': wallet_credits != null ? wallet_credits : null,
        'rewards': rewards != null ? rewards : null,
        'phone_verified':
            phone_verified != null && phone_verified == true ? 1 : 0,
        'referral_code': referral_code != null && referral_code.isNotEmpty
            ? referral_code
            : null,
        'remember_token': remember_token != null && remember_token.isNotEmpty
            ? remember_token
            : null,
        'token': token != null && token.isNotEmpty ? token : null,
        'vendor_password': vendor_password != null && vendor_password.isNotEmpty
            ? vendor_password
            : null,
        'vendor_address': vendor_address != null && vendor_address.isNotEmpty
            ? vendor_address
            : null,
        'description':
            description != null && description.isNotEmpty ? description : null,
        'type': type != null ? type : null,
        'vendor_image': vendor_image != null
            ? MultipartFile.fromFile(user_image.path.toString())
            : null,
        'vendor_logo': vendor_logo != null ? vendor_logo : null,
      };

  CurrentUser.fromJson(Map<String, dynamic> json) {
    try {
      id = int.parse((json['vendor_id'] ?? 0).toString());
      vendor_phone = (json['vendor_phone'] ?? '').toString();
      vendor_name = (json['vendor_name'] ?? '').toString();
      owner_name = (json['owner'] ?? '').toString();
      lastname = (json['lastname'] ?? '').toString();
      firstname = (json['firstname'] ?? '').toString();
      image = (json['image'] ?? '').toString();
      otp = int.parse((json['otp'] ?? 0).toString());
      facebook_id = (json['facebook_id'] ?? '').toString();
      vendor_email = (json['vendor_email'] ?? '').toString();
      password = (json['password'] ?? '').toString();
      email_verified_at = json['email_verified_at'] != null
          ? DateTime.parse(json['email_verified_at'].toString()).toLocal()
          : null;
      device_id = (json['device_id'] ?? '0').toString();
      wallet_credits = int.parse((json['wallet_credits'] ?? 0).toString());
      rewards = int.parse((json['rewards'] ?? 0).toString());
      phone_verified =
          json['phone_verified'] != null && json['phone_verified'] == 1
              ? true
              : false;
      referral_code = (json['referral_code'] ?? '').toString();
      remember_token = (json['remember_token'] ?? '').toString();

      vendor_password = (json['vendor_password'] ?? '').toString();
      vendor_address = (json['vendor_loc'] ?? '').toString();
      description = (json['description'] ?? '').toString();
      token = (json['token'] ?? '').toString();
      vendor_logo = (json['vendor_logo'] ?? '').toString();
      salon_name = (json['salon_name'] ?? '').toString();
      var data = json['weekly_time']
          .map((e) => VendorTiming.fromJson(e as Map<String, dynamic>));
      weekly_time = (json['weekly_time'] != null)
          ? List<VendorTiming>.from(data as Iterable<dynamic>)
          : [];

      rating = json['rating'] != null
          ? double.parse(json['rating'].toString())
          : null;
      online_status = (json['online_status'] ?? '').toString();
      type = int.parse((json['type'] ?? 0).toString());
    } catch (e) {
      print("Exception - partnerUserModel.dart - CurrentUser.fromJson():" +
          e.toString());
    }
  }
}
