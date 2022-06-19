import 'dart:convert';

import 'package:SnipSnap/data/data_provider.dart';
import 'package:SnipSnap/data/models/category_model.dart';
import 'package:SnipSnap/data/models/city_model.dart';
import 'package:SnipSnap/data/models/data_response_model.dart';
import 'package:SnipSnap/data/models/location_model.dart';
import 'package:SnipSnap/data/models/search_history_model.dart';
import 'package:http/http.dart' as http;

class LocationRepository {
  const LocationRepository({
    this.dataProvider = const DataProvider(),
  });
//
//
 final baseUrl = "http://192.168.3.101:9000/api/v1";
  final DataProvider dataProvider;

  Future<List<CategoryModel>> getCategories() async {
    var callApi = await http.get(baseUrl + '/category');
    var data = jsonDecode(callApi.body);
    data = data['data'];
    final List<dynamic> _categories =
        data as List<dynamic> ?? <dynamic>[];

    return _categories
        .map<CategoryModel>((dynamic json) =>
            CategoryModel.fromJson(json as Map<String, dynamic>))
        .toList();
  }

  Future<List<LocationModel>> getRecentlyViewed() async {
    var callApi = await http.get(baseUrl + '/recently_viewed');
    var data = jsonDecode(callApi.body);
    data = data['data'];

    final List<dynamic> _locations =
        data as List<dynamic> ?? <dynamic>[];

    return _locations
        .map<LocationModel>((dynamic json) =>
            LocationModel.fromJson(json as Map<String, dynamic>))
        .toList();
  }

  Future<List<LocationModel>> getTopLocations() async {
    var callApi = await http.get(baseUrl + '/top_location');
    var data = jsonDecode(callApi.body);
    data = data['data'];
    print(data);
    final List<dynamic> _locations =
        data as List<dynamic> ?? <dynamic>[];
    _locations.map((e) => e["rate"] = e["rate"].toDouble()).toList();
    return _locations
        .map<LocationModel>((dynamic json) =>
            LocationModel.fromJson(json as Map<String, dynamic>))
        .toList();
  }

  Future<LocationModel> getLocation({int id}) async {
    final DataResponseModel rawData =
        await dataProvider.get('location_' + id.toString());

    return LocationModel.fromJson(rawData.data);
  }

  Future<List<SearchHistoryModel>> getSearchHistory() async {
    final DataResponseModel rawData = await dataProvider.get('search_history');

    final List<dynamic> _history =
        rawData.data['search_queries'] as List<dynamic> ?? <dynamic>[];

    return _history
        .map<SearchHistoryModel>((dynamic json) =>
            SearchHistoryModel.fromJson(json as Map<String, dynamic>))
        .toList();
  }

  Future<List<LocationModel>> search() async {
    final DataResponseModel rawData = await dataProvider.get('search_all');

    final List<dynamic> _locations =
        rawData.data['locations'] as List<dynamic> ?? <dynamic>[];

    return _locations
        .map<LocationModel>((dynamic json) =>
            LocationModel.fromJson(json as Map<String, dynamic>))
        .toList();
  }

  Future<List<LocationModel>> searchCategory({int id}) async {
    final DataResponseModel rawData =
        await dataProvider.get('search_category_' + id.toString());

    final List<dynamic> _locations =
        rawData.data['locations'] as List<dynamic> ?? <dynamic>[];

    return _locations
        .map<LocationModel>((dynamic json) =>
            LocationModel.fromJson(json as Map<String, dynamic>))
        .toList();
  }

  Future<List<CityModel>> searchCities({String q}) async {
    final DataResponseModel rawData = await dataProvider.get('cities');

    final List<dynamic> _cities =
        rawData.data['cities'] as List<dynamic> ?? <dynamic>[];

    List<CityModel> cities = _cities
        .map<CityModel>(
            (dynamic json) => CityModel.fromJson(json as Map<String, dynamic>))
        .toList();

    q = q.toLowerCase();
    cities = cities
        .where((CityModel city) => city.name.toLowerCase().contains(q))
        .toList();

    return cities;
  }
}
