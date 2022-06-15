import 'package:flutter/material.dart';
import 'package:SnipSnap/configs/constants.dart';
import 'package:SnipSnap/data/models/location_model.dart';
import 'package:SnipSnap/data/models/toolbar_option_model.dart';
import 'package:SnipSnap/generated/l10n.dart';
import 'package:SnipSnap/utils/text_style.dart';
import 'package:SnipSnap/widgets/strut_text.dart';

class SearchResultTitle extends StatelessWidget {
  const SearchResultTitle({
    Key key,
    @required this.locations,
    @required this.searchListTypes,
    @required this.currentListType,
    @required this.onListTypeChange,
  }) : super(key: key);

  final List<LocationModel> locations;
  final List<ToolbarOptionModel> searchListTypes;
  final ToolbarOptionModel currentListType;
  final ToolbarOptionModelCallback onListTypeChange;

  void _switchListTypeSelection(BuildContext context) {
    int index = searchListTypes
        .indexWhere((ToolbarOptionModel t) => t.code == currentListType.code);

    if (index != -1) {
      index++;
      if (index == searchListTypes.length) {
        index = 0;
      }

      onListTypeChange(searchListTypes[index]);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (locations == null || locations.isEmpty) {
      return Container();
    }

    return Row(
      children: <Widget>[
        Padding(
          padding: const EdgeInsetsDirectional.only(
            start: kPaddingM,
            end: kPaddingM,
            top: kPaddingM,
          ),
          child: StrutText(
            L10n.of(context).searchTitleResults(locations.length.toString()),
            style: Theme.of(context).textTheme.headline5.bold,
          ),
        ),
        const Spacer(),
        IconButton(
          color: kPrimaryColor,
          padding:
              const EdgeInsetsDirectional.only(top: kPaddingM, end: kPaddingM),
          onPressed: () => _switchListTypeSelection(context),
          icon: Icon(currentListType.icon),
          tooltip: L10n.of(context).searchTooltipView,
        ),
      ],
    );
  }
}
