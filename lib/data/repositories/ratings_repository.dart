import 'package:SnipSnap/data/data_provider.dart';
import 'package:SnipSnap/data/models/data_response_model.dart';
import 'package:SnipSnap/data/models/review_model.dart';

class RatingsRepository {
  const RatingsRepository({
    this.dataProvider = const DataProvider(),
  });

  final DataProvider dataProvider;

  Future<List<ReviewModel>> getRatings() async {
    final DataResponseModel rawData = await dataProvider.get('ratings');

    final List<dynamic> _ratings =
        rawData.data['ratings'] as List<dynamic> ?? <dynamic>[];

    return _ratings
        .map<ReviewModel>((dynamic json) =>
            ReviewModel.fromJson(json as Map<String, dynamic>))
        .toList();
  }
}
