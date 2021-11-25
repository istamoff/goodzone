import 'package:get/get.dart';
import 'package:goodzone/base/base_controller.dart';
import 'package:goodzone/routes/app_routes.dart';

class SplashController extends BaseController {
  @override
  void onInit() {
    Future.delayed(const Duration(milliseconds: 1500), () {
      Get.offNamed(Routes.MAIN);
    });
    super.onInit();
  }
}
