import 'package:geolocator/geolocator.dart';
import 'package:latlong/latlong.dart';
import 'package:stash/models/slippy_map_coordinates.dart';

class LocationService {
  LatLng lastPosition;

  LocationService._privateConstructor();
  static LocationService _instance = LocationService._privateConstructor();
  static LocationService get instance => _instance;

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

  // Returns if current pos is on given slippy map coordinate
  Future<bool> onSameSlippyMapCoordinate(SlippyMapCoordinates coord) async {
    SlippyMapCoordinates pos = SlippyMapCoordinates.fromRadians(
        lastPosition.latitudeInRad,
        lastPosition.longitudeInRad,
        SlippyMapCoordinates.DEFAULT_ZOOM_LEVEL);
    return coord == pos;
  }
}
