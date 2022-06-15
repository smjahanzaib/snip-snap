import 'package:flutter/material.dart';
import 'package:SnipSnap/configs/app_globals.dart';
import 'package:SnipSnap/configs/constants.dart';
import 'package:SnipSnap/data/models/toolbar_option_model.dart';
import 'package:SnipSnap/generated/l10n.dart';
import 'package:SnipSnap/main.dart';
import 'package:SnipSnap/widgets/filter_button.dart';
import 'package:SnipSnap/widgets/modal_bottom_sheet_item.dart';

class AppointmentsToolbar extends StatefulWidget {
  const AppointmentsToolbar({
    Key key,
    @required this.currentSort,
    @required this.currentGroup,
    @required this.onSortChange,
    @required this.searchSortTypes,
    @required this.searchGroupTypes,
    this.onGroupChange,
  }) : super(key: key);

  final ToolbarOptionModel currentSort;
  final ToolbarOptionModel currentGroup;
  final ToolbarOptionModelCallback onSortChange;
  final ToolbarOptionModelCallback onGroupChange;
  final List<ToolbarOptionModel> searchSortTypes;
  final List<ToolbarOptionModel> searchGroupTypes;

  @override
  _AppointmentsToolbarState createState() => _AppointmentsToolbarState();
}

class _AppointmentsToolbarState extends State<AppointmentsToolbar> {
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
            label: widget.currentGroup.label,
            modalTitle: L10n.of(context).searchTitleFilter,
            modalItems: widget.searchGroupTypes,
            selectedItem: ModalBottomSheetItem<ToolbarOptionModel>(
              text: widget.currentGroup.label,
              value: widget.currentGroup,
            ),
            onSelection: (ToolbarOptionModel filterModel) =>
                widget.onGroupChange(filterModel),
          ),
          FilterButton(
            label: widget.currentSort.label,
            modalTitle: L10n.of(context).searchTitleFilter,
            modalItems: widget.searchSortTypes,
            selectedItem: ModalBottomSheetItem<ToolbarOptionModel>(
              text: widget.currentSort.label,
              value: widget.currentSort,
            ),
            onSelection: (ToolbarOptionModel filterModel) =>
                widget.onSortChange(filterModel),
          ),
        ],
      ),
    );
  }
}
