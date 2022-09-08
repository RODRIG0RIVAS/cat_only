import 'package:cat_api/api/domain/entities/cat_raw/cat_raw.dart';
import 'package:cat_api/api/infra/adapters/cat_raw/cat_raw_adapter.dart';
import 'package:flutter_test/flutter_test.dart';

import '../cat_raw_reference.dart';

void main() {
  group('Error -', () {
    test('fromMap should return an empty CatRaw if an empty map is given', () {
      final catRaw = CatRawAdapter.fromMap({});
      expect(catRaw.id, equals(''));
      expect(catRaw.url, equals(''));
      expect(catRaw.width, equals(0));
      expect(catRaw.height, equals(0));
    });

    test('fromJson should return an empty CatRaw if an empty map is given', () {
      final catRaw = CatRawAdapter.fromJson('{}');
      expect(catRaw.id, equals(''));
      expect(catRaw.url, equals(''));
      expect(catRaw.width, equals(0));
      expect(catRaw.height, equals(0));
    });
  });

  group('Success -', () {
    test('fromMap should return a CatRaw', () {
      final catRaw = CatRawAdapter.fromMap(catRawMap);
      expect(catRaw, isA<CatRaw>());
    });

    test('fromJson should return a CatRaw', () {
      final catRaw = CatRawAdapter.fromJson(catRawJson);
      expect(catRaw, isA<CatRaw>());
    });

    test('toMap should return a Map<String, dynamic>', () {
      final catRaw = CatRawAdapter.toMap(catRawTest);
      expect(catRaw, isA<Map<String, dynamic>>());
    });
  });
}
