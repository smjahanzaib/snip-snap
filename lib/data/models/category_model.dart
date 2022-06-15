class CategoryModel {
  CategoryModel({
    this.id,
    this.title,
    this.image,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    final String _image = json['image'] as String ?? '';
    return CategoryModel(
      id: json['id'] as int ?? 0,
      title: json['title'] as String ?? '',
      image: _image.isNotEmpty ? 'assets/images/data/categories/' + _image : '',
    );
  }

  final int id;
  final String title;
  final String image;
}
