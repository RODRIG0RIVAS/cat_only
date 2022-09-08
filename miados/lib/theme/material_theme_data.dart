import 'package:flutter/material.dart';

ThemeData buildLightThemeData({
  required String fontFamily,
  required Color backgroundColor,
  required Color primaryColor,
  required Color secondaryColor,
  required Color black,
  required Color error,
  required Color white,
}) {
  final textTheme = _buildTextTheme(fontFamily, black, white);
  final elevatedButtonTheme = _buildElevatedButtonThemeData(
    backgroundColor: secondaryColor,
    textStyle: textTheme.button!,
  );

  return ThemeData(
    textTheme: textTheme,
    fontFamily: fontFamily,
    primaryColor: primaryColor,
    backgroundColor: backgroundColor,
    elevatedButtonTheme: elevatedButtonTheme,
    colorScheme: ColorScheme(
      brightness: Brightness.light,
      primary: primaryColor,
      onPrimary: black,
      secondary: secondaryColor,
      onSecondary: white,
      error: error,
      onError: white,
      background: backgroundColor,
      onBackground: black,
      surface: white.withRed(240).withGreen(240).withBlue(240),
      onSurface: black,
    ),
  );
}

TextTheme _buildTextTheme(
  String fontFamily,
  Color black,
  Color white,
) {
  return TextTheme(
    headline5: TextStyle(
      fontFamily: fontFamily,
      color: black,
      fontSize: 36,
      fontWeight: FontWeight.w300,
    ),
    bodyText1: TextStyle(
      fontFamily: fontFamily,
      color: black,
    ),
    button: TextStyle(
      fontFamily: fontFamily,
      color: black,
      fontSize: 20,
      fontWeight: FontWeight.w300,
    ),
  );
}

ElevatedButtonThemeData _buildElevatedButtonThemeData({
  required Color backgroundColor,
  required TextStyle textStyle,
}) {
  return ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: backgroundColor,
      textStyle: textStyle,
      elevation: 0,
      enableFeedback: false,
      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
    ),
  );
}
