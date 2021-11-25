import 'package:dio/dio.dart';
import 'package:goodzone/base/base_repository.dart';
import 'package:goodzone/data/model/news/news_response.dart';
import 'package:goodzone/data/provider/api_client.dart';
import 'package:goodzone/data/provider/response_handler.dart';
import 'package:goodzone/data/provider/server_error.dart';

class NewsRepository extends BaseRepository{
  ApiClient? apiClient;
  NewsRepository({required this.apiClient}) : assert(apiClient != null);

  Future<ResponseHandler<NewsResponse>> _fetchNews(
      {
        required int page,
        required int limit}
      ) async {
    NewsResponse response;
    try {
      response = await apiClient!.getNews(page, limit);
    } catch (error, stacktrace) {
      print("Exception occurred: $error stacktrace: $stacktrace");
      return ResponseHandler()
        ..setException(ServerError.withError(error: error as DioError));
    }
    return ResponseHandler()..data = response;
  }

  Future<dynamic> getNews() async {
    final response =
    await _fetchNews(limit: 6, page: 1);
    if (response.data != null) {
      return response.data;
    } else if (response.getException()?.getErrorMessage() != "Canceled") {
      return await getErrorMessage(
          response.getException()?.getErrorMessage() ?? '');
    }
  }
}