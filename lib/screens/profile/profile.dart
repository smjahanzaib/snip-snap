import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:SnipSnap/blocs/auth/auth_bloc.dart';
import 'package:SnipSnap/configs/app_globals.dart';
import 'package:SnipSnap/configs/constants.dart';
import 'package:SnipSnap/configs/routes.dart';
import 'package:SnipSnap/generated/l10n.dart';
import 'package:SnipSnap/main.dart';
import 'package:SnipSnap/screens/profile/widgets/profile_info.dart';
import 'package:SnipSnap/utils/bottom_bar_items.dart';
import 'package:SnipSnap/utils/ui.dart';
import 'package:SnipSnap/widgets/arrow_right_icon.dart';
import 'package:SnipSnap/widgets/badge.dart';
import 'package:SnipSnap/widgets/list_item.dart';
import 'package:SnipSnap/utils/text_style.dart';
import 'package:SnipSnap/widgets/list_title.dart';
import 'package:SnipSnap/widgets/strut_text.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      buildWhen: (AuthState previousState, AuthState currentState) =>
          currentState is PreferenceSaveSuccessAuthState,
      builder: (BuildContext context, AuthState state) {
        return AnnotatedRegion<SystemUiOverlayStyle>(
          value: Theme.of(context).brightness == Brightness.dark
              ? SystemUiOverlayStyle.light
              : SystemUiOverlayStyle.dark,
          child: Scaffold(
            body: SafeArea(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(kPaddingM),
                    child: Column(
                      children: <Widget>[ProfileInfo()],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding:
                          const EdgeInsets.symmetric(horizontal: kPaddingM),
                      child: ListView(
                        children: <Widget>[
                          ListItem(
                            title: L10n.of(context).profileListAppointments,
                            leading: const Icon(Icons.calendar_today),
                            trailing: Row(
                              children: <Widget>[
                                if (getIt
                                        .get<AppGlobals>()
                                        .user
                                        .upcomingAppointments >
                                    0)
                                  Badge(
                                    text: getIt
                                        .get<AppGlobals>()
                                        .user
                                        .upcomingAppointments
                                        .toString(),
                                    color: kWhite,
                                    backgroundColor: kPrimaryColor,
                                  )
                                else
                                  Container(),
                                const ArrowRightIcon(),
                              ],
                            ),
                            onPressed: () {
                              // tap on BottomNavigationBar button
                              (getIt
                                      .get<AppGlobals>()
                                      .globalKeyBottomBar
                                      .currentWidget as BottomNavigationBar)
                                  .onTap(getIt
                                      .get<BottomBarItems>()
                                      .getBottomBarItem('appointments'));
                            },
                          ),
                          // ListItem(
                          //   title: L10n.of(context).profileListVouchers,
                          //   leading: const Icon(Icons.redeem),
                          //   trailing: Row(
                          //     children: <Widget>[
                          //       if (getIt
                          //               .get<AppGlobals>()
                          //               .user
                          //               .activeVouchers >
                          //           0)
                          //         Badge(
                          //           text: getIt
                          //               .get<AppGlobals>()
                          //               .user
                          //               .activeVouchers
                          //               .toString(),
                          //           color: kWhite,
                          //           backgroundColor: kPrimaryColor,
                          //         )
                          //       else
                          //         Container(),
                          //       const ArrowRightIcon(),
                          //     ],
                          //   ),
                          //   onPressed: () =>
                          //       Navigator.pushNamed(context, Routes.vouchers),
                          // ),
                          ListItem(
                            title: L10n.of(context).profileListFavorites,
                            leading: const Icon(Icons.favorite_border),
                            trailing: const ArrowRightIcon(),
                            onPressed: () =>
                                Navigator.pushNamed(context, Routes.favorites),
                          ),
                          ListItem(
                            title: L10n.of(context).profileListReviews,
                            leading: const Icon(Icons.star_border),
                            trailing: const ArrowRightIcon(),
                            onPressed: () =>
                                Navigator.pushNamed(context, Routes.ratings),
                          ),
                          // ListItem(
                          //   title: L10n.of(context).profileListInvite,
                          //   leading: const Icon(Icons.people),
                          //   trailing: const ArrowRightIcon(),
                          //   onPressed: () =>
                          //       Navigator.pushNamed(context, Routes.invite),
                          // ),
                          ListItem(
                            title: L10n.of(context).profileListEdit,
                            leading: const Icon(Icons.person_outline),
                            trailing: const ArrowRightIcon(),
                            onPressed: () => Navigator.pushNamed(
                                context, Routes.editProfile),
                          ),
                          ListTitle(
                              title: L10n.of(context).profileListTitleSettings),
                          ListItem(
                            title: L10n.of(context).profileListPaymentCard,
                            leading: const Icon(Icons.payment),
                            trailing: const ArrowRightIcon(),
                            onPressed: () => Navigator.pushNamed(
                                context, Routes.paymentCard),
                          ),
                          ListItem(
                            title: L10n.of(context).profileListSettings,
                            leading: const Icon(Icons.settings),
                            trailing: const ArrowRightIcon(),
                            onPressed: () =>
                                Navigator.pushNamed(context, Routes.settings),
                          ),
                          Container(height: kPaddingM),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(vertical: kPaddingL),
                            child: BlocBuilder<AuthBloc, AuthState>(builder:
                                (BuildContext context, AuthState logoutState) {
                              return BlocListener<AuthBloc, AuthState>(
                                listener: (BuildContext context,
                                    AuthState logoutListener) {
                                  if (logoutListener
                                      is LogoutFailureAuthState) {
                                    UI.showErrorDialog(context,
                                        message: logoutListener.message);
                                  }
                                },
                                child: Center(
                                  child: InkWell(
                                    onTap: () =>
                                        BlocProvider.of<AuthBloc>(context)
                                            .add(UserLoggedOutAuthEvent()),
                                    child: StrutText(
                                      L10n.of(context).profileListLogout,
                                      style: Theme.of(context)
                                          .textTheme
                                          .subtitle1
                                          .w400
                                          .copyWith(
                                              color:
                                                  Theme.of(context).hintColor),
                                    ),
                                  ),
                                ),
                              );
                            }),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
