import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class Logo extends StatelessWidget {
  final double fontSize;
  final Color color;
  const Logo({Key key, this.fontSize = 48, this.color = Colors.white})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text("stash",
        style: GoogleFonts.nunito(
            textStyle: TextStyle(
                color: color,
                fontSize: fontSize,
                fontWeight: FontWeight.bold)));
  }
}
