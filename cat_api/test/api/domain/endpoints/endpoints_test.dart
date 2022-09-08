import 'package:cat_api/api/domain/endpoints/endpoints.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('fromPaginationAndLimit method should return a link', () {
    final url = Endpoints.fromPaginationAndLimit(1, 10);

    expect(url.startsWith('https://'), isTrue);
  });
}
