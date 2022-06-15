import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:SnipSnap/blocs/loyalty/loyalty_bloc.dart';
import 'package:SnipSnap/configs/constants.dart';
import 'package:SnipSnap/data/models/voucher_model.dart';
import 'package:SnipSnap/screens/voucher/widgets/voucher_info.dart';

class VoucherScreen extends StatefulWidget {
  const VoucherScreen({
    Key key,
    this.voucherId,
  }) : super(key: key);

  final int voucherId;

  @override
  _VoucherScreenState createState() => _VoucherScreenState();
}

class _VoucherScreenState extends State<VoucherScreen> {
  VoucherModel _voucher;

  @override
  void initState() {
    super.initState();

    _loadVoucher();
  }

  Future<void> _loadVoucher() async {
    BlocProvider.of<LoyaltyBloc>(context)
        .add(VoucherRequestedLoyaltyEvent(widget.voucherId));
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.miniEndTop,
        floatingActionButton: Container(
          padding:
              const EdgeInsetsDirectional.only(top: kPaddingM, end: kPaddingM),
          child: FloatingActionButton(
            elevation: 3,
            onPressed: () => Navigator.pop(context),
            child: const Icon(
              Icons.close,
              color: kPrimaryColor,
            ),
            backgroundColor: kWhite,
            mini: true,
          ),
        ),
        body: BlocBuilder<LoyaltyBloc, LoyaltyState>(
          builder: (BuildContext context, LoyaltyState state) {
            return BlocListener<LoyaltyBloc, LoyaltyState>(
              listener: (BuildContext context, LoyaltyState state) {
                if (state is LoadVoucherSuccessLoyaltyState) {
                  setState(() => _voucher = state.voucher);
                }
              },
              child: SafeArea(
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[VoucherInfo(voucher: _voucher)],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
