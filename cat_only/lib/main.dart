import 'package:cat_only/pages/first_loading/first_loading_page.dart';
import 'package:cat_only/pages/home/home_page.dart';
import 'package:cat_only/pages/splash/splash_page.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:miados/fonts/fonts.dart';
import 'package:miados/miados.dart';

import 'pages/_root/root_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cat Only',
      debugShowCheckedModeBanner: false,
      theme: useThemeController().currentThemeData(context, kleeOne),
      //home: const RootPage(),
      initialRoute: RouteNames.main,
      routes: {
        RouteNames.main: (context) => const RootPage(),
        RouteNames.splash: (context) => const SplashPage(),
        RouteNames.firstLoading: (context) => const FirstLoadingPage(),
        RouteNames.home: (context) => const HomePage(),
      },
    );
  }
}
