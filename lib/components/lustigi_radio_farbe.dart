import 'package:flutter/material.dart';

class CustomRadio extends StatefulWidget {
  final List<Color> colorChoices;
  final Function onChange;
  final int randomia;

  const CustomRadio({Key key, this.onChange, this.colorChoices, this.randomia = 0}) : super(key: key);

  @override
  createState() {
    return new CustomRadioState();
  }
}

class CustomRadioState extends State<CustomRadio> {
  int selectedColor = 0;
  @override
  void initState() {
    super.initState();
    selectedColor = widget.randomia;


    //widget.onChange(sampleData[r].color);
  }

  bool isSelecta(Color color){
    int colorIndex = widget.colorChoices.indexOf(color);
    if(colorIndex>=0){
      return selectedColor == colorIndex;
    }else{
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,

      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.colorChoices.length,
        itemBuilder: (BuildContext context, int index) {
        Color color = widget.colorChoices[index];

        return new RadioItem(
              color,
              isSelecta(color),
              (){
                setState(() {
                  selectedColor = widget.colorChoices.indexOf(color);
                });
                widget.onChange(color);
          }

          );
        },
      ),
    );
  }
}


class RadioItem extends StatelessWidget {
  final Color _item;
  final bool isSelecta;
  final Function onTap;
  RadioItem(this._item, this.isSelecta, this.onTap);
  @override
  Widget build(BuildContext context) {

    return new Container(
      height: 50.0,
      width: 50.0,
      margin: new EdgeInsets.all(13.0),
      child: new Center(
        child: InkWell(
          onTap: onTap,
          child: Container(
              height: isSelecta ? 40.0 : 50.0,
              width: isSelecta ? 40.0 : 50.0,
              decoration: new BoxDecoration(
                color: _item,
                borderRadius: const BorderRadius.all(const Radius.circular(5.0)
                ),
              ),
            ),
        ),
      ),
    );
  }
}