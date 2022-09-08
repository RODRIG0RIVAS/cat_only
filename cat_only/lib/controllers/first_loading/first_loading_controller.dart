import 'package:cat_api/cat_api.dart';
import 'package:flutter/widgets.dart';

class FirstLoadingController extends ChangeNotifier {
  final GetCatPageLimit _getCatPageLimit;
  List<CatRaw> catList = [];

  final _hasError = ValueNotifier<bool>(true);
  bool get hasError => _hasError.value;

  FirstLoadingController(this._getCatPageLimit);

  Future<void> getCatePageLimit() async {
    final result = await _getCatPageLimit(1, 10);

    result.fold((exception) {
      _hasError.value = true;
    }, (list) {
      catList = list;
      _hasError.value = false;
    });
  }
}
