import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:SnipSnap/blocs/search/search_bloc.dart';
import 'package:SnipSnap/generated/l10n.dart';
import 'package:SnipSnap/utils/string.dart';
import 'package:SnipSnap/configs/constants.dart';
import 'package:SnipSnap/utils/text_style.dart';
import 'package:SnipSnap/widgets/strut_text.dart';

class SearchHeader extends SliverPersistentHeaderDelegate {
  SearchHeader({
    this.label,
    this.expandedHeight,
    this.onPressed,
  });

  final double expandedHeight;
  final VoidCallback onPressed;
  final String label;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Theme.of(context).appBarTheme.color,
      child: Padding(
        padding: const EdgeInsetsDirectional.only(
          start: kPaddingM,
          end: kPaddingM,
          top: kPaddingS,
        ),
        child: Column(
          children: <Widget>[
            Card(
              margin: const EdgeInsets.all(0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(kBoxDecorationRadius),
              ),
              elevation: 0,
              child: FlatButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(kFormFieldsRadius),
                ),
                onPressed: () {
                  if (onPressed != null) {
                    onPressed();
                  }
                },
                child: IntrinsicHeight(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.only(end: kPaddingS),
                        child: Icon(
                          Icons.search,
                          color: Theme.of(context).hintColor,
                        ),
                      ),
                      Expanded(
                        child: StrutText(
                          label == null || label.isEmpty
                              ? L10n.of(context).searchLabelQuickSearch
                              : label,
                          style: Theme.of(context)
                              .textTheme
                              .subtitle1
                              .fs18
                              .copyWith(color: Theme.of(context).hintColor),
                        ),
                      ),
                      if (label.isNotNullOrEmpty)
                        InkWell(
                          /// Clear the quick search.
                          onTap: () => BlocProvider.of<SearchBloc>(context)
                              .add(KeywordChangedSearchEvent('')),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.only(
                                start: kPaddingS),
                            child: Icon(
                              Icons.clear,
                              color: Theme.of(context).hintColor,
                            ),
                          ),
                        )
                      else
                        Container(),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  double get maxExtent => expandedHeight;

  @override
  double get minExtent => expandedHeight;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => true;
}
