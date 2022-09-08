import 'package:cat_only/pages/first_loading/first_loading_page.dart';
import 'package:cat_only/pages/home/home_page.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:miados/fonts/fonts.dart';
import 'package:miados/miados.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Button should be pressed and not crash',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      Builder(
        builder: (context) {
          return MaterialApp(
            theme: useThemeController().currentThemeData(context, kleeOne),
            home: const FirstLoadingPage(),
            routes: {RouteNames.home: (context) => const HomePage()},
          );
        },
      ),
    );

    await tester.pumpAndSettle(const Duration(seconds: 10));

    final listFinder = find.byType(Scrollable);
    final itemFinder = find.byKey(const ValueKey('moreCatsButton'));

    // Scroll until the item to be found appears.
    await tester.scrollUntilVisible(
      itemFinder,
      500.0,
      scrollable: listFinder,
    );

    await tester.pump();

    await tester.tap(itemFinder);
    await tester.pumpAndSettle();
  });
}
