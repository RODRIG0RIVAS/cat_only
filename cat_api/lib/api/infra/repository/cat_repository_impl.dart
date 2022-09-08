import 'package:dependency/dependency.dart';

import '../../domain/entities/cat_raw/cat_raw.dart';
import '../../domain/exceptions/cat_raw/cat_raw_exception.dart';
import '../../domain/repository/cat_repository.dart';
import '../datasource/cat_datasource.dart';

class CatRepositoryImpl implements CatRepository {
  final CatDatasource _datasource;

  CatRepositoryImpl(this._datasource);

  @override
  Future<Either<CatRawException, List<CatRaw>>> getFromLimit(
    int page,
    int limit,
  ) async {
    try {
      final result = await _datasource.getFromLimit(page, limit);

      return Right(result);
    } on CatRawException catch (e) {
      return Left(e);
    }
  }
}
