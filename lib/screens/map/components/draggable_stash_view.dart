import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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
              color: Color.fromRGBO(35, 35, 35, 1),
            ),
            child: Column(
              children: <Widget>[
                Text("Drag to open", style: TextStyle(color: Colors.white))
              ],
            ),
          ),
        );
      },
    );
  }
}
