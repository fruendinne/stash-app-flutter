import 'package:flutter/widgets.dart';
import 'package:stash/screens/map/map.dart';

import 'home.dart';

class HomeScreenController extends State<HomeScreen> {
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) => HomeScreenView(this);

  void onItemTapped(int value) {
    setState(() {
      selectedIndex = value;
    });
  }

  Widget getView() {
    switch (selectedIndex) {
      case 0:
        return MapScreen();
      case 1:
        return Container(child: Center(child: Text("Leaderboard")));
      default:
        return Container();
    }
  }
}
