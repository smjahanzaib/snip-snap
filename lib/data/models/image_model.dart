enum ImageSize { thumb, view, uknown }

class ImageModel {
  ImageModel(
    this.size,
    this.url,
  );

  factory ImageModel.fromJson(Map<String, dynamic> json) {
    return ImageModel(
      _setSize(json['size'] as String ?? ''),
      json['url'] as String ?? '',
    );
  }

  final ImageSize size;
  final String url;

  static ImageSize _setSize(String type) {
    switch (type) {
      case 'THUMB':
        return ImageSize.thumb;
      case 'VIEW':
        return ImageSize.view;
      default:
        return ImageSize.uknown;
    }
  }

  static String _getSize(ImageSize type) {
    switch (type) {
      case ImageSize.thumb:
        return 'THUMB';
      case ImageSize.view:
        return 'VIEW';
      default:
        return '';
    }
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'size': _getSize(size),
        'url': url,
      };
}
