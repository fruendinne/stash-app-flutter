import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:latlong/latlong.dart';
import 'package:stash/components/widget_view/widget_view.dart';
import 'package:stash/screens/create/create.dart';
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
    return Stack(
      children: <Widget>[
        FlutterMap(
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
              lineColor: Colors.grey[600],
              textColor: Colors.transparent,
              lineWidth: 1,
              textBackgroundColor: Colors.transparent,
              showCardinalDirections: false,
              showCardinalDirectionsAsPrefix: false,
              textSize: 12.0,
              showLabels: true,
              rotateLonLabels: true,
              placeLabelsOnLines: true,
              offsetLonTextBottom: 20.0,
              offsetLatTextLeft: 20.0,
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 36.0),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: MaterialButton(
                minWidth: 250,
                height: 50,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18),
                ),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => CreateScreen()));
                },
                color: Colors.blue,
                child: Text(
                  "Drop Stash!",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                )),
          ),
        )
      ],
    );
  }
}
