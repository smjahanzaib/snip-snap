class PrivacyAndPolicy {
  int id;
  String privacyAndPolicy;
  PrivacyAndPolicy();
  PrivacyAndPolicy.fromJson(Map<String, dynamic> json) {
    try {
      id = int.parse((json['id'] ?? 0).toString());
      privacyAndPolicy = (json['privacy_policy'] ?? '').toString();
    } catch (e) {
      print(
          "Exception - PrivacyAndPolicyModel.dart - PrivacyAndPolicy.fromJson():" +
              e.toString());
    }
  }
}
