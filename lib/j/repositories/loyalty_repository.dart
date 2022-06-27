import 'package:SnipSnap/data/data_provider.dart';
import 'package:SnipSnap/data/models/data_response_model.dart';
import 'package:SnipSnap/data/models/voucher_model.dart';

class LoyaltyRepository {
  const LoyaltyRepository({
    this.dataProvider = const DataProvider(),
  });

  final DataProvider dataProvider;

  Future<VoucherModel> getVoucher(int voucherId) async {
    final DataResponseModel rawData =
        await dataProvider.get('voucher_' + voucherId.toString());

    return VoucherModel.fromJson(rawData.data);
  }

  Future<List<VoucherModel>> getVouchers() async {
    final DataResponseModel rawData = await dataProvider.get('vouchers');

    final List<dynamic> _vouchers =
        rawData.data['vouchers'] as List<dynamic> ?? <dynamic>[];

    return _vouchers
        .map<VoucherModel>((dynamic json) =>
            VoucherModel.fromJson(json as Map<String, dynamic>))
        .toList();
  }
}
