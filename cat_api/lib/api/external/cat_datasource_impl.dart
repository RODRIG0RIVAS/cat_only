import 'dart:convert';

import 'package:core/core.dart';
import 'package:dependency/dependency.dart';

import '../domain/endpoints/keys.dart';
import '../domain/endpoints/endpoints.dart';
import '../infra/datasource/cat_datasource.dart';
import '../domain/entities/cat_raw/cat_raw.dart';
import '../infra/adapters/cat_raw/cat_raw_adapter.dart';
import '../domain/exceptions/cat_raw/cat_raw_exception.dart';

class CatDatasourceImpl implements CatDatasource {
  final Client _client;
  final HandleHttpErrorCode _handleHttpErrorCode;

  CatDatasourceImpl(this._client, this._handleHttpErrorCode);

  @override
  Future<List<CatRaw>> getFromLimit(int page, int limit) async {
    try {
      final response = await _client.get(
          Uri.parse(Endpoints.fromPaginationAndLimit(page, limit)),
          headers: {
            'Content-type': 'application/json',
            'x-api-key': Keys.xApiKey,
          });

      return _handleHttpErrorCode(response: response).fold((failure) {
        throw CatRawException(
          failure.serverMessage,
          failure.userMessage,
          failure.code,
        );
      }, (noFailure) {
        final list = jsonDecode(response.body) as List;

        return list.map((element) {
          return CatRawAdapter.fromMap(element);
        }).toList();
      });
    } on ClientException catch (e) {
      throw CatRawException(
        e.message,
        'Erro ao trazer os gatos :(',
        '0',
      );
    }
  }
}
