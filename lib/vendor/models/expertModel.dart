// ignore_for_file: prefer_single_quotes, prefer_if_null_operators, non_constant_identifier_names, sort_constructors_first, always_specify_types

import 'package:SnipSnap/screens/AddBeautyExpert/Model/reviewModel.dart';

class Expert {
  int vendor_id;
  String staff_name;
  String staff_image;
  String staff_description;
  int staff_id;
  List<Review> review = [];

  Expert();
  Map<String, dynamic> toJson() => {
        'vendor_id': vendor_id != null ? vendor_id : null,
        'staff_name': staff_name != null ? staff_name : null,
        'staff_image': staff_image != null ? staff_image : null,
        'staff_description':
            staff_description != null ? staff_description : null,
        'staff_id': staff_id != null ? staff_id : null,
      };

  Expert.fromJson(Map<String, dynamic> json) {
    try {
      vendor_id = int.parse((json['vendor_id'] ?? 0).toString());
      staff_name = (json['staff_name'] ?? '').toString();
      staff_image = (json['staff_image'] ?? '').toString();
      staff_description = (json['staff_description'] ?? '').toString();
      staff_id = int.parse((json['staff_id'] ?? 0).toString());
    } catch (e) {
      print("Exception - expertModel.dart - Expert.fromJson():" + e.toString());
    }
  }
}
