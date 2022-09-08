import 'package:cat_api/api/domain/exceptions/cat_raw/cat_raw_exception.dart';
import 'package:cat_api/cat_api.dart';
import 'package:cat_only/controllers/first_loading/first_loading_controller.dart';
import 'package:dependency/dependency.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'first_loading_controller_test.mocks.dart';

@GenerateMocks([GetCatPageLimitImpl])
void main() {
  late MockGetCatPageLimitImpl mockGetCatPageLimitImpl;
  late FirstLoadingController controller;

  const page = 1;
  const limit = 10;

  setUp(() {
    mockGetCatPageLimitImpl = MockGetCatPageLimitImpl();
    controller = FirstLoadingController(mockGetCatPageLimitImpl);
  });

  test('Should return a Left when try to get cats', () async {
    when(mockGetCatPageLimitImpl(page, limit)).thenAnswer(
        (realInvocation) async => Left(CatRawException('', '', '')));

    await controller.getCatePageLimit();

    expect(controller.hasError, isTrue);
    expect(controller.catList.isEmpty, isTrue);
  });

  test('Should return a Right when try to get cats', () async {
    when(mockGetCatPageLimitImpl(page, limit))
        .thenAnswer((realInvocation) async => Right([CatRaw('', '', 0, 0)]));

    await controller.getCatePageLimit();

    expect(controller.hasError, isFalse);
    expect(controller.catList.isEmpty, isFalse);
  });
}
