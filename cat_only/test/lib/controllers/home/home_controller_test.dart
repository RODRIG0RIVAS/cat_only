import 'package:cat_api/api/domain/exceptions/cat_raw/cat_raw_exception.dart';
import 'package:cat_api/cat_api.dart';
import 'package:cat_only/controllers/home/home_controller.dart';
import 'package:dependency/dependency.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'home_controller_test.mocks.dart';

@GenerateMocks([GetCatPageLimitImpl])
void main() {
  late MockGetCatPageLimitImpl mockGetCatPageLimitImpl;
  late HomeController controller;

  final CatRaw cat = CatRaw('', '', 0, 0);

  const int page = 1;
  const int limit = 10;

  setUp(() {
    mockGetCatPageLimitImpl = MockGetCatPageLimitImpl();
    controller = HomeController(mockGetCatPageLimitImpl);
  });

  group('GetCatPageLimit -', () {
    test('Should return a Left when try to get cats', () async {
      when(mockGetCatPageLimitImpl(0, limit)).thenAnswer(
          (realInvocation) async => Left(CatRawException('', '', '')));

      await controller.getCatPageLimit(0);

      expect(controller.hasError, isTrue);
      expect(controller.cats.isEmpty, isTrue);
    });

    test('Should return a Right when try to get cats', () async {
      when(mockGetCatPageLimitImpl(page, limit))
          .thenAnswer((realInvocation) async => Right([cat, cat]));

      await controller.getCatPageLimit(page);

      expect(controller.hasError, isFalse);
      expect(controller.cats.isEmpty, isFalse);
    });
  });

  test('Should set catList', () {
    controller.setCatList([cat, cat]);
    expect(controller.cats.isNotEmpty, isTrue);
  });

  test('Should set isLoading', () {
    controller.setIsLoading(true);
    expect(controller.isLoading, isTrue);

    controller.setIsLoading(false);
    expect(controller.isLoading, isFalse);
  });

  test('Should return false for isLastCat', () {
    controller.setCatList([cat, cat]);

    expect(controller.isLastCat(0), isFalse);
  });

  test('Should set hasError', () {
    controller.setHasError(true);
    expect(controller.hasError, isTrue);

    controller.setHasError(false);
    expect(controller.hasError, isFalse);
  });

  test('Should return true for isLastCat', () {
    controller.setCatList([cat, cat]);

    expect(controller.isLastCat(1), isTrue);
  });

  test('CrossFadeState should be get from isLoading', () {
    CrossFadeState state;

    controller.setIsLoading(true);
    state = controller.crossFadeStateFromLoading;

    expect(state, CrossFadeState.showSecond);

    controller.setIsLoading(false);
    state = controller.crossFadeStateFromLoading;

    expect(state, CrossFadeState.showFirst);
  });

  group('moreCatsOnPressed() -', () {
    test('Should not increase actualPage and not increase catList', () async {
      when(mockGetCatPageLimitImpl(page, limit))
          .thenAnswer((_) async => Left(CatRawException('', '', '')));

      final previousActualPage = controller.actualPage;
      final previousCatList = controller.cats;

      await controller.moreCatsOnPressed();

      expect(controller.actualPage, equals(previousActualPage));
      expect(controller.cats.length, equals(previousCatList.length));
    });

    test('Should increase actualPage', () async {
      when(mockGetCatPageLimitImpl(page, limit))
          .thenAnswer((_) async => Right([cat, cat]));

      final previousActualPage = controller.actualPage;
      await controller.moreCatsOnPressed();

      expect(controller.actualPage, isNot(previousActualPage));
    });
  });
}
