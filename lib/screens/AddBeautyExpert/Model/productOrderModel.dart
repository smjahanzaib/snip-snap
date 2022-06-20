import 'package:SnipSnap/screens/AddBeautyExpert/Model/orderModel.dart';
import 'package:SnipSnap/screens/AddBeautyExpert/Model/userModel.dart';


class ProductOrder {
  int vendor_id;
  int store_order_id;
  String productName;
  String quantity;
  int productId;
  String order_cart_id;
  int qty;
  String price;
  String total_price;
  String service_date;
  String service_time;
  String order_date;
  String product_image;
  int status;
  String description;
  String statustext;
  String productImage;

  User user;
  Order order;

  ProductOrder();
  Map<String, dynamic> toJson() => {
        'vendor_id': vendor_id != null ? vendor_id : null,
        'service_date': service_date != null ? service_date : null,
        'service_time': service_time != null ? service_time : null,
      };

  ProductOrder.fromJson(Map<String, dynamic> json) {
    try {
      vendor_id = int.parse((json['vendor_id'] ?? 0).toString());
      store_order_id = int.parse((json['store_order_id'] ?? 0).toString());
      service_date = (json['service_date'] ?? '').toString();
      statustext = (json['statustext'] ?? '').toString();
      user = (json['user'] != null)
          ? User.fromJson(json['user'] as Map<String, dynamic>)
          : null;
      order = (json['order'] != null)
          ? Order.fromJson(json['order'] as Map<String, dynamic>)
          : null;
      total_price = (json['total_price'] ?? '').toString();
      service_time = (json['service_time'] ?? '').toString();
      productName = (json['product_name'] ?? '').toString();
      quantity = (json['quantity'] ?? '').toString();
      productId = int.parse((json['productId'] ?? '').toString());
      qty = int.parse((json['qty'] ?? 0).toString());
      price = (json['price'] ?? '').toString();
      total_price = (json['total_price'] ?? '').toString();
      order_date = (json['order_date'] ?? '').toString();
      product_image = (json['product_image'] ?? '').toString();
      description = (json['description'] ?? '').toString();
      order_cart_id = (json['order_cart_id'] ?? '').toString();
      productImage = (json['product_image'] ?? '').toString();
    } catch (e) {
      print("Exception - productOrderModel.dart - ProductOrder.fromJson():" +
          e.toString());
    }
  }
}
