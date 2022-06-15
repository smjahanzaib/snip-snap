import 'dart:math';

import 'package:SnipSnap/data/models/bottom_bar_item_model.dart';

/// [BottomBarItemModel] items for bottom navigation.
class BottomBarItems {
  final List<BottomBarItemModel> _bottomBarItems = <BottomBarItemModel>[];

  int getBottomBarItem(String withId) {
    return max(
        0,
        _bottomBarItems
            .indexWhere((BottomBarItemModel item) => item.id == withId));
  }

  void clear() {
    _bottomBarItems.clear();
  }

  void add(BottomBarItemModel item) {
    _bottomBarItems.add(item);
  }

  List<BottomBarItemModel> getItems() => _bottomBarItems;
}
