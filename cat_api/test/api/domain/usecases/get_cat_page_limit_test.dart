import 'package:cat_api/api/domain/exceptions/cat_raw/cat_raw_exception.dart';
import 'package:cat_api/api/domain/repository/cat_repository.dart';
import 'package:cat_api/cat_api.dart';
import 'package:dependency/dependency.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_cat_page_limit_test.mocks.dart';

@GenerateMocks([CatRepository])
void main() {
  late MockCatRepository mockCatRepository;
  late GetCatPageLimitImpl getCatPageLimit;

  setUp(() {
    mockCatRepository = MockCatRepository();
    getCatPageLimit = GetCatPageLimitImpl(mockCatRepository);
  });

  group('Errors -', () {
    test('if page <= 0, should return a left', () async {
      const page = 0;
      const limit = 10;

      when(mockCatRepository.getFromLimit(page, limit))
          .thenAnswer((_) async => Left(CatRawException('', '', '')));

      final result = await getCatPageLimit(page, limit);

      expect(result.isLeft(), isTrue);
      expect(result.fold(id, id), isA<CatRawException>());
    });

    test('if limit <= 0, should return a left', () async {
      const page = 10;
      const limit = 0;

      when(mockCatRepository.getFromLimit(page, limit))
          .thenAnswer((_) async => Left(CatRawException('', '', '')));

      final result = await getCatPageLimit(page, limit);

      expect(result.isLeft(), isTrue);
      expect(result.fold(id, id), isA<CatRawException>());
    });

    test('if the result is a left, should return a left', () async {
      const page = 1;
      const limit = 10;

      when(mockCatRepository.getFromLimit(page, limit))
          .thenAnswer((_) async => Left(CatRawException('', '', '')));

      final result = await getCatPageLimit(page, limit);

      expect(result.isLeft(), isTrue);
      expect(result.fold(id, id), isA<CatRawException>());
    });
  });

  group('Success -', () {
    test('Should return a List<CatRaw>', () async {
      const page = 1;
      const limit = 10;

      when(mockCatRepository.getFromLimit(page, limit))
          .thenAnswer((_) async => const Right(<CatRaw>[]));

      final result = await getCatPageLimit(page, limit);

      expect(result.isRight(), isTrue);
      expect(result.fold(id, id), isA<List<CatRaw>>());
    });
  });
}
