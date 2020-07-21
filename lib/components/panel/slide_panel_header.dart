import 'package:flutter/material.dart';
import 'package:stash/screens/components/logo.dart';

import '../../themes/style.dart';

class SlidePanelHeader extends StatelessWidget {
  final Widget topRightAppend;
  final Widget body;

  final Color color;

  SlidePanelHeader({this.topRightAppend, this.body, this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16.0),
              topRight: Radius.circular(16.0),
          ),
          color: color,
        ),
        child: Column(
          children: <Widget>[
            Container(
              height: 16.0,
              child: Center(
                child: Icon(Icons.remove, color: CustomColors.textOnPrimaryHighEmphasis),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 16.0),
              child: Row(
                children: <Widget>[
                  Logo(),
                  Spacer(),
                  if (topRightAppend != null) topRightAppend,
                ],
              ),
            ),
            if (body != null) Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
              child: body
            ),
          ],
        ),
    );
  }
}
