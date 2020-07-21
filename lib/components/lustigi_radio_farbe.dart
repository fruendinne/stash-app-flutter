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
    super.initState();

    sampleData.add(new RadioModel(false,Color(0xFFE5554F)));
    sampleData.add(new RadioModel(false,Color(0xFFFF9E1B)));
    sampleData.add(new RadioModel(false,Color(0xFFFFD700)));
    sampleData.add(new RadioModel(false,Color(0xFF79BE70)));
    sampleData.add(new RadioModel(false,Color(0xFF279989)));
    sampleData.add(new RadioModel(false,Color(0xFF00A7B5)));
    sampleData.add(new RadioModel(false,Color(0xFFB884CB)));
    sampleData.add(new RadioModel(false,Color(0xFFEF95CF)));
    sampleData.add(new RadioModel(false,Color(0xFFF1BDC8)));
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
                  sampleData.forEach((element) => element.isSelected = false);
                  sampleData[index].isSelected = true;
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
      margin: new EdgeInsets.all(13.0),
      child: new Center(
        child: InkWell(
          onTap: onTap,
          child: Container(
              height: _item.isSelected ? 40.0 : 50.0,
              width: _item.isSelected ? 40.0 : 50.0,
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