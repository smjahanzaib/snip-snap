class Gallery {
  int vendor_id;
  int id;
  String image;

  Gallery();
  Map<String, dynamic> toJson() => {
        'vendor_id': vendor_id != null ? vendor_id : null,
        'image': image != null ? image : null,
        'id': id != null ? id : null
      };

  Gallery.fromJson(Map<String, dynamic> json) {
    try {
      vendor_id = int.parse((json['vendor_id'] ?? 0).toString());
      image = (json['image'] ?? '').toString();
      id = int.parse((json['id'] ?? 0).toString());
    } catch (e) {
      print(
          "Exception - galleryModel.dart - Gallery.fromJson():" + e.toString());
    }
  }
}
