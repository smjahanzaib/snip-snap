class Notifications {
  int not_id;
  String not_title;
  String not_message;

  int vendor_id;

  int read_by_vendor;
  String image;
  Notifications();
  Map<String, dynamic> toJson() => {
        'vendor_id': vendor_id != null ? vendor_id : null,
        'not_title': not_title != null ? not_title : null,
        'not_message': not_message != null ? not_message : null,
      };

  Notifications.fromJson(Map<String, dynamic> json) {
    try {
      vendor_id = int.parse((json['vendor_id'] ?? 0).toString());
      not_title = (json['not_title'] ?? '').toString();
      not_message = (json['not_message'] ?? '').toString();
      read_by_vendor = int.parse((json['read_by_vendor'] ?? 0).toString());
      image = (json['image'] ?? '').toString();
    } catch (e) {
      print("Exception - notificationModel.dart - Notifications.fromJson():" +
          e.toString());
    }
  }
}
