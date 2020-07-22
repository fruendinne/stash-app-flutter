import 'package:flutter/widgets.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';
import 'package:stash/services/location.dart';
import 'package:user_location/user_location.dart';

import 'map.dart';

class MapScreenController extends State<MapScreen> {
  MapController mapController = MapController();
  UserLocationOptions userLocationOptions;
  List<Marker> markers = [];

  @override
  void initState() {
    userLocationOptions = UserLocationOptions(
      context: context,
      mapController: mapController,
      markers: markers,
      updateMapLocationOnPositionChange: false,
      showHeading: true,
      showMoveToCurrentLocationFloatingActionButton: true,
      defaultZoom: 18,
      fabBottom: 80,
      onLocationUpdate: _onLocationUpdate,
    );
    super.initState();
  }

  _onLocationUpdate(LatLng latlon) {
    LocationService.instance.lastPosition = latlon;
    // debugPrint(LocationService.instance.lastPosition.toString());
  }

  @override
  Widget build(BuildContext context) => MapScreenView(this);
}
