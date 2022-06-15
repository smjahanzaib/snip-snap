import 'dart:async';
import 'dart:math';
import 'dart:typed_data';

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:SnipSnap/blocs/search/search_bloc.dart';
import 'package:SnipSnap/configs/constants.dart';
import 'package:SnipSnap/data/models/location_model.dart';
import 'package:SnipSnap/data/models/search_session_model.dart';
import 'package:SnipSnap/generated/l10n.dart';
import 'package:SnipSnap/utils/async.dart';
import 'package:SnipSnap/utils/geo.dart';
import 'package:SnipSnap/widgets/location_list_item.dart';

class SearchMapScreen extends StatefulWidget {
  const SearchMapScreen({Key key, this.params}) : super(key: key);

  final Map<String, dynamic> params;
  @override
  _SearchMapScreenState createState() {
    return _SearchMapScreenState();
  }
}

class _SearchMapScreenState extends State<SearchMapScreen> {
  SearchBloc _searchBloc;
  List<LocationModel> _locations;
  CameraPosition _initialCameraPosition;
  int _indexLocation = 0;
  Uint8List _pinLocationIcon;
  //LocationData _currentPosition;
  int _selectedSlide = -1;
  LatLngBounds _currentRegion;
  bool _isLoading = false;
  bool _isMapInited = false;

  final Completer<GoogleMapController> _mapController =
      Completer<GoogleMapController>();
  final Set<Marker> _markers = <Marker>{};
  final SwiperController _swiperController = SwiperController();
  final Location _locationService = Location();

  @override
  void initState() {
    super.initState();

    _locations = widget.params['locations'] as List<LocationModel>;

    _searchBloc = BlocProvider.of<SearchBloc>(context);

    /// LocationAccuracy.powerSave may cause infinite loops on Android
    /// while calling getLocation()
    _locationService.changeSettings(accuracy: LocationAccuracy.low);

    _loadData();

    if (_locations != null) {
      _currentRegion = _getBounds();
      final double zoomLevel = _getZoomLevel(_currentRegion);

      _initialCameraPosition = CameraPosition(
        target: LatLng(
          (_currentRegion.southwest.latitude +
                  _currentRegion.northeast.latitude) /
              2,
          (_currentRegion.southwest.longitude +
                  _currentRegion.northeast.longitude) /
              2,
        ),
        zoom: zoomLevel,
        bearing: 30,
      );
    } else {
      _initialCameraPosition = const CameraPosition(
        target: LatLng(kDefaultLat, kDefaultLon),
        zoom: 13,
        bearing: 30,
      );
    }
  }

  Future<void> _loadData() async {
    _pinLocationIcon = await Async.loadCustomMapPin();
  }

  LatLngBounds _getBounds() {
    final List<double> lngs = _locations
        .map<double>((LocationModel m) => m.coordinates.longitude)
        .toList();
    final List<double> lats = _locations
        .map<double>((LocationModel m) => m.coordinates.latitude)
        .toList();

    final double topMost = lngs.reduce(max);
    final double leftMost = lats.reduce(min);
    final double rightMost = lats.reduce(max);
    final double bottomMost = lngs.reduce(min);

    final LatLngBounds bounds = LatLngBounds(
      northeast: LatLng(rightMost, topMost),
      southwest: LatLng(leftMost, bottomMost),
    );

    return bounds;
  }

  double _getZoomLevel(LatLngBounds bounds) {
    final double latMax =
        max(bounds.southwest.latitude, bounds.northeast.latitude);
    final double latMin =
        min(bounds.southwest.latitude, bounds.northeast.latitude);
    final double lngMax =
        max(bounds.southwest.longitude, bounds.northeast.longitude);
    final double lngMin =
        min(bounds.southwest.longitude, bounds.northeast.longitude);
    final double latDiff = latMax - latMin;
    final double lngDiff = lngMax - lngMin;
    final double maxDiff = (lngDiff > latDiff) ? lngDiff : latDiff;
    double zoomLevel;

    if (maxDiff < 360 / pow(2, 20)) {
      zoomLevel = 21;
    } else {
      /// The reason for log_2 being used is that a Google map doubles in size
      /// every time the zoom level increases by 1. It also handles the edge
      /// cases where the points are almost coincident with each other
      /// (zoomLevel = 21), and where the entire globe is the desired zoom
      /// (zoomLevel = 1).
      zoomLevel = -1 * ((log(maxDiff) / log(2)) - (log(360) / log(2)));
      if (zoomLevel < 1) {
        zoomLevel = 1;
      }
    }

    return zoomLevel;
  }

  void _setMarkers() {
    _markers.clear();
    for (final LocationModel item in _locations) {
      final MarkerId markerId = MarkerId(item.id.toString());
      final Marker marker = Marker(
        markerId: markerId,
        position: LatLng(item.coordinates.latitude, item.coordinates.longitude),
        icon: BitmapDescriptor.fromBytes(_pinLocationIcon),
        infoWindow: InfoWindow(title: item.name),
        onTap: () {
          final int index =
              _locations.indexWhere((LocationModel i) => i.id == item.id);
          if (index != -1) {
            if (_selectedSlide == -1) {
              setState(() => _selectedSlide = index);
            } else {
              _selectedSlide = index;
            }
            _swiperController.move(index);
          }
        },
        //consumeTapEvents: true,
      );
      _markers.add(marker);
    }
  }

  Widget _locationPreviewBox(LocationModel location, int index) {
    return Opacity(
      opacity: _selectedSlide == index ? 1 : 0.5,
      child: Container(
        margin: const EdgeInsets.only(top: 5, bottom: 5),
        decoration: BoxDecoration(
          //color: Theme.of(context).scaffoldBackgroundColor,
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Theme.of(context).highlightColor,
              blurRadius: 3,
              spreadRadius: 1,
              offset: const Offset(0, 1.5),
            )
          ],
        ),
        child: LocationListItem(
          location: location,
          viewType: LocationListItemViewType.map,
        ),
      ),
    );
  }

  Future<void> _onSwiperIndexChange(int index) async {
    _selectedSlide = index;
    setState(() => _indexLocation = index);

    final GoogleMapController controller = await _mapController.future;

    ///Camera animated
    controller.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          bearing: 30.0,
          target: LatLng(
            _locations[_indexLocation].coordinates.latitude,
            _locations[_indexLocation].coordinates.longitude,
          ),
          tilt: 30.0,
          zoom: 15.0,
        ),
      ),
    );
  }

  Future<void> _reloadLocations() async {
    if (_isLoading) {
      return;
    }
    _isLoading = true;

    _searchBloc.add(MapSearchEvent(
      GeoBoundingBox(
        swCorner: GeoPoint(
            latitude: _currentRegion.southwest.latitude,
            longitude: _currentRegion.southwest.longitude),
        neCorner: GeoPoint(
            latitude: _currentRegion.northeast.latitude,
            longitude: _currentRegion.northeast.longitude),
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
        floatingActionButton: Container(
          //padding: const EdgeInsets.only(top: kPaddingM),
          child: FloatingActionButton(
            tooltip: L10n.of(context).searchTooltipBack,
            elevation: 3,
            onPressed: () => Navigator.pop(context),
            child: const Icon(
              Icons.arrow_back,
              color: kPrimaryColor,
            ),
            backgroundColor: kWhite,
            mini: true,
          ),
        ),
        body: BlocBuilder<SearchBloc, SearchState>(
            builder: (BuildContext context, SearchState state) {
          if (state is RefreshSuccessSearchState &&
              state.session.searchType == SearchType.map &&
              _isLoading) {
            _locations = state.session.locations;
            _isLoading = false;

            _setMarkers();
          }
          return Stack(
            alignment: AlignmentDirectional.bottomCenter,
            children: <Widget>[
              GoogleMap(
                onMapCreated: (GoogleMapController controller) {
                  _mapController.complete(controller);
                  setState(() => _setMarkers());
                },
                onCameraIdle: () async {
                  final GoogleMapController controller =
                      await _mapController.future;
                  _currentRegion = await controller.getVisibleRegion();

                  /// prevent locations reloading after the initial 'onCameraIdle' call
                  if (!_isMapInited) {
                    _isMapInited = true;
                    return;
                  }

                  if (_selectedSlide == -1) {
                    _reloadLocations();
                  }
                },
                onTap: (LatLng tapLocation) =>
                    setState(() => _selectedSlide = -1),
                markers: _markers,
                mapType: MapType.normal,
                initialCameraPosition: _initialCameraPosition,
                myLocationEnabled: true,
                myLocationButtonEnabled: false,
                zoomControlsEnabled: true,
                zoomGesturesEnabled: true,
              ),
              Visibility(
                visible: _selectedSlide != -1,
                child: SafeArea(
                  bottom: true,
                  top: false,
                  child: Container(
                    height: 260,
                    margin: const EdgeInsets.only(bottom: 10),
                    child: Swiper(
                      itemBuilder: (BuildContext context, int index) =>
                          _locationPreviewBox(_locations[index], index),
                      onIndexChanged: (int index) =>
                          _onSwiperIndexChange(index),
                      controller: _swiperController,
                      itemCount: _locations.length,
                      viewportFraction: 0.8,
                      scale: 0.85,
                      loop: _locations.length > 1,
                      index: _selectedSlide,
                    ),
                  ),
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
