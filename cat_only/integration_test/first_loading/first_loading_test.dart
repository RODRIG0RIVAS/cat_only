import 'package:cat_only/pages/first_loading/first_loading_page.dart';
import 'package:cat_only/pages/first_loading/inject/first_loading_inject.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:miados/miados.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  final controller = FirstLoadingInject.controller();

  testWidgets('FirstLoadingPage WidgetTest', (WidgetTester tester) async {
    await tester.runAsync(() async => controller.getCatePageLimit());
    expect(controller.catList.isNotEmpty, isTrue);

    await tester.pumpWidget(const MaterialApp(home: FirstLoadingPage()));

    expect(
        find.ancestor(
          of: find.byType(CustomLottie),
          matching: find.byType(Center),
        ),
        findsOneWidget);
  });
}
