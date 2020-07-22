import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:stash/components/widget_view/widget_view.dart';
import 'package:stash/screens/components/logo.dart';
import 'package:stash/screens/create/create.dart';
import 'package:stash/screens/details/details.dart';
import 'package:stash/screens/home/components/stash_panel_collapsed_header.dart';
import 'package:stash/screens/home/home_controller.dart';
import 'package:stash/screens/map/map.dart';

import '../../themes/style.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  HomeScreenController createState() => HomeScreenController();
}

class HomeScreenView extends WidgetView<HomeScreen, HomeScreenController> {
  HomeScreenView(HomeScreenController state) : super(state);

  BorderRadiusGeometry _panelRadius = BorderRadius.only(
    topLeft: Radius.circular(16.0),
    topRight: Radius.circular(16.0),
  );

  double _panelHeightClosed = 56.0;
  double _panelHeightOpen;

  Widget _buildPanel(BuildContext context) {
    if (state.currentStash != null) {
      return DetailsScreen(
        stash: state.currentStash,
      );
    } else {
      return CreateScreen();
    }
  }

  Widget _buildCollapsed(BuildContext context) {
    if (state.currentStash != null) {
      return StashPanelCollapsedHeader(
        text: "open stash",
        appendLeft: Icon(Icons.flag),
        appendRight: Icon(Icons.add),
        backgroundColor: state.currentStash.color,
        borderRadius: _panelRadius,
        onTap: state.onPanelTap,
      );
    } else {
      return StashPanelCollapsedHeader(
        text: "drop a stash",
        appendLeft: Icon(Icons.flag),
        appendRight: Icon(Icons.add),
        backgroundColor: Colors.grey[300],
        borderRadius: _panelRadius,
        onTap: state.onPanelTap,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    _panelHeightOpen = MediaQuery.of(context).size.height - 48;

    return Scaffold(
        body: Stack(
      children: <Widget>[
        MapScreen(),
        Positioned(
          top: 24.0,
          left: 16.0,
          child: GestureDetector(
            onTap: state.onMapTap,
            child: Logo(
              color: CustomColors.textOnSurfaceHighEmphasis,
              dropShadow: true,
            ),
          ),
        ),
        SlidingUpPanel(
          controller: state.panelController,
          panel: _buildPanel(context),
          collapsed: _buildCollapsed(context),
          minHeight: _panelHeightClosed,
          maxHeight: _panelHeightOpen,
          borderRadius: _panelRadius,
          margin: const EdgeInsets.symmetric(horizontal: 8.0),
        ),
      ],
    ));
  }
}
