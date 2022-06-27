import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:SnipSnap/utils/geo.dart';

@immutable
class CityModel extends Equatable {
  const CityModel(
    this.id,
    this.name,
    this.state,
    this.coordinates,
  );

  factory CityModel.fromJson(Map<String, dynamic> json) {
    final List<dynamic> coordinateValues =
        json['coordinates'] as List<dynamic> ?? <dynamic>[];
    final List<double> geoPoints =
        coordinateValues.map<double>((dynamic val) => val as double).toList();

    return CityModel(
      json['city_id'] as String ?? '',
      json['city_name'] as String ?? '',
      json['state_name'] as String ?? '',
      geoPoints.isNotEmpty
          ? GeoPoint(
              latitude: geoPoints[0] ?? 0.0, longitude: geoPoints[1] ?? 0.0)
          : GeoPoint(latitude: 0, longitude: 0),
    );
  }

  final String id;
  final String name;
  final String state;
  final GeoPoint coordinates;

  /// The list of properies that will be used to determine whether two
  /// [CityModel]s are equal.
  @override
  List<Object> get props => <Object>[id];
}
