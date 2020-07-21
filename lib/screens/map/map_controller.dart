import 'package:flutter/widgets.dart';

import 'map.dart';

class MapScreenController extends State<MapScreen> {
  bool showStashView = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) => MapScreenView(this);

  void switchMode() {
    setState(() {
      showStashView = !showStashView;
    });
  }
}
