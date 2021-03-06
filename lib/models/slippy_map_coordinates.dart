import 'dart:math' as math;

import 'package:latlong/latlong.dart';

class SlippyMapCoordinates {
  static const int DEFAULT_ZOOM_LEVEL = 22;

  final int _x;
  final int _y;

  final int _zoom;

  int get x => _x;
  int get y => _y;

  double get latitude => _tileToLat(_y, _zoom);
  double get longitude => _tileToLong(_x, _zoom);

  LatLng get latlng => LatLng(latitude, longitude);

  SlippyMapCoordinates(this._x, this._y, this._zoom);

  factory SlippyMapCoordinates.fromRadians(
      double latitude, double longitude, int zoom) {
    return new SlippyMapCoordinates(
      _longToTile(longitude, zoom),
      _latToTile(latitude, zoom),
      zoom,
    );
  }

  static int _longToTile(double long, int zoom) {
    return ((long + 180) / 360 * math.pow(2, zoom)).floor();
  }

  static int _latToTile(double lat, int zoom) {
    return ((1 -
                math.log(math.tan(lat * math.pi / 180) +
                        1 / math.cos(lat * math.pi / 180)) /
                    math.pi) /
            2 *
            math.pow(2, zoom))
        .floor();
  }

  static double _tileToLong(int x, int zoom) {
    return x / math.pow(2, zoom) * 360 - 180;
  }

  static double _tileToLat(int y, int zoom) {
    double n = math.pi - 2 * math.pi * y / math.pow(2, zoom);
    return 180 / math.pi * math.atan(0.5 * (math.exp(n) - math.exp(-n)));
  }

  @override
  bool operator ==(o) => o is SlippyMapCoordinates && o.x == x && o.y == y;

  @override
  int get hashCode => super.hashCode;
}
