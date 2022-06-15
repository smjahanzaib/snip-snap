import 'package:flutter/material.dart';
import 'package:SnipSnap/configs/constants.dart';
import 'package:SnipSnap/data/models/location_model.dart';
import 'package:SnipSnap/generated/l10n.dart';
import 'package:SnipSnap/widgets/locations_carousel.dart';

class LocationsNearby extends StatelessWidget {
  const LocationsNearby({Key key, this.nearbyLocations}) : super(key: key);

  final List<LocationModel> nearbyLocations;

  @override
  Widget build(BuildContext context) {
    if (nearbyLocations == null || nearbyLocations.isEmpty) {
      return Container();
    }

    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      padding: const EdgeInsets.only(bottom: kPaddingL),
      child: LocationsCarousel(
        locations: nearbyLocations,
        title: L10n.of(context).locationTitleNearby,
      ),
    );
  }
}
