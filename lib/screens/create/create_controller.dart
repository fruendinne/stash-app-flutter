import 'package:flutter/widgets.dart';

import 'create.dart';

class CreateScreenController extends State<CreateScreen> {
  @override
  void initState() {
    super.initState();
  }

  void onPressed() {
    debugPrint('penii');
  }

  @override
  Widget build(BuildContext context) => CreateScreenView(this);
}
