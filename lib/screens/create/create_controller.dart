import 'dart:io';
import 'dart:math';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/widgets.dart';
import 'create.dart';

class CreateScreenController extends State<CreateScreen> {

  final List<Color> colorChoices = <Color>[
      Color(0xFFE5554F),
      Color(0xFFFF9E1B),
      Color(0xFFFFD700),
      Color(0xFF79BE70),
      Color(0xFF279989),
      Color(0xFF00A7B5),
      Color(0xFFB884CB),
      Color(0xFFEF95CF),
      Color(0xFFF1BDC8),
  ];

  int randomianer;
  Color color;
  File image;

  @override
  void initState() {
    super.initState();
    Random random = Random();


    randomianer = random.nextInt(colorChoices.length);
    color = colorChoices[randomianer];
  }
  void onPressed(){
    debugPrint("Dickkkkk");
  }

  Future getImage() async {
    final picker = ImagePicker();

    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      image = File(pickedFile.path);
    });
  }

  void onRadioChange(Color newColor){
    color = newColor;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) => CreateScreenView(this);
}
