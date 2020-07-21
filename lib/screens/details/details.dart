import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:stash/components/widget_view/widget_view.dart';
import 'package:stash/screens/details/details_controller.dart';

class DetailsScreen extends StatefulWidget {
  DetailsScreen({Key key}) : super(key: key);

  @override
  DetailsScreenController createState() => DetailsScreenController();
}

class DetailsScreenView
    extends WidgetView<DetailsScreen, DetailsScreenController> {
  DetailsScreenView(DetailsScreenController state) : super(state);

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Container(
        color: Colors.lime,
        child: Column(children: <Widget>[
        Row(children: <Widget>[
          Text("Stash", style: TextStyle(fontSize: 50, color: Colors.white)),
          Spacer(),
          Row(children: <Widget>[
            Text("16", style: TextStyle(fontSize: 24, color: Colors.white)),
            Text("×", style: TextStyle(fontSize: 24, color: Colors.white)),
            Icon(MdiIcons.glasses, color: Colors.white,)
          ],)
        ],),
        Container(child: Image.network(
            "https://img.blick.ch/incoming/15824173-v1-tiger-king-joe-exotic-netflix.jpg?imwidth=1200&ratio=1_1&x=151&y=0&width=720&height=720"),
            height: 200,
        ),
      ],),),
      Container(
          color: Colors.white,
          child: Column(children: <Widget>[
        TextField(),
        Row(mainAxisAlignment: MainAxisAlignment.center,children: <Widget>[
          IconButton(icon: Icon(MdiIcons.thumbUp), onPressed: (){},),
          IconButton(icon: Icon(MdiIcons.thumbDown), onPressed: (){},),
        ],),
      ],)),
    ],);
  }
}
