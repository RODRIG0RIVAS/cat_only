import 'package:cat_only/controllers/home/home_controller.dart';
import 'package:cat_only/pages/home/inject/home_inject.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Should return a HomeController', () {
    expect(HomeInject.controller(), isA<HomeController>());
  });
}
