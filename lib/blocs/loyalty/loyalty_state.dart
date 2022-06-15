part of 'loyalty_bloc.dart';

abstract class LoyaltyState {
  @override
  String toString() => '$runtimeType';
}

class InitialLoyaltyState extends LoyaltyState {}

class LoadVoucherInProgressLoyaltyState extends LoyaltyState {}

class LoadVouchersInProgressLoyaltyState extends LoyaltyState {}

class LoadVoucherSuccessLoyaltyState extends LoyaltyState {
  LoadVoucherSuccessLoyaltyState(this.voucher);

  final VoucherModel voucher;
}

class LoadVouchersSuccessLoyaltyState extends LoyaltyState {
  LoadVouchersSuccessLoyaltyState(this.vouchers);

  final List<VoucherModel> vouchers;
}
