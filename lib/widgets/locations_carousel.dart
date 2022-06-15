import 'package:flutter/material.dart';
import 'package:SnipSnap/configs/constants.dart';
import 'package:SnipSnap/data/models/location_model.dart';
import 'package:SnipSnap/widgets/bold_title.dart';
import 'package:SnipSnap/widgets/location_list_item.dart';
import 'package:SnipSnap/widgets/shimmer_box.dart';

/// Carousel style widget for vertical listing of locations.
class LocationsCarousel extends StatefulWidget {
  const LocationsCarousel({
    Key key,
    this.title,
    this.locations,
    this.onNavigate,
  }) : super(key: key);

  final String title;
  final List<LocationModel> locations;
  final VoidCallback onNavigate;

  @override
  _LocationsCarouselState createState() => _LocationsCarouselState();
}

class _LocationsCarouselState extends State<LocationsCarousel> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 342,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          BoldTitle(
            title: widget.title,
            onNavigate: widget.onNavigate,
          ),
          Container(
            height: 250,
            child: widget.locations != null
                ? ListView(
                    padding: const EdgeInsetsDirectional.only(start: kPaddingM),
                    scrollDirection: Axis.horizontal,
                    children: widget.locations.map((LocationModel location) {
                      return Container(
                        width: 340,
                        padding:
                            const EdgeInsetsDirectional.only(end: kPaddingS),
                        margin:
                            const EdgeInsets.only(bottom: 1), // For card shadow
                        child: LocationListItem(
                          location: location,
                          viewType: LocationListItemViewType.map,
                          showDistance: false,
                        ),
                      );
                    }).toList(),
                  )
                : ListView.builder(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsetsDirectional.only(start: kPaddingM),
                    itemBuilder: (BuildContext context, int index) =>
                        const ShimmerBox(width: 340, height: 250),
                    itemCount:
                        List<int>.generate(2, (int index) => index).length,
                  ),
          ),
        ],
      ),
    );
  }
}
