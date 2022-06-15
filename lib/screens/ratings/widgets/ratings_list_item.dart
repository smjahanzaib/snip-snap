import 'package:flutter/material.dart';
import 'package:SnipSnap/configs/constants.dart';
import 'package:SnipSnap/configs/routes.dart';
import 'package:SnipSnap/data/models/review_model.dart';
import 'package:SnipSnap/widgets/list_item.dart';
import 'package:SnipSnap/widgets/star_rating.dart';
import 'package:SnipSnap/widgets/strut_text.dart';
import 'package:sprintf/sprintf.dart';
import 'package:SnipSnap/utils/text_style.dart';
import 'package:SnipSnap/utils/datetime.dart';

class RatingsListItem extends StatelessWidget {
  const RatingsListItem({
    Key key,
    this.review,
  }) : super(key: key);

  final ReviewModel review;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(kBoxDecorationRadius),
      ),
      margin: const EdgeInsets.symmetric(
          horizontal: kPaddingM, vertical: kPaddingS),
      elevation: 1,
      child: Padding(
        padding: const EdgeInsets.all(kPaddingM),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(bottom: kPaddingS),
              child: StrutText(
                review.reviewDate.toLocalDateString,
                style: Theme.of(context)
                    .textTheme
                    .bodyText1
                    .copyWith(color: Theme.of(context).hintColor),
              ),
            ),
            ListItem(
              title: review.location.name,
              titleTextStyle: Theme.of(context).textTheme.headline6,
              subtitle: sprintf('%s\n%s',
                  <String>[review.location.address, review.location.city]),
              leading: Padding(
                padding: const EdgeInsetsDirectional.only(end: kPaddingS),
                child: Container(
                  width: 64,
                  height: 64,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: const BorderRadius.all(
                        Radius.circular(kFormFieldsRadius)),
                    image: DecorationImage(
                      image: AssetImage(review.location.mainPhoto),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              showBorder: false,
              onPressed: () => Navigator.pushNamed(context, Routes.location,
                  arguments: review.location.id),
            ),
            Padding(
              padding: const EdgeInsets.only(top: kPaddingS),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    padding: const EdgeInsetsDirectional.only(end: kPaddingS),
                    child: StarRating(
                      rating: review.rate,
                      size: 44,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: kPaddingM),
              child: StrutText(
                review.comment,
                style: Theme.of(context).textTheme.subtitle1.h15.w300,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
