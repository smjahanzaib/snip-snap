import 'package:flutter/material.dart';
import 'package:SnipSnap/configs/app_globals.dart';
import 'package:SnipSnap/configs/constants.dart';
import 'package:SnipSnap/generated/l10n.dart';
import 'package:SnipSnap/main.dart';
import 'package:SnipSnap/screens/home/widgets/wavy_header_image.dart';
import 'package:SnipSnap/utils/bottom_bar_items.dart';
import 'package:SnipSnap/utils/text_style.dart';
import 'package:SnipSnap/widgets/strut_text.dart';

/// Delegate for configuring a [SliverPersistentHeader].
///
/// A sliver whose size varies when the sliver is scrolled to the edge
/// of the viewport opposite the sliver's [GrowthDirection].
class HomeHeader extends SliverPersistentHeaderDelegate {
  HomeHeader({this.expandedHeight});

  /// The max height of the header.
  final double expandedHeight;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: <Widget>[
          WavyHeaderImage(
              shrinkOffsetPercentage: shrinkOffset / expandedHeight),
          Padding(
            padding: const EdgeInsets.only(
                bottom: kPaddingL,
                left: kPaddingL,
                right: kPaddingL,
                top: kToolbarHeight + kPaddingM),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Flexible(
                      child: StrutText(
                        getIt.get<AppGlobals>().user != null
                            ? L10n.of(context).homeTitleUser(
                                getIt.get<AppGlobals>().user?.fullName)
                            : L10n.of(context).homeTitleGuest,
                        style: Theme.of(context).textTheme.headline4.white.w600,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(top: kPaddingS),
                    child: StrutText(
                      L10n.of(context).homeHeaderSubtitle,
                      style: Theme.of(context)
                          .textTheme
                          .headline6
                          .copyWith(color: kWhite.withOpacity(.85)),
                      maxLines: 1,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(
                  bottom: kPaddingL, left: kPaddingL, right: kPaddingL),
              child: Card(
                color: getIt.get<AppGlobals>().isPlatformBrightnessDark
                    ? Theme.of(context).accentColor
                    : Theme.of(context).cardColor,
                margin: const EdgeInsets.all(0),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(kBoxDecorationRadius)),
                elevation: 2,
                child: Container(
                  padding: const EdgeInsets.all(4),
                  child: FlatButton(
                    shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(kBoxDecorationRadius / 2)),
                    onPressed: () {
                      // Switch to Search Tab
                      (getIt.get<AppGlobals>().globalKeyBottomBar.currentWidget
                              as BottomNavigationBar)
                          .onTap(getIt
                              .get<BottomBarItems>()
                              .getBottomBarItem('explore'));
                    },
                    child: IntrinsicHeight(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.search,
                            color: Theme.of(context).hintColor,
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: StrutText(
                              L10n.of(context).homePlaceholderSearch,
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle1
                                  .copyWith(color: Theme.of(context).hintColor),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// The size of the header when it is not shrinking at the top of the
  /// viewport.
  ///
  /// This must return a value equal to or greater than [minExtent].
  @override
  double get maxExtent => expandedHeight;

  /// The smallest size to allow the header to reach, when it shrinks at the
  /// start of the viewport.
  ///
  /// This must return a value equal to or less than [maxExtent].
  @override
  double get minExtent => 158;

  /// Whether this delegate is meaningfully different from the old delegate.
  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => true;
}
