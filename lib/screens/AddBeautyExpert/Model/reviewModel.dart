// ignore_for_file: prefer_single_quotes

import 'package:SnipSnap/screens/AddBeautyExpert/Model/userModel.dart';

class Review {
  int id;
  double rating;
  String descriptionForPartner;
  String descriptionForExpert;
  int user_id;
  int vendor_id;
  int product_id;
  int active;
  String name;
  String image;
  DateTime created_at;
  User user;

  Review();

  Review.fromJson(Map<String, dynamic> json) {
    try {
      id = int.parse((json['id'] ?? 0).toString());
      user_id = int.parse((json['user_id'] ?? 0).toString());
      product_id = int.parse((json['product_id'] ?? '').toString());
      descriptionForPartner = (json['description'] ?? '').toString();
      descriptionForExpert = (json['review_description'] ?? '').toString();
      vendor_id = int.parse((json['vendor_id'] ?? '').toString());
      rating =
          json['rating'] != null ? double.parse(json['rating'].toString()) : 0;
      active = int.parse((json['active'] ?? 0).toString());
      name = (json['name'] ?? '').toString();
      image = (json['image'] ?? "").toString();
      created_at = json['created_at'] != null
          ? DateTime.parse(json['created_at'].toString()).toLocal()
          : null;
      user = (json['user'] != null)
          ? User.fromJson(json['user'] as Map<String, dynamic>)
          : null;
    } catch (e) {
      print("Exception - reviewModel.dart - Review.fromJson():" + e.toString());
    }
  }
}
