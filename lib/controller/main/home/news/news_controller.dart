import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:goodzone/base/base_controller.dart';
import 'package:goodzone/data/model/news/news_response.dart';
import 'package:goodzone/data/repository/new/new_respository.dart';

class NewsController extends BaseController{
  late final NewsRepository? repository;

  NewsController({required this.repository}) : assert(repository != null);

  List<News> _news =[];
  @override
  @override
  void onInit() {
    getNews();
    super.onInit();
  }

  Future<void> getNews() async {
    setLoading(true);
    final result = await repository?.getNews();
    if (result is NewsResponse) {
      _news = result.news??[];
      update();
    } else {
      showError(result);
    }
    setLoading(false);
  }
  List<News> get news => _news;
}