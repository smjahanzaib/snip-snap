import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:SnipSnap/blocs/loyalty/loyalty_bloc.dart';
import 'package:SnipSnap/configs/constants.dart';
import 'package:SnipSnap/data/models/voucher_model.dart';
import 'package:SnipSnap/generated/l10n.dart';
import 'package:SnipSnap/screens/vouchers/widgets/vouchers_list_item.dart';
import 'package:SnipSnap/widgets/jumbotron.dart';
import 'package:SnipSnap/widgets/loading_overlay.dart';
import 'package:SnipSnap/widgets/ribbon.dart';

class VouchersScreen extends StatefulWidget {
  const VouchersScreen({Key key}) : super(key: key);

  @override
  _VouchersScreenState createState() => _VouchersScreenState();
}

class _VouchersScreenState extends State<VouchersScreen>
    with SingleTickerProviderStateMixin {
  final RefreshController _controller =
      RefreshController(initialRefresh: false);
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  bool _isLoading = false;

  TabController _tabController;

  List<VoucherModel> _vouchers;

  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: 3, vsync: this);

    _refreshList();
  }

  @override
  Widget build(BuildContext context) {
    return LoadingOverlay(
      isLoading: _isLoading,
      child: Scaffold(
        key: scaffoldKey,
        appBar: AppBar(
          centerTitle: true,
          title: Text(L10n.of(context).vouchersTitle),
          bottom: TabBar(
            controller: _tabController,
            indicatorColor: kWhite,
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorWeight: 4,
            tabs: <Tab>[
              Tab(text: L10n.of(context).vouchersTabActive),
              Tab(text: L10n.of(context).vouchersTabRedeemed),
              Tab(text: L10n.of(context).vouchersTabExpired),
            ],
          ),
          bottomOpacity: 1,
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.info_outline),
              tooltip: L10n.of(context).commonTooltipInfo,
              onPressed: () {
                scaffoldKey.currentState.showSnackBar(
                  SnackBar(
                    content: Text(L10n.of(context).vouchersInfo),
                    duration:
                        const Duration(milliseconds: kSnackBarDurationLong),
                  ),
                );
              },
            ),
            IconButton(
              icon: const Icon(Icons.refresh),
              tooltip: L10n.of(context).commonTooltipRefresh,
              onPressed: _refreshList,
            ),
          ],
        ),
        body: BlocBuilder<LoyaltyBloc, LoyaltyState>(
          builder: (BuildContext context, LoyaltyState state) {
            return BlocListener<LoyaltyBloc, LoyaltyState>(
              listener: (BuildContext context, LoyaltyState state) {
                if (state is LoadVouchersSuccessLoyaltyState) {
                  _controller.refreshCompleted();
                  _vouchers = state.vouchers;

                  setState(() => _isLoading = false);
                }
              },
              child: TabBarView(
                children: <Widget>[
                  _buildVouchersList(VoucherStatus.active),
                  _buildVouchersList(VoucherStatus.redeemed),
                  _buildVouchersList(VoucherStatus.expired),
                ],
                controller: _tabController,
              ),
            );
          },
        ),
      ),
    );
  }

  Future<void> _refreshList() async {
    setState(() => _isLoading = true);

    BlocProvider.of<LoyaltyBloc>(context).add(VouchersRequestedLoyaltyEvent());
  }

  Widget _buildVouchersList(VoucherStatus status) {
    if (_vouchers == null) {
      return Container();
    }

    final List<VoucherModel> _filteredVouchers = _vouchers
        .where((VoucherModel voucher) => voucher.status == status)
        .toList();
    if (_filteredVouchers.isNotEmpty) {
      return ListView.builder(
        padding: const EdgeInsets.only(top: kPaddingS, bottom: kPaddingS),
        itemCount: _filteredVouchers.length,
        itemBuilder: (BuildContext context, int index) {
          final VoucherModel voucher = _filteredVouchers[index];
          if (voucher.status == VoucherStatus.redeemed) {
            return Stack(
              alignment: AlignmentDirectional.topEnd,
              children: <Widget>[
                VouchersListItem(voucher: voucher),
                Ribbon(),
              ],
            );
          }
          return VouchersListItem(voucher: voucher);
        },
      );
    }

    String _note;

    switch (status) {
      case VoucherStatus.active:
        _note = L10n.of(context).vouchersHeroNoteActive;
        break;
      case VoucherStatus.redeemed:
        _note = L10n.of(context).vouchersHeroNoteRedeemed;
        break;
      case VoucherStatus.expired:
        _note = L10n.of(context).vouchersHeroNoteExpired;
        break;
      default:
        _note = '';
    }

    return Jumbotron(
      title: _note,
      icon: Icons.info,
    );
  }
}
