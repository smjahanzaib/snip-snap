import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:SnipSnap/blocs/search/search_bloc.dart';
import 'package:SnipSnap/configs/constants.dart';
import 'package:SnipSnap/data/models/button_group_model.dart';
import 'package:SnipSnap/generated/l10n.dart';
import 'package:SnipSnap/widgets/star_rating.dart';
import 'package:SnipSnap/widgets/strut_text.dart';
import 'package:SnipSnap/widgets/theme_button.dart';
import 'package:SnipSnap/widgets/theme_button_group.dart';
import 'package:SnipSnap/widgets/uppercase_title.dart';

class SearchFilterDrawer extends StatefulWidget {
  @override
  _SearchFilterDrawerState createState() => _SearchFilterDrawerState();
}

class _SearchFilterDrawerState extends State<SearchFilterDrawer> {
  double _starRating = 5;
  RangeValues _rangeValues = const RangeValues(0, 20);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      /// We want a wider drawer - 85% of the screen.
      width: MediaQuery.of(context).size.width * 0.85,
      child: Drawer(
        child: SafeArea(
          bottom: false,
          child: Column(
            children: <Widget>[
              Container(
                padding: const EdgeInsets.symmetric(horizontal: kPaddingS),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    InkWell(
                      child: Container(
                        child: Icon(
                          Icons.close,
                          size: 32,
                          color: Theme.of(context).textTheme.subtitle1.color,
                        ),
                      ),
                      onTap: () => Navigator.pop(context),
                    ),
                    const Padding(
                        padding: EdgeInsetsDirectional.only(end: kPaddingS)),
                    StrutText(
                      L10n.of(context).searchTitleFilter,
                      style: Theme.of(context).textTheme.headline6,
                      textAlign: TextAlign.center,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.symmetric(horizontal: kPaddingM),
                  children: <Widget>[
                    UppercaseTitle(
                      title: L10n.of(context).searchTitleRating,
                      padding: const EdgeInsets.only(
                          top: kPaddingM, bottom: kPaddingS),
                    ),
                    Row(
                      children: <Widget>[
                        StarRating(
                          rating: _starRating,
                          size: 32,
                          allowHalfRating: false,
                          onRatingChanged: (double value) {
                            setState(() => _starRating = value);
                          },
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.only(
                              start: kPaddingS),
                          child: StrutText(
                            L10n.of(context).searchLabelRatingFilter(
                                _starRating.round().toString()),
                            style: Theme.of(context).textTheme.subtitle1,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        UppercaseTitle(
                          title: L10n.of(context).searchTitleDistance,
                          padding: const EdgeInsets.only(
                              top: kPaddingL, bottom: kPaddingS),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: kPaddingL, bottom: kPaddingS),
                          child: Text(L10n.of(context)
                              .searchDrawerDistanceRange(
                                  _rangeValues.start.round().toString(),
                                  _rangeValues.end.round().toString())),
                        ),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        RangeSlider(
                          min: 0,
                          max: 100,
                          divisions: 10,
                          values: _rangeValues,
                          activeColor: kPrimaryColor,
                          inactiveColor: Theme.of(context).highlightColor,
                          labels: RangeLabels(
                            _rangeValues.start.round().toString(),
                            _rangeValues.end.round().toString(),
                          ),

                          /// Let’s say the allowed distance can be within 0 and
                          /// 100, but you want the range to be at least 10 apart.
                          onChanged: (RangeValues values) {
                            setState(() {
                              if (values.end - values.start >= 20) {
                                _rangeValues = values;
                              } else {
                                if (_rangeValues.start == values.start) {
                                  _rangeValues = RangeValues(_rangeValues.start,
                                      _rangeValues.start + 10);
                                } else {
                                  _rangeValues = RangeValues(
                                      _rangeValues.end - 10, _rangeValues.end);
                                }
                              }
                            });
                          },
                        ),
                      ],
                    ),
                    UppercaseTitle(
                      title: L10n.of(context).searchTitlePrice,
                      padding: const EdgeInsets.only(
                          top: kPaddingL, bottom: kPaddingS),
                    ),
                    ThemeButtonGroup(
                      buttonValues: const <ButtonGroupModel>[
                        ButtonGroupModel(
                          id: '\$',
                          label: '\$',
                        ),
                        ButtonGroupModel(
                          id: '\$\$',
                          label: '\$\$',
                        ),
                        ButtonGroupModel(
                          id: '\$\$\$',
                          label: '\$\$\$',
                        )
                      ],
                      isUnselectable: true,
                      onChange: (ButtonGroupModel selectedButton) {},
                    ),
                    UppercaseTitle(
                      title: L10n.of(context).searchTitleWorkingHours,
                      padding: const EdgeInsets.only(
                          top: kPaddingL, bottom: kPaddingS),
                    ),
                    ThemeButtonGroup(
                      buttonValues: <ButtonGroupModel>[
                        ButtonGroupModel(
                          id: 'any',
                          label: L10n.of(context).searchBtnGroupAny,
                        ),
                        ButtonGroupModel(
                          id: 'currently_open',
                          label: L10n.of(context).searchBtnGroupCurrentlyOpen,
                        ),
                      ],
                      preselectedValue: ButtonGroupModel(
                        id: 'any',
                        label: L10n.of(context).searchBtnGroupAny,
                      ),
                      onChange: (ButtonGroupModel selectedButton) {},
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(kPaddingM),
                child: ThemeButton(
                  text: L10n.of(context).commonBtnApply,
                  onPressed: () {
                    BlocProvider.of<SearchBloc>(context)
                        .add(FilteredListRequestedSearchEvent());

                    Navigator.pop(context);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
