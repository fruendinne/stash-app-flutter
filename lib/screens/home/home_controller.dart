import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:stash/models/slippy_map_coordinates.dart';
import 'package:stash/models/stash_model.dart';

import 'home.dart';

class HomeScreenController extends State<HomeScreen> {
  final PanelController panelController = PanelController();

  bool showStash = true;

  StashModel get currentStash => showStash ? StashModel(
    id: 0,
    coordinates: SlippyMapCoordinates.fromRadians(47.3205082, 7.918265, SlippyMapCoordinates.DEFAULT_ZOOM_LEVEL),
    color: Colors.yellow[600],
    body: "Hello",
    linkUrl: "",
    viewCount: 1,
    imageUrl: "https://images.unsplash.com/photo-1508166785545-c2dd4c113c66?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1950&q=80"
  ) : null;

  @override
  void initState() {
    super.initState();
  }

  void onPanelTap() {
    panelController.open();
  }

  void onMapTap() {
    showStash = !showStash;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) => HomeScreenView(this);
}
