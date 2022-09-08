import '../../../controllers/home/home_controller.dart';
import '../../../injectors/get_cat_page_limit/get_cat_page_limit_injector.dart';

class HomeInject {
  static HomeController controller() {
    final getCatPageLimit = GetCatPageLimitInjector();
    return HomeController(getCatPageLimit());
  }
}
