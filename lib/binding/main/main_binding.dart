import 'package:get/get.dart';
import 'package:goodzone/controller/main/home/home_controller.dart';
import 'package:goodzone/controller/main/main_controller.dart';
import 'package:goodzone/controller/splash/splash_controller.dart';
import 'package:goodzone/data/provider/api_client.dart';
import 'package:goodzone/data/repository/home/home_repository.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SplashController());

    Get.lazyPut(() => MainController(), fenix: true);
    Get.lazyPut(
        () => HomeController(
            repository: HomeRepository(apiClient: ApiClient.getInstance())),
        fenix: true);
  }
}
