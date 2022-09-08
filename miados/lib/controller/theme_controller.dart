import 'package:flutter/material.dart';

import '../theme/app_theme_data.dart';
import '../colors/theme_colors.dart' as colors;
import '../theme/material_theme_data.dart' as material_theme;

final themeController = ThemeController();

class ThemeController {
  ThemeController();

  static var defaultThemeData = AppThemeData(
    black: _blackSwatchFor(AppThemeColors.black),
    colorful: _colorfulSwatchFor(AppThemeColors.colorful),
  );

  ThemeData currentThemeData(
    BuildContext context,
    String primaryFontFamily,
  ) {
    return material_theme.buildLightThemeData(
      fontFamily: primaryFontFamily,
      white: useTheme().black.shade50,
      black: useTheme().black.shade800,
      error: useTheme().colorful.shade700,
      backgroundColor: useTheme().black.shade50,
      primaryColor: useTheme().colorful.shade500,
      secondaryColor: useTheme().colorful.shade400,
    );
  }
}

MaterialColor _blackSwatchFor(AppThemeColors theme) {
  return colors.buildBlackPallet();
}

MaterialColor _colorfulSwatchFor(AppThemeColors theme) {
  return colors.buildColorfulPallet();
}

AppThemeData useTheme() => ThemeController.defaultThemeData;

ThemeController useThemeController() => ThemeController();
