import 'package:cat_api/cat_api.dart';
import 'package:core/core.dart';
import 'package:dependency/dependency.dart';

class GetCatPageLimitInjector {
  GetCatPageLimitImpl call() {
    final httpClient = Client();
    final handleHttpErrorCode = HandleHttpErrorCodeImpl();
    final catDatasource = CatDatasourceImpl(httpClient, handleHttpErrorCode);
    final catRepository = CatRepositoryImpl(catDatasource);
    return GetCatPageLimitImpl(catRepository);
  }
}
