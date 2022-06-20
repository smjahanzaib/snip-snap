import 'package:SnipSnap/screens/AddBeautyExpert/Model/serviceVariantModel.dart';

class Service {
  int vendor_id;
  String service_name;
  String service_image;
  int service_id;
  String createdAt;
  List<ServiceVariant> varients = [];

  Service();
  Map<String, dynamic> toJson() => {
        'vendor_id': vendor_id != null ? vendor_id : null,
        'service_id': service_id != null ? service_id : null,
        'service_name': service_name != null ? service_name : null,
        'service_image': service_image != null ? service_image : null,
      };

  Service.fromJson(Map<String, dynamic> json) {
    try {
      vendor_id = int.parse((json['vendor_id'] ?? 0).toString());
      service_id = int.parse((json['service_id'] ?? 0).toString());
      service_name = (json['service_name'] ?? '').toString();
      service_image = (json['service_image'] ?? '').toString();
      createdAt = (json['created_at'] ?? '').toString();
      varients = (json['varients'] != null)
          ? List<ServiceVariant>.from((json['varients'].map(
                  (e) => ServiceVariant.fromJson(e as Map<String, dynamic>)))
              as Iterable<dynamic>)
          : [];
    } catch (e) {
      print("Exception - serviceModel.dart - serviceModel.fromJson():" +
          e.toString());
    }
  }
}
