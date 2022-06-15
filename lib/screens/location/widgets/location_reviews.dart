import 'package:flutter/material.dart';
import 'package:SnipSnap/configs/constants.dart';
import 'package:SnipSnap/configs/routes.dart';
import 'package:SnipSnap/data/models/location_model.dart';
import 'package:SnipSnap/data/models/review_model.dart';
import 'package:SnipSnap/generated/l10n.dart';
import 'package:SnipSnap/widgets/link_text.dart';
import 'package:SnipSnap/widgets/review_list_item.dart';
import 'package:SnipSnap/widgets/star_rating.dart';
import 'package:SnipSnap/utils/text_style.dart';
import 'package:SnipSnap/widgets/strut_text.dart';
import 'package:SnipSnap/widgets/uppercase_title.dart';
import 'package:sprintf/sprintf.dart';
import 'package:SnipSnap/utils/list.dart';

class LocationReviews extends StatelessWidget {
  const LocationReviews({
    Key key,
    this.location,
    this.showLatest = 2,
  }) : super(key: key);

  final LocationModel location;
  final int showLatest;

  @override
  Widget build(BuildContext context) {
    if (location == null || location.reviews.isNullOrEmpty) {
      return Container();
    }

    List<ReviewModel> _reviews;

    if (showLatest >= location.reviews.length) {
      _reviews = location.reviews;
    } else {
      _reviews = location.reviews.sublist(0, showLatest);
    }

    return Container(
      padding: const EdgeInsets.only(
          left: kPaddingM, right: kPaddingM, bottom: kPaddingL),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          UppercaseTitle(title: L10n.of(context).locationTitleReviews),
          Padding(
            padding: const EdgeInsets.only(top: kPaddingM, bottom: kPaddingL),
            child: Row(
              children: <Widget>[
                Container(
                  padding: const EdgeInsetsDirectional.only(end: kPaddingS),
                  child: StarRating(
                    rating: location.rate,
                    size: 32,
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      StrutText(
                        location.rate.toString(),
                        style: Theme.of(context).textTheme.headline5.bold.fs28,
                      ),
                      StrutText(
                        sprintf('(%s)', <String>[
                          L10n.of(context)
                              .locationTotalReviews(location.ratings.toString())
                        ]),
                        style: Theme.of(context)
                            .textTheme
                            .subtitle1
                            .copyWith(color: Theme.of(context).disabledColor),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          ListView(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.all(0),
            children: _reviews
                .map((ReviewModel review) => ReviewListItem(review: review))
                .toList(),
          ),
          if (showLatest < location.reviews.length)
            Padding(
              padding: const EdgeInsets.only(top: kPaddingS),
              child: LinkText(
                text: L10n.of(context).locationLinkAllReviews,
                onTap: () => Navigator.pushNamed(
                    context, Routes.locationReviews,
                    arguments: location),
              ),
            )
        ],
      ),
    );
  }
}
