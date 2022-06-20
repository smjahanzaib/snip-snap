import 'package:SnipSnap/screens/AddBeautyExpert/Model/bookingDetailItemModel.dart';
import 'package:SnipSnap/screens/AddBeautyExpert/Model/userModel.dart';

class BookingDetail {
  int vendor_id;
  int id;
  String service_date;
  String service_time;
  String total_price;
  int status;
  String statustext;
  String rem_price;
  String coupon_discount;
  String mobile;

  User user;
  List<BookingDetailItem> items = [];

  BookingDetail();
  Map<String, dynamic> toJson() => {
        'vendor_id': vendor_id != null ? vendor_id : null,
        'service_date': service_date != null ? service_date : null,
        'service_time': service_time != null ? service_time : null,
      };

  BookingDetail.fromJson(Map<String, dynamic> json) {
    try {
      vendor_id = int.parse((json['vendor_id'] ?? 0).toString());
      id = int.parse((json['id'] ?? 0).toString());
      service_date = (json['service_date'] ?? '').toString();
      statustext = (json['statustext'] ?? '').toString();
      user = (json['user'] != null)
          ? User.fromJson(json['user'] as Map<String, dynamic>)
          : null;
      total_price = (json['total_price'] ?? '').toString();
      rem_price = (json['rem_price'] ?? '').toString();
      coupon_discount = (json['coupon_discount'] ?? '').toString();
      mobile = (json['mobile'] ?? '').toString();

      service_time = (json['service_time'] ?? '').toString();
      items = (json['items'] != null)
          ? List<BookingDetailItem>.from((json['items'].map(
                  (e) => BookingDetailItem.fromJson(e as Map<String, dynamic>))
              as Iterable<dynamic>))
          : [];
    } catch (e) {
      print("Exception - BookingDetailModel.dart - BookingDetail.fromJson():" +
          e.toString());
    }
  }
}
