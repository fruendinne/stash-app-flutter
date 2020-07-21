import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:stash/components/widget_view/widget_view.dart';
import 'package:stash/screens/details/details_controller.dart';

class DetailsScreen extends StatefulWidget {
  DetailsScreen({Key key}) : super(key: key);

  @override
  DetailsScreenController createState() => DetailsScreenController();
}

class DetailsScreenView
    extends WidgetView<DetailsScreen, DetailsScreenController> {
  DetailsScreenView(DetailsScreenController state) : super(state);

  @override
  Widget build(BuildContext context) {
    return Container(color: Colors.pinkAccent);
  }
}
