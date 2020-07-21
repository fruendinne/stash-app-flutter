import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:stash/models/stash_model.dart';
import 'package:stash/screens/details/details.dart';
import 'package:stash/themes/style.dart';

class DraggableStashView extends StatefulWidget {
  @override
  _DraggableStashViewState createState() => _DraggableStashViewState();
}

class _DraggableStashViewState extends State<DraggableStashView> {
  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.1,
      minChildSize: 0.1,
      maxChildSize: 1.0,
      expand: true,
      builder: (context, scrollController) {
        return SingleChildScrollView(
          controller: scrollController,
          child: Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.symmetric(vertical: 24),
            constraints: BoxConstraints(
              minHeight: MediaQuery.of(context).size.height,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20)),
              color: CustomColors.surface200,
            ),
            child: DetailsScreen(
              stash: StashModel(
                  color: Colors.lime,
                  body: "Blub",
                  imageUrl:
                      "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fassets1.ignimgs.com%2F2020%2F04%2F02%2Fjoe-exotic-tiger-king-1585833589671.jpg%3Fwidth%3D1280&f=1&nofb=1",
                  viewCount: 42),
            ),
          ),
        );
      },
    );
  }
}
