import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:latlong/latlong.dart';
import 'package:stash/components/widget_view/widget_view.dart';
import 'package:stash/models/slippy_map_coordinates.dart';
import 'package:stash/models/stash_model.dart';
import 'package:stash/screens/create/create.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:stash/screens/map/components/draggable_stash_view.dart';
import 'package:stash/screens/map/map_controller.dart';
import 'package:stash/screens/map/plugin/stash_grid_plugin.dart';
import 'package:stash/themes/style.dart';

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
    return Stack(
      children: <Widget>[
        FlutterMap(
          options: new MapOptions(
            center: new LatLng(47.3205082, 7.918265),
            zoom: 13.0,
            plugins: [
              MapPluginStashGrid(),
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
          ],
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 40, 20, 0),
          child: Align(
              alignment: Alignment.topRight,
              child: IconButton(
                  icon: Icon(Icons.swap_vertical_circle, size: 50),
                  onPressed: () {
                    state.switchMode();
                  })),
        ),
        Visibility(
          visible: !state.showStashView,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 18.0),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: MaterialButton(
                  minWidth: 250,
                  height: 50,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => CreateScreen()));
                  },
                  color: CustomColors.primary900,
                  child: Text(
                    "DROP A STASH HERE",
                    style: Theme.of(context).textTheme.button,
                  )),
            ),
          ),
        ),
        Visibility(visible: state.showStashView, child: DraggableStashView())
      ],
    );
  }
}
