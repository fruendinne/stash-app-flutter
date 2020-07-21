import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_map/plugin_api.dart';
import 'package:latlong/latlong.dart';
import 'package:stash/models/slippy_map_coordinates.dart';
import 'package:stash/models/stash_model.dart';

class MapPluginStashGridOptions extends LayerOptions {
  final List<StashModel> stashes;

  MapPluginStashGridOptions({this.stashes});
}

class MapPluginStashGrid extends MapPlugin {
  final MapPluginStashGridOptions options;

  MapPluginStashGrid({this.options});

  @override
  Widget createLayer(
      LayerOptions options, MapState mapState, Stream<Null> stream) {
    if (options is MapPluginStashGridOptions) {
      return Center(
        child: CustomPaint(
          // the child empty Container ensures that CustomPainter gets a size
          // (not w=0 and h=0)
          child: Container(),
          painter: _StashGridPainter(options: options, mapState: mapState),
        ),
      );
    }

    throw Exception('Unknown options type for MyCustom plugin: $options');
  }

  @override
  bool supportsLayer(LayerOptions options) {
    return options is MapPluginStashGridOptions;
  }
}

class _StashGridPainter extends CustomPainter {
  final MapPluginStashGridOptions options;
  final MapState mapState;

  final Paint mPaint = Paint();

  _StashGridPainter({this.options, this.mapState});

  double _paintGrid(Canvas canvas, Size size) {
    final double width = size.width;
    final double height = size.height;

    final LatLngBounds mapBounds = mapState.getBounds();
    final List<double> longLines = _getLinePositions(mapBounds.west, mapBounds.east, SlippyMapCoordinates.DEFAULT_ZOOM_LEVEL);

    for (double longLine in longLines) {
      final CustomPoint projected = mapState.project(LatLng(mapBounds.north, longLine), mapState.zoom);
      final double pixelPos = projected.x - mapState.getPixelBounds(mapState.zoom).topLeft.x;

      // draw line
      final Offset pTopNorth = Offset(pixelPos, 0.0);
      final Offset pBottomSouth = Offset(pixelPos, height);

      canvas.drawLine(pTopNorth, pBottomSouth, mPaint);
    }

    if (longLines.length >= 2) {
      final double segmentSize = 360 / math.pow(2, SlippyMapCoordinates.DEFAULT_ZOOM_LEVEL);
      final double topOffset = mapBounds.north % segmentSize;

      final CustomPoint projectedOffset = mapState.project(LatLng(mapBounds.north - topOffset, mapBounds.west), mapState.zoom);
      final double startY = projectedOffset.y - mapState.getPixelBounds(mapState.zoom).topLeft.y;

      final double squareHeight = _measurePixelDistance(longLines[0], longLines[1], mapState);

      double currentY = startY;
      do {
        final Offset pLeft = Offset(0.0, currentY);
        final Offset pRight = Offset(width, currentY);

        canvas.drawLine(pLeft, pRight, mPaint);

        currentY += squareHeight;
      } while(currentY < height);

      return squareHeight;
    }

    return 0;
  }

  @override
  void paint(Canvas canvas, Size size) {
    if (mapState.zoom > 15) {
      final double squareSize = _paintGrid(canvas, size);

      options.stashes.forEach((stash) {
        LatLng coordinates = stash.coordinates.latlng;

        final CustomPoint projected = mapState.project(coordinates, mapState.zoom);

        final double startX = projected.x - mapState.getPixelBounds(mapState.zoom).topLeft.x;
        final double startY = projected.y - mapState.getPixelBounds(mapState.zoom).topLeft.y;

        canvas.drawRect(Rect.fromLTWH(startX, startY, squareSize, squareSize), mPaint);
      });
    }
  }

  @override
  bool shouldRepaint(_StashGridPainter oldDelegate) {
    return false;
  }
}

List<double> _getLinePositions(double lowerBound, double upperBound, int zoom, {bool compensateLongitude = false}) {
  final int numSegmentsTotal = math.pow(2, zoom);
  final double segmentSize = 360 / numSegmentsTotal;
  
  final double leftOffset = lowerBound % segmentSize;
  
  final List<double> longLinePositions = <double>[];
  
  double currentLongLinePos = lowerBound - leftOffset;
  
  do {
    longLinePositions.add(currentLongLinePos);
    currentLongLinePos += segmentSize;
  } while (currentLongLinePos < upperBound);

  return longLinePositions;
}

double _measurePixelDistance(double longA, double longB, MapState mapState) {
  final CustomPoint pointA = mapState.project(LatLng(0.0, longA), mapState.zoom);
  final CustomPoint pointB = mapState.project(LatLng(0.0, longB), mapState.zoom);

  return pointB.x - pointA.x;
}