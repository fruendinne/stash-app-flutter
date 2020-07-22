import 'package:flutter/widgets.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:user_location/user_location.dart';

import 'map.dart';

class MapScreenController extends State<MapScreen> {
  MapController mapController = MapController();
  UserLocationOptions userLocationOptions;
  List<Marker> markers = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) => MapScreenView(this);
}
