import 'package:cat_api/api/domain/exceptions/cat_raw/cat_raw_exception.dart';
import 'package:cat_api/cat_api.dart';
import 'package:dependency/dependency.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'cat_repository_impl_test.mocks.dart';

@GenerateMocks([CatDatasourceImpl])
void main() {
  late MockCatDatasourceImpl mockDatasource;
  late CatRepositoryImpl repository;

  const page = 1;
  const limit = 10;

  setUp(() {
    mockDatasource = MockCatDatasourceImpl();
    repository = CatRepositoryImpl(mockDatasource);
  });

  test(
      'Should return a Left with CatRawException if datasource throw some exception',
      () async {
    when(mockDatasource.getFromLimit(page, limit))
        .thenThrow(CatRawException('', '', ''));

    final result = await repository.getFromLimit(page, limit);

    expect(result.isLeft(), true);
    expect(result.fold(id, id), isA<CatRawException>());
  });

  test('Should return a Right with  List<CatRaw>', () async {
    when(mockDatasource.getFromLimit(page, limit))
        .thenAnswer((_) async => <CatRaw>[]);

    final result = await repository.getFromLimit(page, limit);

    expect(result.isRight(), true);
    expect(result.fold(id, id), isA<List<CatRaw>>());
  });
}
