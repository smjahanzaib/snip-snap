import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:SnipSnap/blocs/cities/cities_bloc.dart';
import 'package:SnipSnap/blocs/search/search_bloc.dart';
import 'package:SnipSnap/configs/constants.dart';
import 'package:SnipSnap/configs/routes.dart';
import 'package:SnipSnap/data/models/city_model.dart';
import 'package:SnipSnap/data/models/date_range_model.dart';
import 'package:SnipSnap/generated/l10n.dart';
import 'package:SnipSnap/screens/search/widgets/search_cities_delegate.dart';
import 'package:SnipSnap/widgets/picker.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:SnipSnap/widgets/strut_text.dart';

class SearchForm extends StatefulWidget {
  const SearchForm({
    Key key,
    this.selectedDateRange = 0,
    this.selectedCity,
    this.myLocation,
  }) : super(key: key);

  final int selectedDateRange;
  final CityModel selectedCity;
  final CityModel myLocation;

  @override
  _SearchFormState createState() => _SearchFormState();
}

class _SearchFormState extends State<SearchForm> {
  CityModel _selectedCity;

  @override
  void initState() {
    super.initState();

    initializeDateFormatting();

    _selectedCity = widget.selectedCity;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).appBarTheme.color,
      padding:
          const EdgeInsetsDirectional.only(start: kPaddingM, end: kPaddingM),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            child: InkWell(
              onTap: () => _showCityPicker(context),
              child: Card(
                margin: const EdgeInsetsDirectional.only(
                    end: 4, start: 0, top: 0, bottom: 0),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(kBoxDecorationRadius)),
                elevation: 0,
                child: Container(
                  padding: const EdgeInsetsDirectional.only(
                    start: kPaddingS,
                    end: kPaddingS,
                    top: kPaddingS,
                    bottom: kPaddingS,
                  ),
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsetsDirectional.only(end: 4),
                        child: Icon(
                          Icons.near_me,
                          size: 16,
                          color: Theme.of(context).hintColor,
                        ),
                      ),
                      Expanded(
                        child: StrutText(
                          (_selectedCity != null && _selectedCity.id.isNotEmpty)
                              ? _selectedCity.name
                              : L10n.of(context).searchLabelNearby,
                          style: Theme.of(context)
                              .textTheme
                              .subtitle1
                              .copyWith(color: Theme.of(context).hintColor),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: InkWell(
              onTap: () => _showDatePicker(context),
              child: Card(
                margin: const EdgeInsets.all(0),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(kBoxDecorationRadius)),
                elevation: 0,
                child: Container(
                  padding: const EdgeInsetsDirectional.only(
                    start: kPaddingS,
                    end: kPaddingS,
                    top: kPaddingS,
                    bottom: kPaddingS,
                  ),
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsetsDirectional.only(end: 4),
                        child: Icon(
                          Icons.calendar_today,
                          size: 16,
                          color: Theme.of(context).hintColor,
                        ),
                      ),
                      Expanded(
                        child: StrutText(
                          _dateRangeToString(widget.selectedDateRange),
                          style: Theme.of(context)
                              .textTheme
                              .subtitle1
                              .copyWith(color: Theme.of(context).hintColor),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _showCityPicker(BuildContext context) async {
    final CityModel _cityModel = await showSearch<CityModel>(
      context: context,
      delegate: SearchCitiesDelegate(
        hintText: L10n.of(context).searchPlaceholderQuickSearchCities,
        citiesBloc: BlocProvider.of<CitiesBloc>(context),
        myLocation: widget.myLocation,
      ),
      query: _selectedCity != null ? _selectedCity.name : '',
    );

    if (_cityModel != null) {
      setState(() => _selectedCity = _cityModel);
    }
  }

  Future<void> _showDatePicker(BuildContext context) async {
    final List<PickerItem<DateRangeModel>> _pickerItems =
        <PickerItem<DateRangeModel>>[];
    final List<PickerItem<DateRangeModel>> _selectedItems =
        <PickerItem<DateRangeModel>>[];

    for (int _range = 0; _range < kReservationsDateRange; _range++) {
      final DateRangeModel _dateModel =
          DateRangeModel(_dateRangeToString(_range), _range);

      _pickerItems.add(PickerItem<DateRangeModel>(
        text: _dateModel.label,
        value: _dateModel,
        precedingIcon: Icons.calendar_today,
      ));
    }

    _selectedItems.add(_pickerItems[widget.selectedDateRange]);

    final dynamic _returned = await Navigator.pushNamed(
      context,
      Routes.picker,
      arguments: <String, dynamic>{
        'title': L10n.of(context).pickerTitleDate,
        'items': _pickerItems,
        'itemsSelected': _selectedItems,
      },
    );

    if (_returned != null) {
      BlocProvider.of<SearchBloc>(context).add(
          NewDateRangeSelectedSearchEvent((_returned as DateRangeModel).range));
    }
  }

  String _dateRangeToString(int _range) {
    final DateTime dt = DateTime.now().add(Duration(days: _range));

    if (_range == 0) {
      return L10n.of(context).commonWeekdayToday;
    }

    if (_range == 1) {
      return L10n.of(context).commonWeekdayTomorrow;
    }

    return DateFormat('EEEE, d MMM').format(dt);

    // return sprintf('%s, %d %s', <dynamic>[
    //   L10n.of(context).commonWeekdayShort(dt.weekday - 1),
    //   dt.day,
    //   L10n.of(context).commonMonthShort(dt.month),
    // ]);
  }
}
