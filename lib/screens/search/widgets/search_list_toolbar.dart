import 'package:flutter/material.dart';
import 'package:SnipSnap/configs/app_globals.dart';
import 'package:SnipSnap/configs/constants.dart';
import 'package:SnipSnap/data/models/toolbar_option_model.dart';
import 'package:SnipSnap/generated/l10n.dart';
import 'package:SnipSnap/main.dart';
import 'package:SnipSnap/widgets/filter_button.dart';
import 'package:SnipSnap/widgets/modal_bottom_sheet_item.dart';

class SearchListToolbar extends StatefulWidget {
  const SearchListToolbar({
    Key key,
    @required this.searchSortTypes,
    @required this.searchGenderTypes,
    @required this.currentSort,
    @required this.currentGenderFilter,
    @required this.onSortChange,
    @required this.onGenderFilterChange,
    this.onFilterTap,
  }) : super(key: key);

  final List<ToolbarOptionModel> searchSortTypes;
  final List<ToolbarOptionModel> searchGenderTypes;
  final ToolbarOptionModel currentSort;
  final ToolbarOptionModel currentGenderFilter;
  final ToolbarOptionModelCallback onSortChange;
  final ToolbarOptionModelCallback onGenderFilterChange;
  final VoidCallback onFilterTap;

  @override
  _SearchListToolbarState createState() => _SearchListToolbarState();
}

class _SearchListToolbarState extends State<SearchListToolbar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsetsDirectional.only(
          start: kPaddingM, top: kPaddingS, bottom: kPaddingS),
      color: getIt.get<AppGlobals>().isPlatformBrightnessDark
          ? Theme.of(context).scaffoldBackgroundColor
          : Theme.of(context).appBarTheme.color.withAlpha(50),
      child: Row(
        children: <Widget>[
          FilterButton(
            label: widget.currentGenderFilter.label,
            modalTitle: L10n.of(context).searchTitleFilter,
            modalItems: widget.searchGenderTypes,
            selectedItem: ModalBottomSheetItem<ToolbarOptionModel>(
              text: widget.currentGenderFilter.label,
              value: widget.currentGenderFilter,
            ),
            onSelection: (ToolbarOptionModel filterModel) =>
                widget.onGenderFilterChange(filterModel),
          ),
          FilterButton(
            label: widget.currentSort.label,
            modalTitle: L10n.of(context).searchTitleSortOrder,
            modalItems: widget.searchSortTypes,
            selectedItem: ModalBottomSheetItem<ToolbarOptionModel>(
              text: widget.currentSort.label,
              value: widget.currentSort,
            ),
            onSelection: (ToolbarOptionModel sortModel) =>
                widget.onSortChange(sortModel),
          ),
          const Spacer(),
          IconButton(
            color: kPrimaryColor,
            padding: const EdgeInsetsDirectional.only(end: kPaddingM),
            onPressed: widget.onFilterTap,
            icon: const Icon(Icons.filter_list),
            tooltip: L10n.of(context).searchTooltipFilters,
          ),
        ],
      ),
    );
  }
}
