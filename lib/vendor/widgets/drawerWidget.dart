import 'package:SnipSnap/vendor/models/businessLayer/baseRoute.dart';
import 'package:SnipSnap/vendor/models/businessLayer/global.dart' as global;
import 'package:SnipSnap/vendor/screens/changePasswordScreen.dart';
import 'package:SnipSnap/vendor/screens/couponListScreen.dart';
import 'package:SnipSnap/vendor/screens/expertListScreen.dart';
import 'package:SnipSnap/vendor/screens/galleryListScreen.dart';
import 'package:SnipSnap/vendor/screens/helpAndSupportScreen.dart';
import 'package:SnipSnap/vendor/screens/languageSelectionScreen.dart';
import 'package:SnipSnap/vendor/screens/myWalletScreen.dart';
import 'package:SnipSnap/vendor/screens/orderScreen.dart';
import 'package:SnipSnap/vendor/screens/productListScreen.dart';
import 'package:SnipSnap/vendor/screens/serviceListScreen.dart';
import 'package:SnipSnap/vendor/screens/settingScreen.dart';
import 'package:SnipSnap/vendor/screens/signInScreen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:SnipSnap/generated/l10n.dart';

class DrawerWidget extends BaseRoute {
  DrawerWidget({a, o}) : super(a: a, o: o, r: 'DrawerWidget');
  @override
  _DrawerWidgetState createState() => new _DrawerWidgetState();
}

class _DrawerWidgetState extends BaseRouteState {
  _DrawerWidgetState() : super();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Theme.of(context).primaryColor,
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 45, left: 08),
              child: ListTile(
                leading: CircleAvatar(
                  radius: 25,
                  child: global.user.vendor_logo == ""
                      ? CircleAvatar(
                          radius: 25,
                          backgroundImage: AssetImage(
                            'assets/userImage.png',
                          ),
                        )
                      : CachedNetworkImage(
                          imageUrl:
                              global.baseUrlForImage + global.user.vendor_logo,
                          imageBuilder: (context, imageProvider) =>
                              CircleAvatar(
                            radius: 25,
                            backgroundImage: imageProvider,
                          ),
                          placeholder: (context, url) =>
                              Center(child: CircularProgressIndicator()),
                          errorWidget: (context, url, error) =>
                              Icon(Icons.error),
                        ),
                ),
                title: Text(
                  '${global.user.owner_name}',
                  style: Theme.of(context).primaryTextTheme.button,
                ),
                subtitle: Text(
                  global.user.vendor_phone != null
                      ? '${global.user.vendor_phone}'
                      : '',
                  style: Theme.of(context).primaryTextTheme.headline5,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 40),
              child: ListTile(
                leading: Icon(
                  FontAwesomeIcons.wallet,
                  color: Colors.white,
                  size: 22,
                ),
                title: Text(
                  L10n.of(context).lbl_my_wallet,
                  style: Theme.of(context).primaryTextTheme.button,
                ),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (context) => MyWalletScreen(
                              a: widget.analytics,
                              o: widget.observer,
                            )),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(),
              child: ListTile(
                leading: Icon(
                  Icons.home_repair_service,
                  color: Colors.white,
                  size: 22,
                ),
                title: Text(
                  L10n.of(context).lbl_Add_service,
                  style: Theme.of(context).primaryTextTheme.button,
                ),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (context) => ServiceListScreen(
                              a: widget.analytics,
                              o: widget.observer,
                            )),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(),
              child: ListTile(
                leading: Icon(
                  Icons.person_add,
                  color: Colors.white,
                  size: 22,
                ),
                title: Text(
                  L10n.of(context).lbl_add_expert,
                  style: Theme.of(context).primaryTextTheme.button,
                ),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (context) => ExpertListScreen(
                              a: widget.analytics,
                              o: widget.observer,
                            )),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(),
              child: ListTile(
                leading: Icon(
                  FontAwesomeIcons.tag,
                  color: Colors.white,
                  size: 22,
                ),
                title: Text(
                  L10n.of(context).lbl_Add_coupon,
                  style: Theme.of(context).primaryTextTheme.button,
                ),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (context) => CouponListScreen(
                              a: widget.analytics,
                              o: widget.observer,
                            )),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(),
              child: ListTile(
                leading: Icon(
                  Icons.card_giftcard,
                  color: Colors.white,
                  size: 22,
                ),
                title: Text(
                  L10n.of(context).lbl_Add_gallery,
                  style: Theme.of(context).primaryTextTheme.button,
                ),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (context) => GalleryListScreen(
                              a: widget.analytics,
                              o: widget.observer,
                            )),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(),
              child: ListTile(
                leading: Icon(
                  Icons.card_giftcard,
                  color: Colors.white,
                  size: 22,
                ),
                title: Text(
                  L10n.of(context).lbl_add_product,
                  style: Theme.of(context).primaryTextTheme.button,
                ),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (context) => ProductListScreen(
                              a: widget.analytics,
                              o: widget.observer,
                            )),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(),
              child: ListTile(
                leading: Icon(
                  Icons.card_giftcard,
                  color: Colors.white,
                  size: 22,
                ),
                title: Text(
                  L10n.of(context).lbl_orders,
                  style: Theme.of(context).primaryTextTheme.button,
                ),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (context) => OrderScreen(
                              a: widget.analytics,
                              o: widget.observer,
                            )),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(),
              child: ListTile(
                leading: Icon(
                  Icons.lock,
                  color: Colors.white,
                  size: 22,
                ),
                title: Text(
                  L10n.of(context).lbl_change_password,
                  style: Theme.of(context).primaryTextTheme.button,
                ),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (context) => ChangePasswordScreen(
                              false,
                              a: widget.analytics,
                              o: widget.observer,
                            )),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(),
              child: ListTile(
                leading: Icon(
                  Icons.settings,
                  color: Colors.white,
                  size: 22,
                ),
                title: Text(
                  L10n.of(context).lbl_settings,
                  style: Theme.of(context).primaryTextTheme.button,
                ),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (context) => SettingScreen(
                              a: widget.analytics,
                              o: widget.observer,
                            )),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(),
              child: ListTile(
                leading: Icon(
                  FontAwesomeIcons.language,
                  color: Colors.white,
                  size: 22,
                ),
                title: Text(
                  L10n.of(context).lbl_selet_language,
                  style: Theme.of(context).primaryTextTheme.button,
                ),
                onTap: () {
                  // Navigator.of(context).push(
                  //   MaterialPageRoute(
                  //       builder: (context) => ChooseLanguageScreen(
                  //             a: widget.analytics,
                  //             o: widget.observer,
                  //           )),
                  // );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(),
              child: ListTile(
                leading: Icon(
                  Icons.help,
                  color: Colors.white,
                  size: 22,
                ),
                title: Text(
                  L10n.of(context).lbl_help_and_support,
                  style: Theme.of(context).primaryTextTheme.button,
                ),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (context) => HelpAndSupportScreen(
                              a: widget.analytics,
                              o: widget.observer,
                            )),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(),
              child: ListTile(
                leading: Icon(
                  Icons.logout,
                  color: Colors.white,
                  size: 22,
                ),
                title: Text(
                  L10n.of(context).lbl_sign_out,
                  style: Theme.of(context).primaryTextTheme.button,
                ),
                onTap: () {
                  _confirmationDialog();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  bool isloading = true;

  @override
  void initState() {
    super.initState();
  }

  Future _confirmationDialog() async {
    showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            title: Text(
              L10n.of(context).lbl_sign_out,
            ),
            content:
                Text(L10n.of(context).txt_confirmation_message_for_sign_out),
            actions: [
              TextButton(
                child: Text(L10n.of(context).lbl_no),
                onPressed: () => Navigator.of(context).pop(),
              ),
              TextButton(
                child: Text(L10n.of(context).lbl_yes),
                onPressed: () async {
                  global.sp.remove("currentUser");
                  Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (context) => SignInScreen(
                              a: widget.analytics,
                              o: widget.observer,
                            )),
                  );
                },
              )
            ],
          );
        });
  }
}
