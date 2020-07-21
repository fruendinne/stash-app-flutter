import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:stash/models/stash_model.dart';
import 'package:stash/screens/details/details.dart';

class DetailsScreenController extends State<DetailsScreen> {
  StashModel stash;
  bool lightText = true;

  bool thumbUp = false;
  dynamic thumbUpIcon = Icon(MdiIcons.thumbUpOutline);
  bool thumbDown = false;
  dynamic thumbDownIcon = Icon(MdiIcons.thumbDownOutline);

  Color get textColor {
    return lightText ? Colors.white : Colors.black;
  }

  DetailsScreenController(StashModel stash) {
    this.stash = stash;
  }

  @override
  void initState() {
    super.initState();
  }

  void thumbsUpCallback() {
    if (thumbDown) return;
    setState(() {
      this.thumbUp = !this.thumbUp;
      // this.thumbDown = !this.thumbDown;

      this.thumbUpIcon =
          this.thumbUp ? Icon(MdiIcons.thumbUp) : Icon(MdiIcons.thumbUpOutline);
    });
  }

  void thumbsDownCallback() {
    if (thumbUp) return;
    setState(() {
      this.thumbDown = !this.thumbDown;
      // this.thumbUp = !this.thumbUp;

      this.thumbDownIcon = this.thumbDown
          ? Icon(MdiIcons.thumbDown)
          : Icon(MdiIcons.thumbDownOutline);
    });
  }

  @override
  Widget build(BuildContext context) => DetailsScreenView(this);
}
