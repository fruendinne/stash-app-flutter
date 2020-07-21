import 'package:flutter/cupertino.dart';
import 'package:stash/models/slippy_map_coordinates.dart';

class StashModel {
  final int id;

  final SlippyMapCoordinates coordinates;

  final String body;
  final String linkUrl;
  final String imageUrl;
  final Color color;

  StashModel({
    this.id,
    this.coordinates,
    this.body,
    this.linkUrl,
    this.imageUrl,
    this.color,
  });
}