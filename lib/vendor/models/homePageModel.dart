import 'package:SnipSnap/screens/AddBeautyExpert/Model/chartDataModel.dart';

class HomePage {
  int vendor_id;
  int allOrders;
  int pendingOrders;
  int completedOrders;
  ChartData day1Details;
  ChartData day2Details;
  ChartData day3Details;
  ChartData day4Details;

  ChartData day5Details;
  ChartData day6Details;
  ChartData day7Details;
  int unread_notification_count;
  int read_notification_count;
  double completedGloals;

  HomePage();
  Map<String, dynamic> toJson() => {
        'vendor_id': vendor_id != null ? vendor_id : null,
      };

  HomePage.fromJson(Map<String, dynamic> json) {
    try {
      vendor_id = int.parse((json['vendor_id'] ?? 0).toString());
      allOrders = int.parse((json['all_orders_count'] ?? 0).toString());
      pendingOrders = int.parse((json['pending_orders'] ?? 0).toString());
      completedOrders =
          int.parse((json['complted_order_count'] ?? 0).toString());
      day1Details = (json['day1_details'] != null)
          ? ChartData.fromJson(json['day1_details'] as Map<String, dynamic>)
          : null;
      day2Details = (json['day2_details'] != null)
          ? ChartData.fromJson(json['day2_details'] as Map<String, dynamic>)
          : null;
      day3Details = (json['day3_details'] != null)
          ? ChartData.fromJson(json['day3_details'] as Map<String, dynamic>)
          : null;
      day4Details = (json['day4_details'] != null)
          ? ChartData.fromJson(json['day4_details'] as Map<String, dynamic>)
          : null;
      day5Details = (json['day5_details'] != null)
          ? ChartData.fromJson(json['day5_details'] as Map<String, dynamic>)
          : null;
      day6Details = (json['day6_details'] != null)
          ? ChartData.fromJson(json['day6_details'] as Map<String, dynamic>)
          : null;
      day7Details = (json['day7_details'] != null)
          ? ChartData.fromJson(json['day7_details'] as Map<String, dynamic>)
          : null;
      unread_notification_count =
          int.parse((json['unread_notification_count'] ?? 0).toString());
      read_notification_count =
          int.parse((json['read_notification_count'] ?? 0).toString());
      completedGloals =
          allOrders != 0 ? (completedOrders * 100) / allOrders : 0;
    } catch (e) {
      print("Exception - HomePageModel.dart - HomePageModel.fromJson():" +
          e.toString());
    }
  }
}
