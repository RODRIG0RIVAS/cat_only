import '../../domain/entities/cat_raw/cat_raw.dart';

abstract class CatDatasource {
  Future<List<CatRaw>> getFromLimit(int page, int limit);
}
