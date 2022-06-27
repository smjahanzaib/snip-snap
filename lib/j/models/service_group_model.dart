import 'package:SnipSnap/data/models/service_model.dart';

class ServiceGroupModel {
  ServiceGroupModel(
    this.name,
    this.description,
    this.services,
  );

  factory ServiceGroupModel.fromJson(Map<String, dynamic> json) {
    final List<dynamic> _services =
        json['services'] as List<dynamic> ?? <dynamic>[];

    return ServiceGroupModel(
      json['name'] as String ?? '',
      json['description'] as String ?? '',
      _services
          .map<ServiceModel>((dynamic json) =>
              ServiceModel.fromJson(json as Map<String, dynamic>))
          .toList(),
    );
  }

  final String name;
  final String description;
  final List<ServiceModel> services;
}
