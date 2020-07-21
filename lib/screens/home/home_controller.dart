import 'package:flutter/widgets.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import 'home.dart';

class HomeScreenController extends State<HomeScreen> {
  final PanelController panelController = PanelController();

  @override
  void initState() {
    super.initState();
  }

  void onPanelTap() {
    panelController.open();
  }

  @override
  Widget build(BuildContext context) => HomeScreenView(this);
}
