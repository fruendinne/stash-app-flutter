import 'package:flutter/material.dart';

class CustomRadio extends StatefulWidget {
  @override
  createState() {
    return new CustomRadioState();
  }
}

class CustomRadioState extends State<CustomRadio> {
  List<RadioModel> sampleData = new List<RadioModel>();

  @override
  void initState() {
    // TODO: meeeh
    super.initState();
    sampleData.add(new RadioModel(false,Colors.lightGreenAccent));
    sampleData.add(new RadioModel(false,Colors.tealAccent));
    sampleData.add(new RadioModel(false,Colors.cyanAccent));

    sampleData.add(new RadioModel(false,Colors.redAccent));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,

      child: ListView.builder(

        scrollDirection: Axis.horizontal,
        itemCount: sampleData.length,
        itemBuilder: (BuildContext context, int index) {


          return new RadioItem(
              sampleData[index],
              (){
                setState(() {
                  sampleData.forEach((element) => element.isSelected = false);    sampleData[index].isSelected = true;
                });
          }

          );
        },
      ),
    );
  }
}


class RadioItem extends StatelessWidget {
  final RadioModel _item;

  final Function onTap;


  RadioItem(this._item, this.onTap);
  @override
  Widget build(BuildContext context) {




    return new Container(
      height: 50.0,
      width: 50.0,
      margin: new EdgeInsets.all(15.0),
      child: new Center(
        child: InkWell(
          onTap: onTap,
          child: Container(
              height: _item.isSelected ? 35.0 : 50.0,
              width: _item.isSelected ? 35.0 : 50.0,
              decoration: new BoxDecoration(
                color: _item.color,
                borderRadius: const BorderRadius.all(const Radius.circular(5.0)
                ),
              ),
            ),
        ),
      ),
    );
  }
}

class RadioModel {
  bool isSelected;
  final Color color;

  RadioModel(this.isSelected, this.color);
}