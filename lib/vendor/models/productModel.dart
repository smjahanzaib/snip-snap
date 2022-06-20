class Product {
  int id;
  int vendor_id;
  String product_name;
  String product_image;
  String price;
  String quantity;
  String description;
  Product();
  Map<String, dynamic> toJson() => {
        'id': id != null ? id : null,
        'vendor_id': vendor_id != null ? vendor_id : null,
        'product_name': product_name != null ? product_name : null,
        'product_image': product_image != null ? product_image : null,
        'price': price != null ? price : null,
        'quantity': quantity != null ? quantity : null,
        'description': description != null ? description : null,
      };
  Product.fromJson(Map<String, dynamic> json) {
    try {
      id = int.parse((json['id'] ?? 0).toString());
      vendor_id = int.parse((json['vendor_id'] ?? 0).toString());
      product_name = (json['product_name'] ?? '').toString();
      product_image = (json['product_image'] ?? '').toString();
      price = (json['price'] ?? '').toString();
      quantity = (json['quantity'] ?? '').toString();
      description = (json['description'] ?? '').toString();
    } catch (e) {
      print(
          "Exception - productModel.dart - Product.fromJson():" + e.toString());
    }
  }
}
