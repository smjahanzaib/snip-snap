class ServiceVariant {
  int vendor_id;
  String varient;
  int price;
  int time;
  int service_id;
  int varient_id;

  ServiceVariant();
  Map<String, dynamic> toJson() => {
        'vendor_id': vendor_id != null ? vendor_id : null,
        'service_id': service_id != null ? service_id : null,
        'price': price != null ? price : null,
        'varient': varient != null ? varient : null,
        'time': time != null ? time : null,
        'varient_id': varient_id != null ? varient_id : null
      };

  ServiceVariant.fromJson(Map<String, dynamic> json) {
    try {
      vendor_id = int.parse((json['vendor_id'] ?? 0).toString());
      service_id = int.parse((json['service_id'] ?? 0).toString());
      price = int.parse((json['price'] ?? 0).toString());
      varient = (json['varient'] ?? '').toString();
      time = int.parse((json['time'] ?? 0).toString());
      varient_id = int.parse((json['varient_id'] ?? 0).toString());
    } catch (e) {
      print("Exception - serviceVariantModel.dart - serviceModel.fromJson():" +
          e.toString());
    }
  }
}
