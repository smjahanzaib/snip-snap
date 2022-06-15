part of 'loyalty_bloc.dart';

abstract class LoyaltyEvent {
  @override
  String toString() => '$runtimeType';
}

class VoucherRequestedLoyaltyEvent extends LoyaltyEvent {
  VoucherRequestedLoyaltyEvent(this.voucherId);

  final int voucherId;
}

class VouchersRequestedLoyaltyEvent extends LoyaltyEvent {}
