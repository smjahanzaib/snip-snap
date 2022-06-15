import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:SnipSnap/data/models/voucher_model.dart';
import 'package:SnipSnap/data/repositories/loyalty_repository.dart';

part 'loyalty_event.dart';
part 'loyalty_state.dart';

class LoyaltyBloc extends Bloc<LoyaltyEvent, LoyaltyState> {
  LoyaltyBloc() : super(InitialLoyaltyState());

  @override
  Stream<LoyaltyState> mapEventToState(LoyaltyEvent event) async* {
    if (event is VoucherRequestedLoyaltyEvent) {
      yield* _mapGetVoucherLoyaltyEventToState(event);
    } else if (event is VouchersRequestedLoyaltyEvent) {
      yield* _mapGetVouchersLoyaltyEventToState(event);
    }
  }

  Stream<LoyaltyState> _mapGetVoucherLoyaltyEventToState(
      VoucherRequestedLoyaltyEvent event) async* {
    yield LoadVoucherInProgressLoyaltyState();

    final VoucherModel voucher =
        await const LoyaltyRepository().getVoucher(event.voucherId);

    yield LoadVoucherSuccessLoyaltyState(voucher);
  }

  Stream<LoyaltyState> _mapGetVouchersLoyaltyEventToState(
      VouchersRequestedLoyaltyEvent event) async* {
    yield LoadVouchersInProgressLoyaltyState();

    final List<VoucherModel> vouchers =
        await const LoyaltyRepository().getVouchers();

    yield LoadVouchersSuccessLoyaltyState(vouchers);
  }
}
