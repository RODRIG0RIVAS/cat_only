import 'package:cat_api/api/domain/entities/cat_raw/cat_raw.dart';
import 'package:cat_api/api/domain/exceptions/cat_raw/cat_raw_exception.dart';
import 'package:dependency/dependency.dart';

abstract class CatRepository {
  Future<Either<CatRawException, List<CatRaw>>> getFromLimit(
    int page,
    int limit,
  );
}
