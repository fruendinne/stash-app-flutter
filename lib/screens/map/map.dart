import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:latlong/latlong.dart';
import 'package:stash/components/widget_view/widget_view.dart';
import 'package:stash/models/slippy_map_coordinates.dart';
import 'package:stash/models/stash_model.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:stash/screens/map/map_controller.dart';
import 'package:stash/screens/map/plugin/stash_grid_plugin.dart';
import 'package:stash/services/location.dart';
import 'package:user_location/user_location.dart';

class MapScreen extends StatefulWidget {
  MapScreen({Key key}) : super(key: key);

  @override
  MapScreenController createState() => MapScreenController();
}

class MapScreenView extends WidgetView<MapScreen, MapScreenController> {
  MapScreenView(MapScreenController state) : super(state);

  final List<StashModel> stashes = <StashModel>[
    StashModel(
      id: 0,
      coordinates: SlippyMapCoordinates.fromRadians(
          47.3205082, 7.918265, SlippyMapCoordinates.DEFAULT_ZOOM_LEVEL),
      color: Colors.pink,
    ),
    StashModel(
      id: 0,
      coordinates: SlippyMapCoordinates.fromRadians(
          47.32056, 7.918265, SlippyMapCoordinates.DEFAULT_ZOOM_LEVEL),
      color: Colors.yellow,
    ),
    StashModel(
      id: 0,
      coordinates: SlippyMapCoordinates.fromRadians(
          47.32056, 7.91835, SlippyMapCoordinates.DEFAULT_ZOOM_LEVEL),
      color: Colors.green,
    ),
    StashModel(
      id: 0,
      coordinates: SlippyMapCoordinates.fromRadians(
          47.320510, 7.920450, SlippyMapCoordinates.DEFAULT_ZOOM_LEVEL),
      color: Colors.blue,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    UserLocationOptions userLocationOptions = UserLocationOptions(
      context: context,
      mapController: state.mapController,
      markers: state.markers,
      updateMapLocationOnPositionChange: false,
      showHeading: true,
      showMoveToCurrentLocationFloatingActionButton: true,
      defaultZoom: 18,
      fabBottom: 80,
      onTapFAB: () {},
      onLocationUpdate: state.onLocationUpdate,
    );
    return Stack(
      children: <Widget>[
        FlutterMap(
          mapController: state.mapController,
          options: new MapOptions(
            center: new LatLng(47.3205082, 7.918265),
            zoom: 17.0,
            plugins: [
              MapPluginStashGrid(),
              UserLocationPlugin(),
            ],
          ),
          layers: [
            new TileLayerOptions(
              urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
              subdomains: ['a', 'b', 'c'],
            ),
            MapPluginStashGridOptions(
              stashes: stashes,
            ),
            MarkerLayerOptions(markers: state.markers),
            userLocationOptions,
          ],
        ),
      ],
    );
  }
}
