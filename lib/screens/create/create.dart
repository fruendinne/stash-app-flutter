import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:stash/components/widget_view/widget_view.dart';
import 'package:stash/screens/create/create_controller.dart';

class CreateScreen extends StatefulWidget {
  CreateScreen({Key key}) : super(key: key);

  @override
  CreateScreenController createState() => CreateScreenController();
}

class CreateScreenView
    extends WidgetView<CreateScreen, CreateScreenController> {
  CreateScreenView(CreateScreenController state) : super(state);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            child: Column(
              children: <Widget>[
                Text('meeeeee'),
                RaisedButton(
                  child: Text("Button!"),
                  onPressed: state.onPressed
                )
              ],
            ),
          ),
          Row(

          )
        ],
      ),
    );
  }
}
