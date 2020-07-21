import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:stash/models/slippy_map_coordinates.dart';

class StashModel {
  final int id;

  final SlippyMapCoordinates coordinates;

  final String body;
  final String linkUrl;
  String imageUrl;
  final Color color;
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
