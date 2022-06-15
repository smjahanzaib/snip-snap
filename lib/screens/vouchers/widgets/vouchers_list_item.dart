import 'package:flutter/material.dart';
import 'package:SnipSnap/configs/constants.dart';
import 'package:SnipSnap/configs/routes.dart';
import 'package:SnipSnap/data/models/voucher_model.dart';
import 'package:SnipSnap/generated/l10n.dart';
import 'package:SnipSnap/utils/datetime.dart';
import 'package:SnipSnap/utils/text_style.dart';
import 'package:SnipSnap/widgets/card_divider.dart';
import 'package:SnipSnap/widgets/strut_text.dart';
import 'package:sprintf/sprintf.dart';

class VouchersListItem extends StatefulWidget {
  const VouchersListItem({
    Key key,
    this.voucher,
  }) : super(key: key);

  @override
  _VouchersListItemState createState() => _VouchersListItemState();

  final VoucherModel voucher;
}

class _VouchersListItemState extends State<VouchersListItem> {
  @override
  Widget build(BuildContext context) {
    String _date;
    Color _dateColor;

    switch (widget.voucher.status) {
      case VoucherStatus.active:
        _date = L10n.of(context)
            .vouchersDueDateActive(widget.voucher.dueDateTime.toLocalDateString)
            .toUpperCase();
        break;
      case VoucherStatus.redeemed:
        _date = L10n.of(context)
            .vouchersDueDateRedeemed(
                widget.voucher.redemptionDateTime.toLocalDateString)
            .toUpperCase();
        _dateColor = Colors.green[700];
        break;
      case VoucherStatus.expired:
        _date = L10n.of(context)
            .vouchersDueDateExpired(
                widget.voucher.dueDateTime.toLocalDateString)
            .toUpperCase();
        _dateColor = Colors.red;
        break;
      default:
        _date = '';
        break;
    }

    return InkWell(
      onTap: () => Navigator.pushNamed(context, Routes.voucher,
          arguments: widget.voucher.id),
      child: Card(
        elevation: 1,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(kBoxDecorationRadius),
          side: BorderSide(
            color: widget.voucher.status == VoucherStatus.redeemed
                ? Colors.lightGreen
                : Theme.of(context).cardColor,
            width: 2.0,
          ),
        ),
        margin: const EdgeInsets.symmetric(
            vertical: kPaddingS, horizontal: kPaddingM),
        child: Container(
          padding: const EdgeInsets.all(kPaddingM),
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius:
                const BorderRadius.all(Radius.circular(kBoxDecorationRadius)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    width: 64,
                    height: 64,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(kBoxDecorationRadius),
                      image: DecorationImage(
                        image: AssetImage(widget.voucher.location.mainPhoto),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding:
                          const EdgeInsetsDirectional.only(start: kPaddingS),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          StrutText(
                            widget.voucher.location.name,
                            maxLines: 1,
                            style: Theme.of(context).textTheme.headline6.w600,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const Padding(
                              padding: EdgeInsets.only(top: kPaddingS / 2)),
                          StrutText(
                            sprintf('%s, %s', <String>[
                              widget.voucher.location.address,
                              widget.voucher.location.city
                            ]),
                            maxLines: 2,
                            style: Theme.of(context).textTheme.bodyText2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const Padding(padding: EdgeInsets.only(top: kPaddingM)),
              StrutText(
                widget.voucher.service,
                maxLines: 2,
                style: Theme.of(context).textTheme.subtitle1,
              ),
              const Padding(padding: EdgeInsets.only(top: kPaddingM)),
              const CardDivider(),
              const Padding(padding: EdgeInsets.only(top: kPaddingM)),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  StrutText(
                    L10n.of(context)
                        .commonCurrencyFormat(widget.voucher.amount.toString()),
                    maxLines: 1,
                    style: Theme.of(context).textTheme.headline4.bold.copyWith(
                        color: Theme.of(context).textTheme.bodyText1.color),
                  ),
                  const Padding(
                      padding: EdgeInsetsDirectional.only(start: kPaddingS)),
                  StrutText(
                    L10n.of(context).vouchersLabelOff,
                    style: Theme.of(context).textTheme.caption.w600,
                  ),
                ],
              ),
              const Padding(padding: EdgeInsets.only(top: kPaddingS)),
              StrutText(
                _date,
                style: _dateColor != null
                    ? Theme.of(context)
                        .textTheme
                        .caption
                        .copyWith(color: _dateColor)
                    : Theme.of(context).textTheme.caption,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
