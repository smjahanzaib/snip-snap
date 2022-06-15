import 'package:SnipSnap/configs/constants.dart';
import 'package:SnipSnap/data/data_provider.dart';
import 'package:SnipSnap/data/models/data_response_model.dart';
import 'package:SnipSnap/data/models/user_model.dart';

class UserRepository {
  const UserRepository({
    this.dataProvider = const DataProvider(),
  });

  final DataProvider dataProvider;

  Future<DataResponseModel> login({String email, String password}) async {
    if (email != kDemoEmail || password != kDemoPassword) {
      return await dataProvider.get('profile_error');
    }
    return await dataProvider.get('profile');
  }

  Future<UserModel> getProfile() async {
    final DataResponseModel _data = await dataProvider.get('profile');

    return UserModel.fromJson(_data.data);
  }
}
