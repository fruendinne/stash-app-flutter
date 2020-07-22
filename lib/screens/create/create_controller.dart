import 'package:flutter/widgets.dart';

import 'create.dart';

class CreateScreenController extends State<CreateScreen> {

  Color color;

  @override
  void initState() {
    super.initState();
  }
  void onPressed(){
    debugPrint("Dickkkkk");
  }

  void onRadioChange(Color newColor){
    color = newColor;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) => CreateScreenView(this);
}
