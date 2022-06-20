class BookingDetailItem {
  int vendor_id;
  String service_name;
  String varient;
  String price;

  BookingDetailItem();
  Map<String, dynamic> toJson() => {
        'vendor_id': vendor_id != null ? vendor_id : null,
        'service_name': service_name != null ? service_name : null,
        'varient': varient != null ? varient : null,
        'price': price != null ? price : null
      };

  BookingDetailItem.fromJson(Map<String, dynamic> json) {
    try {
      vendor_id = int.parse((json['vendor_id'] ?? '').toString());
      service_name = (json['service_name'] ?? '').toString();
      varient = (json['varient'] ?? '').toString();
      price = (json['price'] ?? '').toString();
    } catch (e) {
      print(
          "Exception - BookingDetailItemModel.dart - BookingDetailItem.fromJson():" +
              e.toString());
    }
  }
}
