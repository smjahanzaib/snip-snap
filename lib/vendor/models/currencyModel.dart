class Currency {
  int currency_id;
  String currency;
  String currency_sign;

  Currency({this.currency_id, this.currency, this.currency_sign});

  Currency.fromJson(Map<String, dynamic> json) {
    try {
      currency_id = int.parse((json['currency_id'] ?? 0).toString());
      currency = (json['currency'] ?? '').toString();
      currency_sign = (json['currency_sign'] ?? '').toString();
    } catch (e) {
      print('Exception - currencyModel.dart - Currency.fromJson():' +
          e.toString());
    }
  }
}
