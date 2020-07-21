import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final ThemeData customThemeData = ThemeData(
  brightness: Brightness.light,
  primaryColor: CustomColors.primary900,
  primaryColorBrightness: Brightness.light,
  accentColor: CustomColors.primary700,
  accentColorBrightness: Brightness.light,
  backgroundColor: CustomColors.primary700,
  errorColor: CustomColors.red900,
  // Define the default text Themes
  textTheme: _buildDefaultTextTheme(ThemeData.light().textTheme),
  primaryTextTheme: _buildDefaultTextTheme(ThemeData.light().primaryTextTheme),
  accentTextTheme: _buildDefaultTextTheme(ThemeData.light().accentTextTheme),
);

class CustomColors {
  static const Color primary900 = Color(0xFF3F3E3E);
  static const Color primary800 = Color(0xFF535353);
  static const Color primary700 = Color(0xFF646363);

  static const Color red900 = Color(0xFFC80008);
  static const Color red800 = Color(0xFFD60019);
  static const Color red700 = Color(0xFFE30D21);

  static const Color green900 = Color(0xFF008E04);
  static const Color green800 = Color(0xFF00B022);
  static const Color green700 = Color(0xFF00C22E);

  static const Color textOnSurfaceLowEmphasis = Colors.black45;
  static const Color textOnSurfaceMedEmphasis = Colors.black54;
  static const Color textOnSurfaceHighEmphasis = Colors.black87;

  static Color textOnPrimaryHighEmphasis = Colors.white.withAlpha(245);
  static Color textOnPrimaryMedEmphasis = Colors.white.withAlpha(153);
  static Color textOnPrimaryLowEmphasis = Colors.white.withAlpha(102);

  static const Color gridline = Colors.black12;

  static const Color surface100 = Colors.white;
  static const Color surface200 = Color(0xFFF8F8F8);
  static const Color surface300 = Color(0xFFF3F3F3);
}

TextTheme _buildDefaultTextTheme(TextTheme base) {
  return base.copyWith(
      headline1: GoogleFonts.nunito(
          textStyle: base.headline1.copyWith(
        fontFamily: 'Nunito',
        fontSize: 96,
        height: 1.0,
        fontWeight: FontWeight.w600,
        color: CustomColors.textOnSurfaceHighEmphasis,
      )),
      headline2: GoogleFonts.nunito(
          textStyle: base.headline2.copyWith(
        fontFamily: 'Nunito',
        fontSize: 66,
        height: 1.0,
        fontWeight: FontWeight.w400,
        color: CustomColors.textOnSurfaceHighEmphasis,
      )),
      headline3: GoogleFonts.nunito(
          textStyle: base.headline3.copyWith(
        fontFamily: 'Nunito',
        fontSize: 52,
        height: 1.0,
        fontWeight: FontWeight.w400,
        color: CustomColors.textOnSurfaceHighEmphasis,
      )),
      headline4: GoogleFonts.nunito(
          textStyle: base.headline4.copyWith(
        fontSize: 37,
        height: 1.0,
        fontWeight: FontWeight.w400,
        color: CustomColors.textOnSurfaceHighEmphasis,
      )),
      headline5: GoogleFonts.nunito(
          textStyle: base.headline5.copyWith(
        fontFamily: 'Nunito',
        fontSize: 26,
        height: 1.0,
        fontWeight: FontWeight.w400,
        color: CustomColors.textOnSurfaceHighEmphasis,
      )),
      headline6: GoogleFonts.nunito(
          textStyle: base.headline6.copyWith(
        fontFamily: 'Nunito',
        fontSize: 22,
        height: 1.0,
        fontWeight: FontWeight.w400,
        color: CustomColors.textOnSurfaceHighEmphasis,
      )),
      caption: GoogleFonts.nunito(
          textStyle: base.caption.copyWith(
        fontFamily: 'Nunito',
        fontSize: 14,
        letterSpacing: 0.4,
        color: CustomColors.textOnSurfaceMedEmphasis,
      )),
      overline: GoogleFonts.nunito(
          textStyle: base.overline.copyWith(
              fontFamily: 'Nunito',
              fontSize: 14,
              color: CustomColors.textOnSurfaceMedEmphasis)),
      bodyText1: GoogleFonts.nunito(
          textStyle: base.bodyText1.copyWith(
              fontFamily: 'Nunito',
              fontSize: 16,
              fontWeight: FontWeight.w400,
              letterSpacing: 0.5,
              height: 1.75,
              color: CustomColors.textOnSurfaceHighEmphasis)),
      bodyText2: GoogleFonts.nunito(
          textStyle: base.bodyText2.copyWith(
              fontFamily: 'Nunito',
              fontSize: 14,
              fontWeight: FontWeight.w400,
              letterSpacing: 0.5,
              height: 1.75,
              color: CustomColors.textOnSurfaceHighEmphasis)),
      button: GoogleFonts.nunito(
          textStyle: base.button.copyWith(
              fontFamily: 'Nunito',
              fontSize: 14,
              fontWeight: FontWeight.w500,
              letterSpacing: 0.25,
              color: CustomColors.textOnPrimaryHighEmphasis)),
      subtitle1: GoogleFonts.nunito(
          textStyle: base.subtitle1.copyWith(
              fontFamily: 'Nunito',
              fontSize: 17,
              fontWeight: FontWeight.w500,
              letterSpacing: 0.5,
              color: CustomColors.textOnSurfaceHighEmphasis)));
}
