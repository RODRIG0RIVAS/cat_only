import 'package:cat_api/cat_api.dart';
import 'package:flutter/material.dart';

class HomeController extends ChangeNotifier {
  final GetCatPageLimit _getCatPageLimit;

  final _cats = ValueNotifier<List<CatRaw>>([]);
  List<CatRaw> get cats => _cats.value;

  final _hasError = ValueNotifier<bool>(true);
  bool get hasError => _hasError.value;

  final _isLoading = ValueNotifier<bool>(false);
  bool get isLoading => _isLoading.value;

  CrossFadeState get crossFadeStateFromLoading =>
      _isLoading.value ? CrossFadeState.showSecond : CrossFadeState.showFirst;

  int actualPage = 0;

  HomeController(this._getCatPageLimit);

  Future<void> getCatPageLimit(int page) async {
    final result = await _getCatPageLimit(page, 10);

    result.fold((exception) {
      setHasError(true);
    }, (list) {
      _cats.value.addAll(list);
      setHasError(false);
    });

    notifyListeners();
  }

  void setCatList(List<CatRaw> list) {
    _cats.value = list;
    notifyListeners();
  }

  void setIsLoading(bool value) {
    _isLoading.value = value;
    notifyListeners();
  }

  void setHasError(bool value) {
    _hasError.value = value;
    notifyListeners();
  }

  bool isLastCat(int index) => index == cats.length - 1;

  Future<void> moreCatsOnPressed() async {
    setIsLoading(true);
    actualPage++;
    await getCatPageLimit(actualPage);

    if (hasError) {
      actualPage--;
    }

    setIsLoading(false);
  }
}
