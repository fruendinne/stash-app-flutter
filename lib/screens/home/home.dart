import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:stash/components/widget_view/widget_view.dart';
import 'package:stash/models/slippy_map_coordinates.dart';
import 'package:stash/models/stash_model.dart';
import 'package:stash/screens/home/home_controller.dart';
import 'package:stash/screens/stash_detail/stash_detail.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  final StashModel stash = StashModel(
    id: 0,
    coordinates: SlippyMapCoordinates.fromRadians(
        47.5035429, 7.9933735, SlippyMapCoordinates.DEFAULT_ZOOM_LEVEL),
    linkUrl:
        'https://open.spotify.com/track/78jIj6Ph2364zg1ZVIvbIN?si=9rQysmuLThSoeKoKnc-y1g',
    body: 'I am having a wonderful time here in Frick, look at that dick',
    imageUrl:
        'https://images.unsplash.com/photo-1528825950832-560a4a11473a?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1900&q=80',
  );

  @override
  HomeScreenController createState() => HomeScreenController();
}

class HomeScreenView extends WidgetView<HomeScreen, HomeScreenController> {
  HomeScreenView(HomeScreenController state) : super(state);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          RaisedButton(
              child: Text("Open Stash"),
              onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => StashDetailScreen(
                        stash: widget.stash,
                      ))))
        ],
      ),
    );
  }
}
