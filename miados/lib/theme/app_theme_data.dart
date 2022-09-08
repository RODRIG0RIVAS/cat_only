import 'package:flutter/material.dart';

enum AppThemeColors { black, colorful }

class AppThemeData {
  final MaterialColor black;
  final MaterialColor colorful;

  const AppThemeData({
    required this.black,
    required this.colorful,
  });
}
