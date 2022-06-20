import 'package:SnipSnap/screens/AddBeautyExpert/Model/userModel.dart';

class UserRequest {
  int vendor_id;
  int id;
  String service_date;
  String service_time;
  String total_price;
  int status;
  String statustext;

  User user;

  UserRequest();
  Map<String, dynamic> toJson() => {
        'vendor_id': vendor_id != null ? vendor_id : null,
        'service_date': service_date != null ? service_date : null,
        'service_time': service_time != null ? service_time : null,
      };

  UserRequest.fromJson(Map<String, dynamic> json) {
    try {
      vendor_id = int.parse((json['vendor_id'] ?? 0).toString());
      id = int.parse((json['id'] ?? 0).toString());
      service_date = (json['service_date'] ?? '').toString();
      statustext = (json['statustext'] ?? '').toString();
      user = (json['user'] != null)
          ? User.fromJson(json['user'] as Map<String, dynamic>)
          : null;
      total_price = (json['total_price'] ?? '').toString();
      service_time = (json['service_time'] ?? '').toString();
    } catch (e) {
      print("Exception - userRequestModel.dart - UserRequest.fromJson():" +
          e.toString());
    }
  }
}
