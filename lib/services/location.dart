import 'package:geolocator/geolocator.dart';
import 'package:stash/models/slippy_map_coordinates.dart';

class LocationService {
  Position lastPosition;

  LocationService._privateConstructor();
  LocationService _instance = LocationService._privateConstructor();
  LocationService get instance => _instance;

  static Future<Position> getCurrentPosition() async {
    return await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
  }

  static Future<SlippyMapCoordinates> getSlippyMapCoordinates() async {
    Position pos = await getCurrentPosition();
    SlippyMapCoordinates coordPos = SlippyMapCoordinates.fromRadians(
        pos.longitude, pos.latitude, SlippyMapCoordinates.DEFAULT_ZOOM_LEVEL);

    return coordPos;
  }

  static Future<bool> onSameSlippyMapCoordinate(
      SlippyMapCoordinates coord) async {
    SlippyMapCoordinates pos = await getSlippyMapCoordinates();
    return coord == pos;
  }
}
