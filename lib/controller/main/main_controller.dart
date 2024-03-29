
import 'package:goodzone/base/base_controller.dart';

class MainController extends BaseController {
  BottomMenu _bottomMenu = BottomMenu.HOME;

  void setMenu(BottomMenu menu) {
    _bottomMenu = menu;
    update();
  }

  BottomMenu get bottomMenu => _bottomMenu;
}

enum BottomMenu { HOME, SEARCH,SHOPPING,LIKE , PROFILE }
