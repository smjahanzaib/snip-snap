import 'package:flutter/material.dart';

/// A class to hold geopoint data structure.
class GeoPoint {
  /// Default constructor: needs [latitude] and [longitude]
  GeoPoint({
    @required this.latitude,
    @required this.longitude,
  })  : assert(latitude != null),
        assert(longitude != null);

  /// A latitude coordinate.
  final double latitude;

  /// A longitude coordinate.
  final double longitude;

  @override
  String toString() => 'GeoPoint<lat: $latitude, long: $longitude>';

  List<double> toJson() => <double>[latitude, longitude];
}

/// Defines the boundingbox based on its SW and NE corners.
class GeoBoundingBox {
  GeoBoundingBox({this.swCorner, this.neCorner});

  final GeoPoint swCorner;
  final GeoPoint neCorner;

  @override
  String toString() => 'GeoBoundingBox<sw: $swCorner, ne: $neCorner>';
}
