class User {
  int id;
  String name;
  String image;
  String user_phone;
  User();

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name != null ? name : null,
        'image': image != null ? image : null
      };

  User.fromJson(Map<String, dynamic> json) {
    try {
      id = int.parse((json['id'] ?? 0).toString());
      name = (json['name'] ?? '').toString();
      image = (json['image'] ?? '').toString();
      user_phone = (json['user_phone'] ?? '').toString();
    } catch (e) {
      print("Exception - userModel.dart - User.fromJson():" + e.toString());
    }
  }
}
