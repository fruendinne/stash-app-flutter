import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:stash/components/widget_view/widget_view.dart';
import 'package:stash/screens/home/home_controller.dart';
import 'package:stash/screens/map/map.dart';

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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
    );
  }

  Widget _buildCollapsed(BuildContext context) {
    return StashPanelCollapsedHeader(
      text: "drop a stash",
      appendLeft: Icon(Icons.flag),
      appendRight: Icon(Icons.add),
      backgroundColor: Colors.grey[300],
      borderRadius: _panelRadius,
      onTap: state.onPanelTap,
    );
  }

  @override
  Widget build(BuildContext context) {
    _panelHeightOpen = MediaQuery.of(context).size.height * .90;

    return Scaffold(
      body: Stack(
        children: <Widget>[
          MapScreen(),
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
      )
    );
  }
}


class StashPanelCollapsedHeader extends StatelessWidget {
  final Color backgroundColor;
  final String text;
  final BorderRadiusGeometry borderRadius;

  final Widget appendLeft;
  final Widget appendRight;

  final Function onTap;

  StashPanelCollapsedHeader({
    this.backgroundColor = Colors.transparent,
    this.text = "",
    this.borderRadius = BorderRadius.zero,
    this.appendLeft,
    this.appendRight,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () { if (onTap != null) onTap(); },
      child: Container(
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: borderRadius,
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: <Widget>[
              if (appendLeft != null) appendLeft,
              Expanded(
                  child: Center(
                      child: Text(text,
                        style: Theme.of(context).textTheme.button,
                      )
                  )
              ),
              if (appendRight != null) appendRight,
            ],
          ),
        ),
      ),
    );
  }
}
