import 'package:cat_api/cat_api.dart';
import 'package:cat_only/injectors/get_cat_page_limit/get_cat_page_limit_injector.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late GetCatPageLimitInjector injector;

  setUp(() {
    injector = GetCatPageLimitInjector();
  });

  test('Should return a GetCatPageLimitImpl', () {
    expect(injector(), isA<GetCatPageLimitImpl>());
  });
}
