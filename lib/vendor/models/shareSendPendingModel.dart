class ShareSentPending {
  String cart_id;
  int vendor_id;
  String total_price;
  String service_date;
  String mobile;
  String statustext;
  String paymentStatus;

  ShareSentPending();

  ShareSentPending.fromJson(Map<String, dynamic> json) {
    try {
      cart_id = (json['cart_id'] ?? 0).toString();
      vendor_id = int.parse((json['vendor_id'] ?? 0).toString());
      total_price = (json['total_price'] ?? '').toString();
      service_date = (json['service_date'] ?? '').toString();
      mobile = (json['mobile'] ?? '').toString();
      statustext = (json['statustext'] ?? '').toString();
      paymentStatus = (json['payment_status'] ?? '').toString();
    } catch (e) {
      print(
          "Exception - shareSentPendingModel.dart - ShareSentPending.fromJson():" +
              e.toString());
    }
  }
}
