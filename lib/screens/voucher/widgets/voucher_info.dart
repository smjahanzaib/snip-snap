import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:SnipSnap/configs/constants.dart';
import 'package:SnipSnap/configs/routes.dart';
import 'package:SnipSnap/data/models/voucher_model.dart';
import 'package:SnipSnap/generated/l10n.dart';
import 'package:SnipSnap/utils/datetime.dart';
import 'package:SnipSnap/utils/text_style.dart';
import 'package:SnipSnap/widgets/card_divider.dart';
import 'package:SnipSnap/widgets/shimmer_box.dart';
import 'package:SnipSnap/widgets/strut_text.dart';
import 'package:shimmer/shimmer.dart';

class VoucherInfo extends StatelessWidget {
  const VoucherInfo({
    Key key,
    this.voucher,
  }) : super(key: key);

  final VoucherModel voucher;

  @override
  Widget build(BuildContext context) {
    if (voucher == null) {
      return Column(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.symmetric(
                vertical: kPaddingS, horizontal: kPaddingM),
            color: kPrimaryColor.withAlpha(32), // Theme.of(context).cardColor,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const CardDivider(
                  lineColor: kWhite,
                  height: 3,
                  dashWidth: 6,
                ),
                Shimmer.fromColors(
                  baseColor: Theme.of(context).hoverColor,
                  highlightColor: Theme.of(context).dividerColor,
                  enabled: true,
                  child: Container(
                    width: 128,
                    height: 128,
                    margin: const EdgeInsets.only(top: kPaddingM),
                    decoration: const BoxDecoration(
                      color: kWhite,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: kPaddingM),
                  child: ShimmerBox(width: 200, height: 32),
                ),
                const Padding(
                  padding: EdgeInsets.only(
                      top: kPaddingS, left: kPaddingM, right: kPaddingM),
                  child: ShimmerBox(width: 80, height: 48),
                ),
                const Padding(
                    padding: EdgeInsets.only(
                        left: kPaddingM, right: kPaddingM, bottom: kPaddingM)),
                const CardDivider(
                  lineColor: kWhite,
                  height: 3,
                  dashWidth: 6,
                ),
                const Padding(
                    padding: EdgeInsets.only(
                        top: kPaddingM,
                        bottom: kPaddingS,
                        left: kPaddingM,
                        right: kPaddingM)),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: kPaddingM),
                  child: ShimmerBox(width: 200, height: 32),
                ),
                const Padding(
                  padding: EdgeInsets.all(kPaddingM),
                  child: ShimmerBox(width: 240, height: 240),
                ),
                const CardDivider(
                  lineColor: kWhite,
                  height: 3,
                  dashWidth: 6,
                ),
              ],
            ),
          ),
        ],
      );
    }

    String _date;
    Color _dateColor;

    switch (voucher.status) {
      case VoucherStatus.active:
        _date = L10n.of(context)
            .vouchersDueDateActive(voucher.dueDateTime.toLocalDateString)
            .toUpperCase();
        break;
      case VoucherStatus.redeemed:
        _date = L10n.of(context)
            .vouchersDueDateRedeemed(
                voucher.redemptionDateTime.toLocalDateString)
            .toUpperCase();
        _dateColor = Colors.green[700];
        break;
      case VoucherStatus.expired:
        _date = L10n.of(context)
            .vouchersDueDateExpired(voucher.dueDateTime.toLocalDateString)
            .toUpperCase();
        _dateColor = Colors.red;
        break;
      default:
        _date = '';
        break;
    }

    return Column(
      children: <Widget>[
        Container(
          margin: const EdgeInsets.symmetric(
              vertical: kPaddingS, horizontal: kPaddingM),
          color: kPrimaryColor, // Theme.of(context).cardColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              CardDivider(
                lineColor: Theme.of(context).scaffoldBackgroundColor,
                height: 3,
                dashWidth: 6,
              ),
              InkWell(
                onTap: () => Navigator.pushNamed(context, Routes.location,
                    arguments: voucher.location.id),
                child: Container(
                  width: 128,
                  height: 128,
                  margin: const EdgeInsets.only(top: kPaddingM),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage(voucher.location.mainPhoto),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: kPaddingM),
                child: StrutText(
                  voucher.location.name,
                  style: Theme.of(context).textTheme.headline5.w800.white,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: kPaddingS, left: kPaddingM, right: kPaddingM),
                child: StrutText(
                  L10n.of(context)
                      .commonCurrencyFormat(voucher.amount.toString()),
                  style: Theme.of(context).textTheme.headline3.w600.white,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: kPaddingM, right: kPaddingM, bottom: kPaddingM),
                child: StrutText(
                  L10n.of(context).vouchersLabelOff.toUpperCase(),
                  style: Theme.of(context).textTheme.caption.w600.white,
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: kPaddingS,
                    bottom: kPaddingM,
                    left: kPaddingM,
                    right: kPaddingM),
                child: StrutText(
                  voucher.service,
                  style: Theme.of(context).textTheme.bodyText2.white,
                ),
              ),
              CardDivider(
                lineColor: Theme.of(context).scaffoldBackgroundColor,
                height: 3,
                dashWidth: 6,
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: kPaddingM,
                    bottom: kPaddingS,
                    left: kPaddingM,
                    right: kPaddingM),
                child: StrutText(
                  L10n.of(context).voucherLabelCouponCode.toUpperCase(),
                  style: Theme.of(context).textTheme.caption.white,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: kPaddingM),
                child: StrutText(
                  voucher.code,
                  style: Theme.of(context).textTheme.headline4.white.bold,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(kPaddingM),
                child: QrImage(
                  foregroundColor: kWhite,
                  data: voucher.code,
                  version: QrVersions.auto,
                  size: 240,
                ),
              ),
              CardDivider(
                lineColor: Theme.of(context).scaffoldBackgroundColor,
                height: 3,
                dashWidth: 6,
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
              left: kPaddingM, right: kPaddingM, bottom: kPaddingM),
          child: StrutText(
            _date,
            style:
                Theme.of(context).textTheme.caption.copyWith(color: _dateColor),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
              top: kPaddingM,
              bottom: kPaddingS,
              left: kPaddingM,
              right: kPaddingM),
          child: StrutText(
            L10n.of(context).voucherLabelSpecialTerms.toUpperCase(),
            style: Theme.of(context).textTheme.caption.bold,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
              bottom: kPaddingL, left: kPaddingM, right: kPaddingM),
          child: StrutText(
            voucher.specialTerms.isNotEmpty ? voucher.specialTerms : '- - -',
            style: Theme.of(context).textTheme.caption,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
