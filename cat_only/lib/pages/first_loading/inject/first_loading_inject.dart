import '../../../controllers/first_loading/first_loading_controller.dart';
import '../../../injectors/get_cat_page_limit/get_cat_page_limit_injector.dart';

class FirstLoadingInject {
  static FirstLoadingController controller() {
    final getCatPageLimit = GetCatPageLimitInjector();
    return FirstLoadingController(getCatPageLimit());
  }
}
