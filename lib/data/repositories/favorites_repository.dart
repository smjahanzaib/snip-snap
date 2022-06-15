import 'package:SnipSnap/data/data_provider.dart';
import 'package:SnipSnap/data/models/data_response_model.dart';
import 'package:SnipSnap/data/models/location_model.dart';

class FavoritesRepository {
  const FavoritesRepository({
    this.dataProvider = const DataProvider(),
  });

  final DataProvider dataProvider;

  Future<List<LocationModel>> getFavorites() async {
    final DataResponseModel rawData = await dataProvider.get('favorites');

    final List<dynamic> _favorites =
        rawData.data['favorites'] as List<dynamic> ?? <dynamic>[];

    return _favorites
        .map<LocationModel>((dynamic json) =>
            LocationModel.fromJson(json as Map<String, dynamic>))
        .toList();
  }
}
