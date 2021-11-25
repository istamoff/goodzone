
import 'package:dio/dio.dart';
import 'package:goodzone/base/base_repository.dart';
import 'package:goodzone/data/model/product_id_page/product_id_page_response.dart';
import 'package:goodzone/data/provider/api_client.dart';
import 'package:goodzone/data/provider/response_handler.dart';
import 'package:goodzone/data/provider/server_error.dart';

class ProductDetailRepository extends BaseRepository{

  ApiClient? apiClient;
  ProductDetailRepository({required this.apiClient}) : assert(apiClient != null);

  Future<ResponseHandler<ProductIdPageResponse>> _fetchProductId(
      {
        required String id,
        }
      ) async {
    ProductIdPageResponse response;
    try {
      response = await apiClient!.getProductId(id);
    } catch (error, stacktrace) {
      print("Exception occurred: $error stacktrace: $stacktrace");
      return ResponseHandler()
        ..setException(ServerError.withError(error: error as DioError));
    }
    return ResponseHandler()..data = response;
  }

  Future<dynamic> getProductsId({required String id}) async {
    final response =
    await _fetchProductId(id: id);
    if (response.data != null) {
      return response.data;
    } else if (response.getException()?.getErrorMessage() != "Canceled") {
      return await getErrorMessage(
          response.getException()?.getErrorMessage() ?? '');
    }
  }

}