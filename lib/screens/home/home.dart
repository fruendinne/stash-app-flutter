import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
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
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            title: Text('Explore'),
          ),
          BottomNavigationBarItem(
            icon: Icon(MdiIcons.podiumSilver),
            title: Text('Leaderboard'),
          ),
        ],
        currentIndex: state.selectedIndex,
        selectedItemColor: Theme.of(context).primaryColor,
        onTap: state.onItemTapped,
      ),
      body: state.getView(),
    );
  }
}
