import 'dart:io';

import 'package:SnipSnap/vendor/dialogs/couponDetailDialog.dart';
import 'package:SnipSnap/vendor/models/businessLayer/baseRoute.dart';
import 'package:SnipSnap/vendor/models/businessLayer/global.dart' as global;
import 'package:SnipSnap/vendor/models/couponModel.dart';
import 'package:SnipSnap/vendor/screens/addCouponScreen.dart';
import 'package:SnipSnap/vendor/widgets/bottomNavigationBar.dart';
import 'package:flutter/material.dart';
import 'package:SnipSnap/generated/l10n.dart';
import 'package:shimmer/shimmer.dart';

class CouponListScreen extends BaseRoute {
  final int screenId;
  CouponListScreen({a, o, this.screenId})
      : super(a: a, o: o, r: 'CouponListScreen');
  @override
  _CouponListScreenState createState() =>
      new _CouponListScreenState(screenId: screenId);
}

class _CouponListScreenState extends BaseRouteState {
  GlobalKey<ScaffoldState> _scaffoldKey;
  List<Coupon> _couponList = [];
  bool _isDataLoaded = false;
  int screenId;
  _CouponListScreenState({this.screenId}) : super();

  @override
  Widget build(BuildContext context) {
    return sc(
      WillPopScope(
        onWillPop: () {
          screenId == 1
              ? Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (context) => BottomNavigationWidget(
                            a: widget.analytics,
                            o: widget.observer,
                          )),
                )
              : Navigator.of(context).pop();
          return null;
        },
        child: Scaffold(
          body: Stack(
            children: [
              Container(
                height: 100,
                width: MediaQuery.of(context).size.width,
                child: Stack(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: ColorFiltered(
                        colorFilter: ColorFilter.mode(
                          Theme.of(context).primaryColor,
                          BlendMode.screen,
                        ),
                        child: Image.asset(
                          'assets/banner.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Padding(
                      padding: Platform.isAndroid
                          ? EdgeInsets.only(bottom: 15, left: 10, top: 10)
                          : EdgeInsets.only(bottom: 15, left: 10, top: 20),
                      child: GestureDetector(
                        onTap: () {
                          screenId == 1
                              ? Navigator.of(context).push(
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          BottomNavigationWidget(
                                            a: widget.analytics,
                                            o: widget.observer,
                                          )),
                                )
                              : Navigator.of(context).pop();
                        },
                        child: Row(
                          children: [
                            Icon(
                              Icons.keyboard_arrow_left_outlined,
                              color: Colors.black,
                            ),
                            Text(
                              L10n.of(context).lbl_back,
                              style: TextStyle(
                                  color: Colors.black, fontSize: 17.5),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20)),
                  ),
                  margin: EdgeInsets.only(top: 80),
                  height: MediaQuery.of(context).size.height - 185,
                  width: MediaQuery.of(context).size.width,
                  child: Container(
                    margin: EdgeInsets.only(left: 10, right: 10),
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      children: [
                        Container(
                            margin: EdgeInsets.only(top: 30, bottom: 10),
                            child: Text(
                              L10n.of(context).lbl_coupons,
                              style:
                                  Theme.of(context).primaryTextTheme.headline3,
                            )),
                        _isDataLoaded
                            ? _couponList.length > 0
                                ? Expanded(
                                    child: ListView.builder(
                                        shrinkWrap: true,
                                        itemCount: _couponList.length,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          return GestureDetector(
                                            onTap: () {
                                              _detailDialog(index);
                                            },
                                            child: SizedBox(
                                              height: 80,
                                              child: Card(
                                                  margin: EdgeInsets.only(
                                                      bottom: 8),
                                                  child: Row(
                                                    children: [
                                                      Expanded(
                                                        child: Padding(
                                                          padding: global.isRTL
                                                              ? EdgeInsets.only(
                                                                  top: 10,
                                                                  right: 15)
                                                              : EdgeInsets.only(
                                                                  left: 15.0,
                                                                  top: 10),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .min,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Row(
                                                                children: [
                                                                  _couponList[index]
                                                                              .type ==
                                                                          'percentage'
                                                                      ? Text(
                                                                          '${_couponList[index].amount} % off',
                                                                          style: Theme.of(context)
                                                                              .primaryTextTheme
                                                                              .subtitle2,
                                                                        )
                                                                      : Text(
                                                                          '${global.currency.currency_sign} ${_couponList[index].amount} off',
                                                                          style: Theme.of(context)
                                                                              .primaryTextTheme
                                                                              .subtitle2,
                                                                        )
                                                                ],
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .only(
                                                                        top: 2),
                                                                child: Text(
                                                                  '${_couponList[index].coupon_name}',
                                                                  style: Theme.of(
                                                                          context)
                                                                      .primaryTextTheme
                                                                      .subtitle1,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                      PopupMenuButton(
                                                          itemBuilder:
                                                              (BuildContext
                                                                  context) {
                                                        return [
                                                          PopupMenuItem(
                                                            child: new ListTile(
                                                              leading: Icon(
                                                                  Icons.delete,
                                                                  color: Theme.of(
                                                                          context)
                                                                      .primaryColor),
                                                              title: Text(
                                                                  L10n.of(context)
                                                                      .lbl_delete,
                                                                  style: Theme.of(
                                                                          context)
                                                                      .primaryTextTheme
                                                                      .subtitle2),
                                                              onTap: () {
                                                                Navigator.of(
                                                                        context)
                                                                    .pop();
                                                                _deleteCouponConfirmationDialog(
                                                                    _couponList[
                                                                            index]
                                                                        .coupon_id,
                                                                    index);
                                                              },
                                                            ),
                                                          ),
                                                        ];
                                                      })
                                                    ],
                                                  )),
                                            ),
                                          );
                                        }),
                                  )
                                : Center(
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                          top: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              3),
                                      child: Text(L10n.of(context)
                                          .txt_coupon_list_will_shown_here),
                                    ),
                                  )
                            : Expanded(child: _shimmer())
                      ],
                    ),
                  ))
            ],
          ),
          bottomNavigationBar: _isDataLoaded
              ? Container(
                  margin:
                      EdgeInsets.only(top: 15, bottom: 15, left: 10, right: 10),
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  child: TextButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => AddCouponScreen(
                                a: widget.analytics,
                                o: widget.observer,
                              )));
                    },
                    child: Text(
                      L10n.of(context).btn_add_new_coupon,
                    ),
                  ),
                  decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                )
              : _shimmer1(),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  init() async {
    try {
      await _getCoupon();
      _isDataLoaded = true;
      setState(() {});
    } catch (e) {
      print("Exception - couponListScreen.dart - init():" + e.toString());
    }
  }

  @override
  void initState() {
    super.initState();
    init();
  }

  _deleteCoupon(int couponId, int _index) async {
    try {
      bool isConnected = await br.checkConnectivity();
      if (isConnected) {
        showOnlyLoaderDialog();
        await apiHelper.deleteCoupon(couponId).then((result) {
          if (result != null) {
            if (result.status == "1") {
              hideLoader();
              _couponList.removeAt(_index);
              setState(() {});
            } else {
              hideLoader();
              showSnackBar(
                  key: _scaffoldKey, snackBarMessage: '${result.message}');
            }
          }
        });
      } else {
        showNetworkErrorSnackBar(_scaffoldKey);
      }
    } catch (e) {
      print("Exception - couponListScreen.dart - _deleteCoupon():" +
          e.toString());
    }
  }

  Future _deleteCouponConfirmationDialog(couponId, _index) async {
    try {
      showDialog(
          context: context,
          builder: (_) {
            return AlertDialog(
              title: Text(
                L10n.of(context).lbl_delete_coupon,
              ),
              content: Text(
                  L10n.of(context).txt_confirmation_message_for_delete_Coupon),
              actions: [
                TextButton(
                  child: Text('NO'),
                  onPressed: () => Navigator.of(context).pop(),
                ),
                TextButton(
                  child: Text('YES'),
                  onPressed: () async {
                    Navigator.of(context).pop();
                    await _deleteCoupon(couponId as int, _index as int);
                  },
                )
              ],
            );
          });
    } catch (e) {
      print(
          "Exception - couponListScreen.dart - _deleteCouponConfirmationDialog():" +
              e.toString());
    }
  }

  _detailDialog(int _index) {
    try {
      showDialog(
          context: context,
          builder: (context) => CouponDetailDialog(
                _couponList[_index],
                a: widget.analytics,
                o: widget.observer,
              ));
    } catch (e) {
      print(
          'Exception - couponListScreen.dart - _detailDialog(): ${e.toString()}');
    }
  }

  _getCoupon() async {
    try {
      bool isConnected = await br.checkConnectivity();
      if (isConnected) {
        await apiHelper.getCoupon(global.user.id).then((result) {
          if (result != null) {
            if (result.status == "1") {
              _couponList = result.recordList as List<Coupon>;
            } else {
              _couponList = [];
            }
            setState(() {});
          }
        });
      } else {
        showNetworkErrorSnackBar(_scaffoldKey);
      }
    } catch (e) {
      print("Exception - couponListScreen.dart - _getCoupon():" + e.toString());
    }
  }

  Widget _shimmer() {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Shimmer.fromColors(
        baseColor: Colors.grey[300],
        highlightColor: Colors.grey[100],
        child: ListView.builder(
            shrinkWrap: true,
            itemCount: 5,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                height: 85,
                padding: const EdgeInsets.only(bottom: 8),
                child: Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(left: 15.0, top: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width,
                              height: 30,
                              child: Card(
                                margin:
                                    EdgeInsets.only(bottom: 5, left: 5, top: 5),
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width - 100,
                              height: 30,
                              child: Card(
                                  margin: EdgeInsets.only(
                                      bottom: 5, left: 5, top: 5)),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }),
      ),
    );
  }

  Widget _shimmer1() {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Shimmer.fromColors(
          baseColor: Colors.grey[300],
          highlightColor: Colors.grey[100],
          child: Container(
            height: 50,
            width: MediaQuery.of(context).size.width,
            child: Card(),
          )),
    );
  }
}
