import 'dart:async';

import 'package:flutter/material.dart';
import 'package:SnipSnap/configs/app_globals.dart';
import 'package:SnipSnap/configs/constants.dart';
import 'package:SnipSnap/configs/routes.dart';
import 'package:SnipSnap/data/models/location_model.dart';
import 'package:SnipSnap/data/repositories/location_repository.dart';
import 'package:SnipSnap/generated/l10n.dart';
import 'package:SnipSnap/main.dart';
import 'package:SnipSnap/screens/location/widgets/widgets.dart';
import 'package:SnipSnap/widgets/app_button.dart';
import 'package:SnipSnap/widgets/sliver_app_title.dart';
import 'package:SnipSnap/utils/text_style.dart';
import 'package:SnipSnap/widgets/strut_text.dart';
import 'package:share/share.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({
    Key key,
    this.locationId = 0,
  }) : super(key: key);

  final int locationId;

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  final LocationRepository locationRepository = const LocationRepository();

  /// The GlobalKey needed to access Scaffold widget.
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  LocationModel _location;

  bool _isFavorited = false;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    /// Load location data.
    _location = await locationRepository.getLocation(id: widget.locationId);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    if (widget.locationId > 0) {
      return Scaffold(
        key: _scaffoldKey,
        backgroundColor: Theme.of(context).cardColor,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: CustomScrollView(
                scrollDirection: Axis.vertical,
                slivers: <Widget>[
                  SliverAppBar(
                    expandedHeight: 200.0,
                    pinned: true,
                    actions: _location != null
                        ? <Widget>[
                            IconButton(
                              icon: const Icon(Icons.share),
                              onPressed: () => Share.share(_location.website,
                                  subject: _location.name),
                            ),
                            IconButton(
                              icon: Icon(_isFavorited
                                  ? Icons.favorite
                                  : Icons.favorite_border),
                              onPressed: () {
                                setState(() => _isFavorited = !_isFavorited);
                                _scaffoldKey.currentState.showSnackBar(SnackBar(
                                  content: Text(_isFavorited
                                      ? L10n.of(context).commonLocationFavorited
                                      : L10n.of(context)
                                          .commonLocationUnfavorited),
                                  duration: const Duration(
                                      milliseconds: kSnackBarDurationShort),
                                ));
                              }, //_onLocation,
                            ),
                          ]
                        : null,
                    flexibleSpace: FlexibleSpaceBar(
                      collapseMode: CollapseMode.parallax,
                      background: LocationHeader(location: _location),
                    ),
                    title: _location != null
                        ? SliverAppTitle(child: Text(_location.name))
                        : Container(),
                  ),
                  SliverToBoxAdapter(
                    child: SafeArea(
                      top: false,
                      bottom: false,
                      child: Padding(
                        padding: const EdgeInsets.only(top: kPaddingM),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            LocationInfo(location: _location),
                            LocationMapPreview(
                                coordinates: _location != null
                                    ? _location.coordinates
                                    : null),
                            LocationDescription(
                                description: _location != null
                                    ? _location.description
                                    : null),
                            LocationStaff(location: _location),
                            LocationServices(location: _location),
                            LocationReviews(location: _location),
                            LocationsNearby(
                                nearbyLocations: _location != null
                                    ? _location.nearbyLocations
                                    : null)
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            _bottomBar(),
          ],
        ),
      );
    } else
      return Container();
  }

  Widget _bottomBar() {
    if (_location == null) {
      return Container();
    }

    return Container(
      decoration: BoxDecoration(
        color: getIt.get<AppGlobals>().isPlatformBrightnessDark
            ? Theme.of(context).scaffoldBackgroundColor
            : Theme.of(context).cardColor,
        border: Border(
          top: BorderSide(
            width: 2,
            color: Theme.of(context).dividerColor,
          ),
        ),
      ),
      padding: const EdgeInsets.all(kPaddingM),
      child: SafeArea(
        top: false,
        child: Row(
          children: <Widget>[
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  StrutText(
                    L10n.of(context)
                        .locationAvailableServies(_location.getServiceCount),
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                  const Padding(padding: EdgeInsets.only(top: 4)),
                  StrutText(
                    L10n.of(context).locationInstantConfirmation,
                    style: Theme.of(context).textTheme.subtitle1.bold,
                  ),
                ],
              ),
            ),
            AppButton(
              text: L10n.of(context).locationBtnBook,
              onPressed: () => Navigator.pushNamed(context, Routes.booking,
                  arguments: <String, dynamic>{'locationId': _location.id}),
            ),
          ],
        ),
      ),
    );
  }
}
