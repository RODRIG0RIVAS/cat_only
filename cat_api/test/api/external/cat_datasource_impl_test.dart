import 'package:cat_api/cat_api.dart';
import 'package:cat_api/api/domain/endpoints/keys.dart';
import 'package:cat_api/api/domain/endpoints/endpoints.dart';
import 'package:cat_api/api/domain/exceptions/cat_raw/cat_raw_exception.dart';
import 'package:core/core.dart';

import 'package:dependency/dependency.dart';

import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:flutter_test/flutter_test.dart';

import '../infra/cat_raw_reference.dart';
import 'cat_datasource_impl_test.mocks.dart';

@GenerateMocks([Client])
void main() {
  late String urlWithPaginationAndLimit;

  late MockClient mockClient;
  late HandleHttpErrorCode handleHttpErrorCode;
  late CatDatasourceImpl datasource;

  const page = 1;
  const limit = 10;

  setUp(() {
    urlWithPaginationAndLimit = Endpoints.fromPaginationAndLimit(
      page,
      limit,
    );

    mockClient = MockClient();
    handleHttpErrorCode = HandleHttpErrorCodeImpl();
    datasource = CatDatasourceImpl(mockClient, handleHttpErrorCode);
  });

  group('Errors -', () {
    test(
      'Should return a error Response if occurs some server error and throw a CatRawException',
      () async {
        when(
          mockClient.get(
            Uri.parse(urlWithPaginationAndLimit),
            headers: {
              'Content-type': 'application/json',
              'x-api-key': Keys.xApiKey,
            },
          ),
        ).thenAnswer((_) async => Response('{}', 404));

        // final result = await datasource.getFromLimit(page, limit);

        expect(() async => datasource.getFromLimit(page, limit),
            throwsA(isA<CatRawException>()));
      },
    );

    test('Should throw a CatRawException if occurs a ClientException',
        () async {
      when(
        mockClient.get(
          Uri.parse(urlWithPaginationAndLimit),
          headers: {
            'Content-type': 'application/json',
            'x-api-key': Keys.xApiKey,
          },
        ),
      ).thenThrow(ClientException('message'));

      // final result = await datasource.getFromLimit(page, limit);

      expect(() async => datasource.getFromLimit(page, limit),
          throwsA(isA<CatRawException>()));
    });
  });

  group('Success -', () {
    test('Should return a List<CatRaw>', () async {
      when(
        mockClient.get(
          Uri.parse(urlWithPaginationAndLimit),
          headers: {
            'Content-type': 'application/json',
            'x-api-key': Keys.xApiKey,
          },
        ),
      ).thenAnswer((_) async => Response(catRawListJson, 200));

      final result = await datasource.getFromLimit(page, limit);

      expect(result, isA<List<CatRaw>>());
    });
  });
}
