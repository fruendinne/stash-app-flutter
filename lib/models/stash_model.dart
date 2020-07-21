import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stash/models/slippy_map_coordinates.dart';

class StashModel {
  final int id;

  final SlippyMapCoordinates coordinates;

  final String body;
  final String linkUrl;
  String imageUrl;
  Color color = Colors.lime;
  int viewCount = 0;

  StashModel(
      {this.id,
      this.coordinates,
      this.body,
      this.linkUrl,
      this.imageUrl,
      this.color,
      this.viewCount});
}
