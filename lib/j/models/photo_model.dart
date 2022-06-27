import 'package:SnipSnap/data/models/image_model.dart';

class PhotoModel {
  const PhotoModel(
    this.id,
    this.images,
  );

  factory PhotoModel.fromJson(Map<String, dynamic> json) {
    final List<dynamic> images = json['images'] as List<dynamic> ?? <dynamic>[];

    return PhotoModel(
      json['id'] as int ?? 0,
      images
          .map<ImageModel>((dynamic json) =>
              ImageModel.fromJson(json as Map<String, dynamic>))
          .toList(),
    );
  }

  final int id;
  final List<ImageModel> images;

  String getImageURL(ImageSize forSize) {
    if (images.isEmpty) {
      return '';
    }
    final ImageModel image = images.firstWhere(
        (ImageModel image) => image.size == forSize,
        orElse: () => null);
    return image != null ? image.url : '';
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'images': images.map((ImageModel i) => i.toJson()).toList(),
    };
  }
}
