import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SystemUiOverlayController {
  static void splash(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Theme.of(context).backgroundColor,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: Theme.of(context).backgroundColor,
      ),
    );
  }

  static void firstLoading(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Theme.of(context).colorScheme.secondary,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: Theme.of(context).colorScheme.secondary,
      ),
    );
  }

  static void home(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Theme.of(context).colorScheme.secondary,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: Theme.of(context).colorScheme.secondary,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
    );
  }
}
