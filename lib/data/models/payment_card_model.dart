enum PaymentCardType {
  otherBrand,
  mastercard,
  visa,
  americanExpress,
  discover,
}

/// Payment card prefix patterns as of March 2019
/// A [List<String>] represents a range.
/// i.e. ['51', '55'] represents the range of cards starting with '51' to those starting with '55'
Map<PaymentCardType, Set<List<String>>> cardNumPatterns = <PaymentCardType, Set<List<String>>>{
  PaymentCardType.visa: <List<String>>{
    <String>['4'],
  },
  PaymentCardType.americanExpress: <List<String>>{
    <String>['34'],
    <String>['37'],
  },
  PaymentCardType.discover: <List<String>>{
    <String>['6011'],
    <String>['644', '649'],
    <String>['65']
  },
  PaymentCardType.mastercard: <List<String>>{
    <String>['51', '55'],
    <String>['2221', '2229'],
    <String>['223', '229'],
    <String>['23', '26'],
    <String>['270', '271'],
    <String>['2720'],
  },
};

class PaymentCardModel {
  PaymentCardModel({
    this.cardNumber = '',
    this.expirationDate = '',
    this.cardHolderName = '',
    this.cvvCode = '',
    this.isCvvFocused = false,
  });

  String cardNumber;
  String expirationDate;
  String cardHolderName;
  String cvvCode;
  bool isCvvFocused;
}
