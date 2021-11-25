import 'package:get/get.dart';
import 'package:goodzone/controller/main/home/news/news_controller.dart';
import 'package:goodzone/data/provider/api_client.dart';
import 'package:goodzone/data/repository/new/new_respository.dart';

class NewsBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => NewsController(repository: NewsRepository(apiClient: ApiClient.getInstance())), fenix: true);
  }

}
