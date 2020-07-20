import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:latlong/latlong.dart';
import 'package:stash/components/widget_view/widget_view.dart';
import 'package:stash/screens/home/home_controller.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:stash/screens/home/plugin/grid_plugin.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  HomeScreenController createState() => HomeScreenController();
}

class HomeScreenView extends WidgetView<HomeScreen, HomeScreenController> {
  HomeScreenView(HomeScreenController state) : super(state);

  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      options: new MapOptions(
        center: new LatLng(47.5, 7.6),
        zoom: 13.0,
        plugins: [
          MapPluginLatLonGrid(),
        ],
      ),
      layers: [
        new TileLayerOptions(
          urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
          subdomains: ['a', 'b', 'c'],
        ),
        MapPluginLatLonGridOptions(
          lineColor: Colors.black,
          textColor: Colors.white,
          lineWidth: 0.5,
          textBackgroundColor: Colors.black,
          showCardinalDirections: true,
          showCardinalDirectionsAsPrefix: false,
          textSize: 12.0,
          showLabels: false,
          rotateLonLabels: true,
          placeLabelsOnLines: true,
          offsetLonTextBottom: 20.0,
          offsetLatTextLeft: 20.0,
        ),
      ],
    );
  }
}
