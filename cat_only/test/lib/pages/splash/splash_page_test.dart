import 'package:cat_only/pages/splash/splash_page.dart';
import 'package:cat_only/pages/splash/strings/splash_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('SlashPage WidgetTest', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: SplashPage()));

    expect(find.byType(Center), findsOneWidget);

    expect(find.text(SplashStrings.catAtSleepingOfKuduairo), findsOneWidget);
    expect(find.text(SplashStrings.continueSneaky), findsOneWidget);
    expect(find.text(SplashStrings.silence), findsOneWidget);
  });
}
