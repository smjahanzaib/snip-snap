import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:SnipSnap/configs/constants.dart';
import 'package:SnipSnap/data/models/location_model.dart';
import 'package:SnipSnap/data/models/toolbar_option_model.dart';
import 'package:SnipSnap/generated/l10n.dart';
import 'package:SnipSnap/widgets/jumbotron.dart';
import 'package:SnipSnap/widgets/location_list_item.dart';
import 'package:SnipSnap/widgets/strut_text.dart';

class SearchResultList extends StatelessWidget {
  const SearchResultList({
    Key key,
    this.locations,
    this.currentListType,
  }) : super(key: key);

  final List<LocationModel> locations;
  final ToolbarOptionModel currentListType;

  @override
  Widget build(BuildContext context) {
    if (locations == null) {
      return Container();
    }

    if (locations.isEmpty) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 3 * kPaddingM),
        child: Column(
          children: <Widget>[
            Jumbotron(
              title: L10n.of(context).searchTitleNoResults.toUpperCase(),
              icon: Icons.info_outline,
            ),
            StrutText(
              L10n.of(context).locationNoResults,
              style: Theme.of(context)
                  .textTheme
                  .subtitle1
                  .copyWith(color: Theme.of(context).disabledColor),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      );
    }

    final LocationListItemViewType _viewType = LocationListItemViewType.values
        .firstWhere((LocationListItemViewType e) =>
            describeEnum(e) == currentListType.code);

    return Container(
      padding: const EdgeInsetsDirectional.only(
          start: kPaddingM, top: kPaddingM, bottom: kPaddingM),
      child: Wrap(
        runSpacing: kPaddingS,
        alignment: WrapAlignment.spaceBetween,
        children: locations.map((LocationModel item) {
          switch (_viewType) {
            case LocationListItemViewType.grid:
              return FractionallySizedBox(
                widthFactor: 0.5,
                child: Container(
                  padding: const EdgeInsetsDirectional.only(end: kPaddingM),
                  child: LocationListItem(
                    location: item,
                    viewType: _viewType,
                  ),
                ),
              );
              break;
            default:
              return Container(
                padding: const EdgeInsetsDirectional.only(end: kPaddingM),
                child: LocationListItem(
                  location: item,
                  viewType: _viewType,
                ),
              );
          }
        }).toList(),
      ),
    );
  }
}
