import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:stash/components/lustigi_radio_farbe.dart';
import 'package:stash/components/panel/slide_panel_header.dart';
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
    return Column(
      children: <Widget>[
        SlidePanelHeader(
          color: state.color,
          // topRightAppend: IconButton(
          //   icon: Icon(Icons.close,
          //       color: Colors.white),
          // ),
          body: Row(
            children: <Widget>[
              MaterialButton(
                child: Text("+ ADD MEDIA"),
                onPressed: state.onPressed,
                shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(50)),
                color: Colors.white,
              )
            ],
          ),
        ),
        Align(
          child: Padding(
            padding: const EdgeInsets.only(left: 16.0, top: 16.0),
            child: Text("Pick ä color"),
          ),
          alignment: Alignment.centerLeft,
        ),
        CustomRadio(
          colorChoices: state.colorChoices,
          randomia: state.randomianer,
          onChange: state.onRadioChange,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16.0, top: 16.0),
          child: Align(
            child: Text("Tell me your kinks."),
            alignment: Alignment.centerLeft,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: TextField(
            maxLines: 5,
            maxLength: 260,
            decoration: new InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: new BorderRadius.circular(8.0),
                  borderSide: new BorderSide(
                    width: 0.5,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                    borderSide: new BorderSide(
                  width: 0.5,
                ))),
          ),
        ),
        Expanded(
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
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
                color: state.color,
                onPressed: state.onPressed,
              ),
            ),
          ),
        )
      ],
    );
  }
}
