import 'package:SnipSnap/data/models/business_hours_model.dart';
import 'package:SnipSnap/data/models/image_model.dart';
import 'package:SnipSnap/data/models/photo_model.dart';
import 'package:SnipSnap/data/models/review_model.dart';
import 'package:SnipSnap/data/models/service_group_model.dart';
import 'package:SnipSnap/data/models/staff_model.dart';
import 'package:SnipSnap/utils/geo.dart';

enum LocationGenderSpecification { men, women, unisex }

class LocationModel {
  LocationModel(
    this.id,
    this.name,
    this.rate,
    this.ratings,
    this.address,
    this.city,
    this.phone,
    this.email,
    this.website,
    this.description,
    this.mainPhoto,
    this.genders,
    this.businessHours,
    this.coordinates,
    this.nearbyLocations,
    this.reviews,
    this.photos,
    this.serviceGroups,
    this.staff,
    this.cancelationPolicy,
  );

  factory LocationModel.fromJson(Map<String, dynamic> json) {
    final String _mainPhoto = json['main_photo'] as String ?? '';
    final List<dynamic> _businessHours =
        json['business_hours'] as List<dynamic> ?? <dynamic>[];

    final List<dynamic> _coordinateValues =
        json['coordinates'] as List<dynamic> ?? <dynamic>[];
    final List<double> _geoPoints =
        _coordinateValues.map<double>((dynamic val) => val as double).toList();

    final List<dynamic> _nearbyLocations =
        json['nearby_locations'] as List<dynamic> ?? <dynamic>[];
    final List<dynamic> _reviews =
        json['reviews'] as List<dynamic> ?? <dynamic>[];

    final List<dynamic> _photos =
        json['photos'] as List<dynamic> ?? <dynamic>[];

    final List<dynamic> _services =
        json['services'] as List<dynamic> ?? <dynamic>[];
    final List<dynamic> _staff = json['staff'] as List<dynamic> ?? <dynamic>[];

    return LocationModel(
      json['id'] as int ?? 0,
      json['name'] as String ?? '',
      json['rate'] as double ?? 0.0,
      json['ratings'] as int ?? 0,
      json['address'] as String ?? '',
      json['city'] as String ?? '',
      json['phone'] as String ?? '',
      json['email'] as String ?? '',
      json['website'] as String ?? '',
      json['description'] as String ?? '',
      _mainPhoto.isNotEmpty ? 'assets/images/data/locations/' + _mainPhoto : '',
      json['gender_specific'] as String ?? 'unisex',
      _businessHours
          .map<BusinessHoursModel>((dynamic json) =>
              BusinessHoursModel.fromJson(json as Map<String, dynamic>))
          .toList(),
      _geoPoints.isNotEmpty
          ? GeoPoint(
              latitude: _geoPoints[0] ?? 0.0, longitude: _geoPoints[1] ?? 0.0)
          : GeoPoint(latitude: 0, longitude: 0),
      _nearbyLocations
          .map<LocationModel>((dynamic json) =>
              LocationModel.fromJson(json as Map<String, dynamic>))
          .toList(),
      _reviews
          .map<ReviewModel>((dynamic json) =>
              ReviewModel.fromJson(json as Map<String, dynamic>))
          .toList(),
      _photos
          .map<PhotoModel>((dynamic json) =>
              PhotoModel.fromJson(json as Map<String, dynamic>))
          .toList(),
      _services
          .map<ServiceGroupModel>((dynamic json) =>
              ServiceGroupModel.fromJson(json as Map<String, dynamic>))
          .toList(),
      _staff
          .map<StaffModel>((dynamic json) =>
              StaffModel.fromJson(json as Map<String, dynamic>))
          .toList(),
      json['cancelation_policy'] as String ?? '',
    );
  }

  BusinessHoursModel getBusinessHoursFor({int weekday = 1}) {
    return businessHours.firstWhere(
        (BusinessHoursModel b) => b.dayOfWeek == weekday,
        orElse: () => null);
  }

  String getPhotoURL({int index, ImageSize forSize}) {
    return (photos == null || !photos.asMap().containsKey(index))
        ? photos[index].getImageURL(forSize)
        : '';
  }

  int get getServiceCount {
    int count = 0;

    for (int i = 0; i < serviceGroups.length; i++) {
      count = count + serviceGroups[i].services.length;
    }

    return count;
  }

  final int id;
  final String name;
  final double rate;
  final int ratings;
  final String address;
  final String city;
  final String phone;
  final String email;
  final String website;
  final String description;
  final String mainPhoto;
  final String genders;
  final List<BusinessHoursModel> businessHours;
  final GeoPoint coordinates;
  final List<LocationModel> nearbyLocations;
  final List<ReviewModel> reviews;
  final List<PhotoModel> photos;
  final List<ServiceGroupModel> serviceGroups;
  final List<StaffModel> staff;
  final String cancelationPolicy;
}
