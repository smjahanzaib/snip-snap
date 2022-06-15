import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:SnipSnap/generated/l10n.dart';

/// Widget that attaches refresh and load more functions controllers to the list
/// using the [SmartRefresher] plugin.
class PullToRefresh extends StatelessWidget {
  const PullToRefresh({
    Key key,
    this.child,
    this.onLoading,
    this.onRefresh,
    this.controller,
    this.enablePullDown,
    this.enablePullUp,
  }) : super(key: key);

  final Widget child;
  final void Function() onRefresh;
  final void Function() onLoading;
  final RefreshController controller;
  final bool enablePullDown;
  final bool enablePullUp;

  @override
  Widget build(BuildContext context) {
    return SmartRefresher(
      enablePullDown: enablePullDown ?? true,
      enablePullUp: enablePullUp ?? false,
      onRefresh: onRefresh,
      onLoading: onLoading,
      controller: controller,
      header: ClassicHeader(
        idleText: L10n.of(context).commonSmartRefresherHeaderIdleText,
        refreshingText:
            L10n.of(context).commonSmartRefresherHeaderRefreshingText,
        completeText: L10n.of(context).commonSmartRefresherHeaderCompleteText,
        releaseText: L10n.of(context).commonSmartRefresherHeaderReleaseText,
        refreshingIcon: const SizedBox(
          width: 16.0,
          height: 16.0,
          child: CircularProgressIndicator(strokeWidth: 2),
        ),
      ),
      footer: ClassicFooter(
        loadingText: L10n.of(context).commonSmartRefresherFooterLoadingText,
        canLoadingText:
            L10n.of(context).commonSmartRefresherFooterCanLoadingText,
        idleText: L10n.of(context).commonSmartRefresherFooterIdleText,
        loadStyle: LoadStyle.ShowWhenLoading,
        loadingIcon: const SizedBox(
          width: 16.0,
          height: 16.0,
          child: CircularProgressIndicator(strokeWidth: 2),
        ),
      ),
      child: child ?? Container(),
    );
  }
}
