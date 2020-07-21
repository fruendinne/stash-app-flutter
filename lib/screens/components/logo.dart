import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class Logo extends StatelessWidget {
  final double fontSize;
  final Color color;
  final bool dropShadow;

  const Logo({Key key, this.fontSize = 48, this.color = Colors.white, this.dropShadow = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text("stash",
        style: GoogleFonts.nunito(
            textStyle: TextStyle(
                color: color,
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                letterSpacing: -1.5,
                shadows: <Shadow> [
                  if (dropShadow) Shadow(
                    blurRadius: 10.0,
                    color: Color.fromARGB(64, 0, 0, 0)
                  )
                ]
            ),
        ),
    );
  }
}
