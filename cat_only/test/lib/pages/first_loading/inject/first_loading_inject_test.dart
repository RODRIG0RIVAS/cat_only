import 'package:cat_only/controllers/first_loading/first_loading_controller.dart';
import 'package:cat_only/pages/first_loading/inject/first_loading_inject.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Should return a FirstLoadingController', () {
    expect(FirstLoadingInject.controller(), isA<FirstLoadingController>());
  });
}
