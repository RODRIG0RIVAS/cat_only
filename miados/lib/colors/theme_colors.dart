import 'package:flutter/material.dart';

//Black pallet
MaterialColor buildBlackPallet() {
  const defaultPrimary = Color(0xff676767);
  return MaterialColor(
    defaultPrimary.value,
    const {
      50: Color(0xffFFFFFF),
      100: Color(0xffF1F1F1),
      200: Color(0xffEDEDEC),
      300: Color(0xffC4C4C4),
      400: Color(0xffA1A1A1),
      500: defaultPrimary,
      600: Color(0xff444444),
      700: Color(0xff1E1E1E),
      800: Color(0xff121212),
    },
  );
}

//Colorful pallet
MaterialColor buildColorfulPallet() {
  const defaultColorful = Color(0xff51BF77);
  return MaterialColor(
    defaultColorful.value,
    const {
      50: Color(0xffF9AFA4),
      100: Color(0xff3FC8A1),
      200: Color(0xff24BEC8),
      300: Color(0xff51BEC8),
      400: Color(0xffFEEFCF),
      500: defaultColorful,
      600: Color(0xffF0E041),
      700: Color(0xffA81502),
    },
  );
}
