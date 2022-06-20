import 'package:SnipSnap/vendor/models/businessLayer/baseRoute.dart';
import 'package:SnipSnap/vendor/screens/couponListScreen.dart';
import 'package:flutter/material.dart';
import 'package:SnipSnap/generated/l10n.dart';

class SaveCouponDialog extends BaseRoute {
  SaveCouponDialog({a, o}) : super(a: a, o: o, r: 'SaveCouponDialog');
  @override
  _SaveCouponDialogState createState() => new _SaveCouponDialogState();
}

class _SaveCouponDialogState extends BaseRouteState {
  bool isloading = true;

  _SaveCouponDialogState() : super();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: EdgeInsets.only(left: 0, right: 0),
      content: Padding(
        padding: const EdgeInsets.only(top: 70),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircleAvatar(
              radius: 28,
              child: Icon(
                Icons.check,
                size: 40,
                color: Colors.white,
              ),
              backgroundColor: Theme.of(context).primaryColor,
            ),
            Padding(
              padding: EdgeInsets.only(top: 15),
              child: Container(
                width: MediaQuery.of(context).size.width / 2,
                child: Column(
                  children: [
                    Text(
                      L10n.of(context).txt_successfully_add_your_new_coupon,
                      style: Theme.of(context).primaryTextTheme.headline6,
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 70),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            Theme.of(context).primaryColor),
                        padding: MaterialStateProperty.all(
                            EdgeInsets.only(top: 15, bottom: 15))),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => CouponListScreen(
                                a: widget.analytics,
                                o: widget.observer,
                                screenId: 1,
                              )));
                    },
                    child: Text(
                      L10n.of(context).lbl_ok,
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }
}
