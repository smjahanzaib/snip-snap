import 'package:flutter/material.dart';
import 'package:SnipSnap/configs/constants.dart';
import 'package:SnipSnap/configs/routes.dart';
import 'package:SnipSnap/data/models/location_model.dart';
import 'package:SnipSnap/generated/l10n.dart';
import 'package:SnipSnap/utils/text_style.dart';
import 'package:SnipSnap/utils/string.dart';
import 'package:SnipSnap/widgets/strut_text.dart';
import 'package:sprintf/sprintf.dart';

enum LocationListItemViewType { search, list, grid, block, map }

class LocationListItem extends StatelessWidget {
  const LocationListItem({
    Key key,
    this.location,
    this.viewType,
    this.wordToStyle = '',
    this.showDistance = true,
    this.showFavoriteButton = false,
    this.isFavorited = false,
    this.onFavoriteButtonPressed,
  }) : super(key: key);

  final LocationModel location;
  final LocationListItemViewType viewType;
  final String wordToStyle;
  final bool showDistance;
  final bool showFavoriteButton;
  final bool isFavorited;
  final VoidCallback onFavoriteButtonPressed;

  void _showLocationScreen(BuildContext context) {
    Navigator.pushNamed(context, Routes.location, arguments: location.id);
  }

  @override
  Widget build(BuildContext context) {
    switch (viewType) {
      case LocationListItemViewType.block:
      case LocationListItemViewType.map:
        return Card(
          elevation: 1,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(kBoxDecorationRadius),
          ),
          margin: EdgeInsets.zero,
          child: Container(
            height: 290,
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              borderRadius:
                  const BorderRadius.all(Radius.circular(kBoxDecorationRadius)),
            ),
            child: InkWell(
              onTap: () => _showLocationScreen(context),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Stack(
                    alignment: Alignment.topRight,
                    children: <Widget>[
                      Container(
                        height: viewType == LocationListItemViewType.map
                            ? 160
                            : 200,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(location.mainPhoto),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(kBoxDecorationRadius),
                            topRight: Radius.circular(kBoxDecorationRadius),
                          ),
                        ),
                      ),
                      if (showFavoriteButton)
                        IconButton(
                          icon: Icon(isFavorited
                              ? Icons.favorite
                              : Icons.favorite_border),
                          color: kPrimaryColor,
                          onPressed: onFavoriteButtonPressed ?? () {},
                        ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: kPaddingS,
                        right: kPaddingS,
                        top: kPaddingS,
                        bottom: kPaddingS / 2),
                    child: StrutText(
                      location.name,
                      maxLines: 1,
                      style: Theme.of(context).textTheme.subtitle1.fs18.w600,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: kPaddingS,
                        right: kPaddingS,
                        bottom: kPaddingS / 2),
                    child: StrutText(
                      sprintf(
                          '%s, %s', <String>[location.address, location.city]),
                      maxLines: 1,
                      style: Theme.of(context)
                          .textTheme
                          .subtitle1
                          .copyWith(color: Theme.of(context).hintColor),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  if (location.ratings > 0)
                    Padding(
                      padding: const EdgeInsetsDirectional.only(
                          start: kPaddingS, end: kPaddingS),
                      child: Row(
                        children: <Widget>[
                          const Padding(
                            padding: EdgeInsetsDirectional.only(end: 2),
                            child: Icon(
                              Icons.star,
                              size: 22,
                              color: kPrimaryColor,
                            ),
                          ),
                          Expanded(
                            child: Row(
                              children: <Widget>[
                                StrutText(
                                  location.rate.toString(),
                                  style: Theme.of(context)
                                      .textTheme
                                      .subtitle1
                                      .bold,
                                ),
                                const Padding(
                                    padding: EdgeInsetsDirectional.only(
                                        end: kPaddingS / 2)),
                                StrutText(
                                  sprintf('(%s)', <String>[
                                    L10n.of(context).locationTotalReviews(
                                        location.ratings.toString())
                                  ]),
                                  style: Theme.of(context)
                                      .textTheme
                                      .subtitle1
                                      .copyWith(
                                          color:
                                              Theme.of(context).disabledColor),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                ],
              ),
            ),
          ),
        );

      case LocationListItemViewType.grid:
        return Card(
          elevation: 1,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(kBoxDecorationRadius),
          ),
          margin: EdgeInsets.zero,
          child: Container(
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              borderRadius:
                  const BorderRadius.all(Radius.circular(kBoxDecorationRadius)),
            ),
            child: InkWell(
              onTap: () => _showLocationScreen(context),
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      height: 120,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(location.mainPhoto),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(kBoxDecorationRadius),
                          topRight: Radius.circular(kBoxDecorationRadius),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.only(
                          top: kPaddingS, start: kPaddingS, end: kPaddingS),
                      child: StrutText(
                        location.name,
                        maxLines: 1,
                        style: Theme.of(context).textTheme.bodyText2.bold,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.only(
                          start: kPaddingS, end: kPaddingS, top: 2),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: StrutText(
                              location.address,
                              maxLines: 1,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2
                                  .copyWith(color: Theme.of(context).hintColor),
                              overflow: TextOverflow.ellipsis,
                            ),
                          )
                        ],
                      ),
                    ),
                    if (location.ratings > 0)
                      Padding(
                        padding: const EdgeInsetsDirectional.only(
                            start: kPaddingS,
                            end: kPaddingS,
                            bottom: kPaddingS,
                            top: 2),
                        child: Row(
                          children: <Widget>[
                            const Padding(
                              padding: EdgeInsetsDirectional.only(end: 2),
                              child: Icon(
                                Icons.star,
                                size: 16,
                                color: kPrimaryColor,
                              ),
                            ),
                            StrutText(
                              location.rate.toString(),
                              style: Theme.of(context).textTheme.bodyText2.bold,
                            ),
                          ],
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),
        );
        break;

      case LocationListItemViewType.list:
        return Card(
          elevation: 1,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(kBoxDecorationRadius),
          ),
          margin: EdgeInsets.zero,
          child: Container(
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              borderRadius:
                  const BorderRadius.all(Radius.circular(kBoxDecorationRadius)),
            ),
            child: InkWell(
              onTap: () => _showLocationScreen(context),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    width: 96,
                    height: 96,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(location.mainPhoto),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: const BorderRadiusDirectional.only(
                        topStart: Radius.circular(kBoxDecorationRadius),
                        bottomStart: Radius.circular(kBoxDecorationRadius),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: kPaddingS,
                          bottom: kPaddingS,
                          left: kPaddingS,
                          right: kPaddingS),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          StrutText(
                            location.name,
                            maxLines: 1,
                            style: Theme.of(context).textTheme.subtitle1.w600,
                          ),
                          const Padding(padding: EdgeInsets.only(top: 2)),
                          StrutText(
                            sprintf('%s, %s',
                                <String>[location.address, location.city]),
                            maxLines: 1,
                            style: Theme.of(context)
                                .textTheme
                                .bodyText2
                                .copyWith(color: Theme.of(context).hintColor),
                          ),
                          if (location.ratings > 0)
                            Padding(
                              padding: const EdgeInsetsDirectional.only(
                                  top: 2, end: kPaddingS),
                              child: Row(
                                children: <Widget>[
                                  const Padding(
                                    padding: EdgeInsetsDirectional.only(end: 2),
                                    child: Icon(
                                      Icons.star,
                                      size: 18,
                                      color: kPrimaryColor,
                                    ),
                                  ),
                                  Expanded(
                                    child: Row(
                                      children: <Widget>[
                                        StrutText(
                                          location.rate.toString(),
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText2
                                              .bold,
                                        ),
                                        const Padding(
                                            padding: EdgeInsets.only(
                                                right: kPaddingS / 2)),
                                        StrutText(
                                          sprintf('(%s)', <String>[
                                            L10n.of(context)
                                                .locationTotalReviews(
                                                    location.ratings.toString())
                                          ]),
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText2
                                              .copyWith(
                                                  color: Theme.of(context)
                                                      .disabledColor),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
        break;

      case LocationListItemViewType.search:
        return InkWell(
          onTap: () => _showLocationScreen(context),
          child: Container(
            decoration: BoxDecoration(
              //color: Theme.of(context).cardColor,
              border: Border(
                bottom: BorderSide(
                  width: 1,
                  color: Theme.of(context).dividerColor,
                ),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsetsDirectional.only(end: kPaddingS),
                  child: Icon(
                    Icons.location_on,
                    color: Theme.of(context).disabledColor,
                    size: 36,
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: kPaddingM),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          if (wordToStyle.isEmpty)
                            StrutText(
                              location.name,
                              style: Theme.of(context).textTheme.subtitle1,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            )
                          else
                            RichText(
                              text: TextSpan(
                                style: Theme.of(context).textTheme.subtitle1,
                                children: location.name.getSpans(
                                  matchWord: wordToStyle,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          StrutText(
                            sprintf('%s, %s',
                                <String>[location.address, location.city]),
                            style: Theme.of(context)
                                .textTheme
                                .bodyText2
                                .copyWith(color: Theme.of(context).hintColor),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ]),
                  ),
                ),
              ],
            ),
          ),
        );
        break;

      default:
        return Container();
    }
  }
}
