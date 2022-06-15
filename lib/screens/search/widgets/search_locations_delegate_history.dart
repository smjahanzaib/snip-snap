import 'package:flutter/material.dart';
import 'package:SnipSnap/configs/constants.dart';
import 'package:SnipSnap/data/models/search_history_model.dart';
import 'package:SnipSnap/data/repositories/location_repository.dart';
import 'package:SnipSnap/generated/l10n.dart';
import 'package:SnipSnap/utils/list.dart';
import 'package:SnipSnap/widgets/uppercase_title.dart';

/// Signature for when a tap on search history query has occurred.
typedef SearchHistoryTapCallback = void Function(SearchHistoryModel model);

class SearchLocationsDelegateHistory extends StatefulWidget {
  const SearchLocationsDelegateHistory({
    Key key,
    this.onQuerySelected,
  }) : super(key: key);

  final SearchHistoryTapCallback onQuerySelected;

  @override
  _SearchLocationsDelegateHistoryState createState() =>
      _SearchLocationsDelegateHistoryState();
}

class _SearchLocationsDelegateHistoryState
    extends State<SearchLocationsDelegateHistory> {
  List<SearchHistoryModel> _searchHistory;

  @override
  void initState() {
    _loadHistory();
    super.initState();
  }

  Future<void> _loadHistory() async {
    const LocationRepository locationRepository = LocationRepository();

    _searchHistory = await locationRepository.getSearchHistory();

    if (_searchHistory.isNotEmpty) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_searchHistory.isNullOrEmpty) {
      return Container();
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: kPaddingM),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          UppercaseTitle(title: L10n.of(context).searchTitleRecentSearches),
          Padding(
            padding: const EdgeInsets.only(top: kPaddingM, bottom: kPaddingL),
            child: Wrap(
              alignment: WrapAlignment.start,
              spacing: 10,
              children: _searchHistory.map((SearchHistoryModel item) {
                return InputChip(
                  deleteIconColor: kPrimaryColor,
                  labelStyle: Theme.of(context).textTheme.subtitle1,
                  padding: const EdgeInsets.all(10),
                  backgroundColor: Theme.of(context).cardColor,
                  elevation: 1,
                  onPressed: () {
                    if (widget.onQuerySelected != null) {
                      widget.onQuerySelected(item);
                    }
                  },
                  label: Text(item.query),
                  onDeleted: () {
                    _searchHistory.remove(item);
                    setState(() {});
                  },
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
