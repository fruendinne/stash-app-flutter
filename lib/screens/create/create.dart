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

  Widget _buildHeaderBody(BuildContext context) {
    if (state.image == null) {
      return Align(
        alignment: Alignment.centerLeft,
        child: FloatingActionButton.extended(
          elevation: 3,
          label: Text("ADD BILDO",
          style: Theme.of(context).textTheme.button.copyWith(color: Colors.black)),
          onPressed: state.getImage,
          icon: Icon(
            Icons.add,
            color: Colors.black,),

          backgroundColor: Colors.white,
        ),
      );
    } else {
      return AspectRatio(
        aspectRatio: 1,
        child: Container(
          decoration: new BoxDecoration(
            image: new DecorationImage(
                image: Image.file(state.image).image,
            fit:  BoxFit.cover,
            alignment: FractionalOffset.center),
            borderRadius: BorderRadius.circular(8),
          ),


          child: Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: FloatingActionButton(
                elevation: 1,
                onPressed: state.deleteImage,
                backgroundColor: Colors.white,
                child: Icon(Icons.close,
                  color: Colors.black,
                ),
                mini: true,
              ),
            ),
          )
      )
    );
    }
  }

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
          SlidePanelHeader(
            color: state.color,
//            topRightAppend: IconButton(
//              icon: Icon(Icons.close, color: Colors.white),
//            ),
            body: _buildHeaderBody(context)
          ),
          Align(
            child: Padding(
              padding: const EdgeInsets.only(left: 16.0, top: 16.0),
              child: Text("Pick ä color",
              ),
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
              child: Text("Tell me your kinks.",
              ),
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
      ),
    );
  }
}
