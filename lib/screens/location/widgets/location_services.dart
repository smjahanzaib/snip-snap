import 'package:flutter/material.dart';
import 'package:SnipSnap/configs/constants.dart';
import 'package:SnipSnap/configs/routes.dart';
import 'package:SnipSnap/data/models/location_model.dart';
import 'package:SnipSnap/data/models/service_model.dart';
import 'package:SnipSnap/generated/l10n.dart';
import 'package:SnipSnap/widgets/link_text.dart';
import 'package:SnipSnap/widgets/list_item.dart';
import 'package:SnipSnap/widgets/strut_text.dart';
import 'package:SnipSnap/widgets/uppercase_title.dart';
import 'package:SnipSnap/utils/text_style.dart';
import 'package:sprintf/sprintf.dart';
import 'package:SnipSnap/utils/list.dart';

class LocationServices extends StatelessWidget {
  const LocationServices({
    Key key,
    this.location,
    this.limit = 3,
  }) : super(key: key);

  final LocationModel location;
  final int limit;

  @override
  Widget build(BuildContext context) {
    if (location == null || location.serviceGroups.isNullOrEmpty) {
      return Container();
    }

    List<ServiceModel> _services = location.serviceGroups.first.services;

    if (limit < _services.length) {
      _services = _services.sublist(0, limit);
    }

    return Container(
      padding: const EdgeInsets.only(
          left: kPaddingM, right: kPaddingM, bottom: kPaddingM),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          UppercaseTitle(title: L10n.of(context).locationTitleTopServices),
          ListView(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.only(top: kPaddingS),
            children: _services.map((ServiceModel service) {
              return ListItem(
                title: service.name,
                titleTextStyle: Theme.of(context).textTheme.subtitle1.fs18.w500,
                subtitle: service.description,
                subtitleTextStyle: Theme.of(context)
                    .textTheme
                    .bodyText1
                    .w300
                    .copyWith(color: Theme.of(context).hintColor),
                trailing: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    StrutText(
                      L10n.of(context).commonCurrencyFormat(
                          sprintf('%.2f', <double>[service.price])),
                      style: Theme.of(context).textTheme.subtitle1.fs18.w500,
                    ),
                    StrutText(
                      L10n.of(context)
                          .commonDurationFormat(service.duration.toString()),
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1
                          .w300
                          .copyWith(color: Theme.of(context).hintColor),
                    ),
                  ],
                ),
                onPressed: () => Navigator.pushNamed(context, Routes.booking,
                    arguments: <String, dynamic>{
                      'locationId': location.id,
                      'preselectedService': service
                    }),
              );
            }).toList(),
          ),
          if (limit < location.serviceGroups.first.services.length)
            Padding(
              padding: const EdgeInsets.only(top: kPaddingL),
              child: LinkText(
                text: L10n.of(context).locationLinkAllServices,
                onTap: () => Navigator.pushNamed(context, Routes.booking,
                    arguments: <String, dynamic>{'locationId': location.id}),
              ),
            )
        ],
      ),
    );
  }
}
