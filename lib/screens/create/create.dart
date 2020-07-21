import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:stash/components/lustigi_radio_farbe.dart';
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
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16.0),
          topRight: Radius.circular(16.0),
        ),
        //TODO: change to stashcolor
        //color: state.stash.color,
        color: Colors.white,
      ),
      child: Column(
          children: <Widget>[
            Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Text(
                      "Stash"
                    ),
                    IconButton(
                      icon: Icon(Icons.close),
                    ),
                  ],
                ),
                MaterialButton(
                  child: Text("+ ADD MEDIA"),
                  onPressed: state.onPressed,
                )
              ],
            ),
            Column(
              children: <Widget>[
                Text(
                  "Pick ä color"
                ),
                CustomRadio(),
                Text(
                  "Tell me your kinks."
                ),
                TextField(
                    maxLines: 8
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: MaterialButton(
                    child: Text(
                      "Mach di ding",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                      ),
                    ),
                    minWidth: 250,
                    height: 50,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    color: Colors.grey[900],
                    onPressed: state.onPressed,

                  ),
                )
              ],
            )
          ],
        ),
    );
  }
}
