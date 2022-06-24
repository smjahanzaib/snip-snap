import 'package:SnipSnap/data/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:SnipSnap/blocs/auth/auth_bloc.dart';
import 'package:SnipSnap/configs/app_globals.dart';
import 'package:SnipSnap/configs/constants.dart';
import 'package:SnipSnap/data/models/bottom_bar_item_model.dart';
import 'package:SnipSnap/main.dart';
import 'package:SnipSnap/screens/appointments/appointments.dart';
import 'package:SnipSnap/screens/appointments/appointments_welcome.dart';
import 'package:SnipSnap/vendor2/screens/edit_salon/edit_salon.dart';
import 'package:SnipSnap/vendor2/screens/add_service/add_service.dart';
import 'package:SnipSnap/vendor2/screens/add_staff/add_staff.dart';
import 'package:SnipSnap/screens/home/home.dart';
import 'package:SnipSnap/screens/inbox/inbox.dart';
import 'package:SnipSnap/screens/profile/profile.dart';
import 'package:SnipSnap/screens/search/search.dart';
import 'package:SnipSnap/screens/sign_in.dart';
import 'package:SnipSnap/utils/bottom_bar_items.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({Key key}) : super(key: key);

  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _selectedIndex = 0;
  final UserModel currentUser = getIt.get<AppGlobals>().user;

  void _onItemTapped(int index) {
    setState(() => _selectedIndex = index);
    setState(() => _selectedIndex = index);
  }

  /// Creates the bottom bar items.
  List<BottomNavigationBarItem> _bottomBarItems(BuildContext context) {
    getIt.get<BottomBarItems>().clear();
// mode_edit  edit_sharp
    if (getIt.get<AppGlobals>().user != null &&
        getIt.get<AppGlobals>().user.role == 'admin')
      getIt.get<BottomBarItems>().add(
          const BottomBarItemModel(id: 'SalonEdit', icon: Icons.mode_edit));
    else
      getIt
          .get<BottomBarItems>()
          .add(const BottomBarItemModel(id: 'home', icon: Icons.explore));
    if (getIt.get<AppGlobals>().user != null &&
        getIt.get<AppGlobals>().user.role == 'admin')
      getIt.get<BottomBarItems>().add(const BottomBarItemModel(
          id: 'SalonEdit', icon: Icons.home_repair_service));
    else
      getIt
          .get<BottomBarItems>()
          .add(const BottomBarItemModel(id: 'explore', icon: Icons.search));
    if (getIt.get<AppGlobals>().user != null &&
        getIt.get<AppGlobals>().user.role == 'admin')
      getIt.get<BottomBarItems>().add(const BottomBarItemModel(
          id: 'addStaff', icon: Icons.supervisor_account));
    getIt.get<BottomBarItems>().add(
        const BottomBarItemModel(id: 'appointments', icon: Icons.date_range));
    getIt
        .get<BottomBarItems>()
        .add(const BottomBarItemModel(id: 'inbox', icon: Icons.message));
    getIt
        .get<BottomBarItems>()
        .add(const BottomBarItemModel(id: 'profile', icon: Icons.person));

    final List<BottomNavigationBarItem> bottomBarItems =
        <BottomNavigationBarItem>[];

    for (final BottomBarItemModel item
        in getIt.get<BottomBarItems>().getItems()) {
      bottomBarItems.add(BottomNavigationBarItem(
        icon: Icon(item.icon, size: kBottomBarIconSize),
        label: '',
      ));
    }

    return bottomBarItems;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AuthBloc, AuthState>(
        builder: (BuildContext context, AuthState state) {
          return IndexedStack(
            index: _selectedIndex,
            children: <Widget>[
              if (getIt.get<AppGlobals>().user != null &&
                  getIt.get<AppGlobals>().user.role == 'admin')
                EditSalonScreen(
                    key: getIt.get<AppGlobals>().globalKeyHomeScreen)
              else
                HomeScreen(key: getIt.get<AppGlobals>().globalKeyHomeScreen),
              if (getIt.get<AppGlobals>().user != null &&
                  getIt.get<AppGlobals>().user.role == 'admin')
                AddVendorServiceScreen(
                    key: getIt.get<AppGlobals>().globalKeyHomeScreen)
              else
                SearchScreen(
                    key: getIt.get<AppGlobals>().globalKeySearchScreen),
              if (getIt.get<AppGlobals>().user != null &&
                  getIt.get<AppGlobals>().user.role == 'admin')
                AddStaffScreen(
                    key: getIt.get<AppGlobals>().globalKeyHomeScreen),
              if (getIt.get<AppGlobals>().user != null)
                const AppointmentsScreen()
              else
                const AppointmentsWelcomeScreen(),
              if (getIt.get<AppGlobals>().user != null)
                const InboxScreen()
              else
                const SignInScreen(),
              if (getIt.get<AppGlobals>().user != null)
                const ProfileScreen()
              else
                const SignInScreen(),
            ],
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        key: getIt.get<AppGlobals>().globalKeyBottomBar,
        items: _bottomBarItems(context),
        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.fixed,
        //unselectedItemColor: Theme.of(context).unselectedWidgetColor,
        //selectedItemColor: Theme.of(context).primaryColor,
        onTap: _onItemTapped,
      ),
    );
  }
}
