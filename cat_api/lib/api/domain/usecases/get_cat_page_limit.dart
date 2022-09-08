import 'package:dependency/dependency.dart';

import '../entities/cat_raw/cat_raw.dart';
import '../exceptions/cat_raw/cat_raw_exception.dart';
import '../repository/cat_repository.dart';

abstract class GetCatPageLimit {
  Future<Either<CatRawException, List<CatRaw>>> call(
    int page,
    int limit,
  );
}

class GetCatPageLimitImpl implements GetCatPageLimit {
  final CatRepository _repository;

  GetCatPageLimitImpl(this._repository);

  @override
  Future<Either<CatRawException, List<CatRaw>>> call(
      int page, int limit) async {
    if (page <= 0) {
      return Left(CatRawException(
        'usecase-error',
        'A paginação não pode ser igual ou menor que 0',
        '0',
      ));
    }

    if (limit <= 0) {
      return Left(CatRawException(
        'usecase-error',
        'O limite não pode ser igual ou menor que 0',
        '0',
      ));
    }

    return _repository.getFromLimit(page, limit);
  }
}
