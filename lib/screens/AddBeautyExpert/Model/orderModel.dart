class Order {
  int order_id;
  String name;
  String image;
  String total_price;
  String payment_gateway;
  String payment_status;
  Order();

  Map<String, dynamic> toJson() => {
        'order_id': order_id,
        'name': name != null ? name : null,
        'image': image != null ? image : null
      };

  Order.fromJson(Map<String, dynamic> json) {
    try {
      order_id = int.parse((json['order_id'] ?? 0).toString());
      name = (json['name'] ?? '').toString();
      image = (json['image'] ?? '').toString();
      total_price = (json['total_price'] ?? '').toString();
      payment_gateway = (json['payment_gateway'] ?? '').toString();
      payment_status = (json['payment_status'] ?? '').toString();
    } catch (e) {
      print("Exception - OrderModel.dart - Order.fromJson():" + e.toString());
    }
  }
}
