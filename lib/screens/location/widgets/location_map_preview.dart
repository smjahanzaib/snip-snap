import 'dart:async';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:SnipSnap/configs/constants.dart';
import 'package:SnipSnap/utils/async.dart';
import 'package:SnipSnap/utils/geo.dart';
import 'package:shimmer/shimmer.dart';

class LocationMapPreview extends StatefulWidget {
  const LocationMapPreview({
    Key key,
    this.coordinates,
  }) : super(key: key);

  final GeoPoint coordinates;

  @override
  _LocationMapPreviewState createState() => _LocationMapPreviewState();
}

class _LocationMapPreviewState extends State<LocationMapPreview> {
  final Completer<GoogleMapController> _mapController =
      Completer<GoogleMapController>();
  final Set<Marker> _markers = <Marker>{};

  Uint8List _pinLocationIcon;

  @override
  void initState() {
    super.initState();
    _loadPinIcon();
  }

  /// Load custom map pin.
  Future<void> _loadPinIcon() async {
    _pinLocationIcon = await Async.loadCustomMapPin(width: 56);
  }

  @override
  Widget build(BuildContext context) {
    if (widget.coordinates == null) {
      return Shimmer.fromColors(
        baseColor: Theme.of(context).hoverColor,
        highlightColor: Theme.of(context).dividerColor,
        enabled: true,
        child: Container(
          margin: const EdgeInsets.only(top: kPaddingM),
          height: 160,
          color: kWhite,
        ),
      );
    }

    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      height: 160,
      margin: const EdgeInsets.only(top: kPaddingL),
      child: Stack(
        alignment: AlignmentDirectional.bottomEnd,
        children: <Widget>[
          GoogleMap(
            onMapCreated: (GoogleMapController controller) {
              _mapController.complete(controller);
              setState(() {
                final MarkerId markerId =
                    MarkerId(widget.coordinates.toString());
                _markers.add(Marker(
                  markerId: markerId,
                  position: LatLng(widget.coordinates.latitude,
                      widget.coordinates.longitude),
                  icon: BitmapDescriptor.fromBytes(_pinLocationIcon),
                  //infoWindow: InfoWindow(title: _location.name),
                ));
              });
            },
            markers: _markers,
            mapType: MapType.normal,
            initialCameraPosition: CameraPosition(
              target: LatLng(
                widget.coordinates.latitude,
                widget.coordinates.longitude,
              ),
              zoom: 16,
              //bearing: 30,
            ),
            myLocationEnabled: true,
            myLocationButtonEnabled: false,
            zoomControlsEnabled: true,
            zoomGesturesEnabled: true,
          ),
          Container(
            margin: const EdgeInsetsDirectional.only(
                end: kPaddingM, bottom: kPaddingS),
            decoration: ShapeDecoration(
              color: Theme.of(context).accentColor,
              shape: const CircleBorder(),
              shadows: <BoxShadow>[
                BoxShadow(
                  color: Theme.of(context).highlightColor,
                  blurRadius: 3,
                  spreadRadius: 1,
                  offset: const Offset(0, 1.5),
                )
              ],
            ),
            child: IconButton(
              icon: const Icon(Icons.near_me),
              color: kWhite,
              onPressed: () => Async.launchUrl(
                  'https://www.google.com/maps/dir//${widget.coordinates.latitude},${widget.coordinates.longitude}'),
            ),
          ),
        ],
      ),
    );
  }
}
