import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:stash/components/widget_view/widget_view.dart';
import 'package:stash/screens/home/home_controller.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  HomeScreenController createState() => HomeScreenController();
}

class HomeScreenView extends WidgetView<HomeScreen, HomeScreenController> {
  HomeScreenView(HomeScreenController state) : super(state);

  @override
  Widget build(BuildContext context) {
    return Container(color: Colors.pink,);
  }

  
}