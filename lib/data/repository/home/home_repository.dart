
import 'package:dio/dio.dart';
import 'package:goodzone/base/base_repository.dart';
import 'package:goodzone/data/model/banner/banner_response.dart';
import 'package:goodzone/data/model/brand/brand.dart';
import 'package:goodzone/data/model/featured/featured_response.dart';
import 'package:goodzone/data/model/promo/promo_response.dart';
import 'package:goodzone/data/provider/api_client.dart';
import 'package:goodzone/data/provider/response_handler.dart';
import 'package:goodzone/data/provider/server_error.dart';

class HomeRepository extends BaseRepository {
  ApiClient? apiClient;

  HomeRepository({required this.apiClient}) : assert(apiClient != null);

  Future<ResponseHandler<BannerResponse>> _fetchBanners(
      {
        required int page,
        required int limit}
        ) async {
    BannerResponse response;
    try {
      response = await apiClient!.getBanners(page, limit);
    } catch (error, stacktrace) {
      print("Exception occurred: $error stacktrace: $stacktrace");
      return ResponseHandler()
        ..setException(ServerError.withError(error: error as DioError));
    }
    return ResponseHandler()..data = response;
  }

  Future<dynamic> getBanners() async {
    final response =
    await _fetchBanners(limit: 3, page: 1);
    if (response.data != null) {
      return response.data;
    } else if (response.getException()?.getErrorMessage() != "Canceled") {
      return await getErrorMessage(
          response.getException()?.getErrorMessage() ?? '');
    }
  }
 ///PromoResponse
  Future<ResponseHandler<PromoResponse>> _fetchPromos(
      {
        required int page,
        required int limit}
      ) async {
    PromoResponse response;
    try {
      response = await apiClient!.getPromos(page, limit);
    } catch (error, stacktrace) {
      print("Exception occurred: $error stacktrace: $stacktrace");
      return ResponseHandler()
        ..setException(ServerError.withError(error: error as DioError));
    }
    return ResponseHandler()..data = response;
  }
  Future<dynamic> getPromos() async {
    final response =
    await _fetchPromos(limit: 9, page: 1);
    if (response.data != null) {
      return response.data;
    } else if (response.getException()?.getErrorMessage() != "Canceled") {
      return await getErrorMessage(
          response.getException()?.getErrorMessage() ?? '');
    }
  }
  /// BrandResponse
  Future<ResponseHandler<BrandsResponse>> _fetchBrands(
      {
        required int page,
        required int limit}
      ) async {
    BrandsResponse response;
    try {
      response = await apiClient!.getBrands(page, limit);
    } catch (error, stacktrace) {
      print("Exception occurred: $error stacktrace: $stacktrace");
      return ResponseHandler()
        ..setException(ServerError.withError(error: error as DioError));
    }
    return ResponseHandler()..data = response;
  }
  Future<dynamic> getBrands() async {
    final response =
    await _fetchBrands(limit: 9, page: 1);
    if (response.data != null) {
      return response.data;
    } else if (response.getException()?.getErrorMessage() != "Canceled") {
      return await getErrorMessage(
          response.getException()?.getErrorMessage() ?? '');
    }
  }

  /// FeauturedProducts

  Future<ResponseHandler<FeaturedResponse>> _fetchFProducts(
      {
        required int page,
        required int limit}
      ) async {
    FeaturedResponse response;
    try {
      response = await apiClient!.getFeaturedList(page, limit);
    } catch (error, stacktrace) {
      print("Exception occurred: $error stacktrace: $stacktrace");
      return ResponseHandler()
        ..setException(ServerError.withError(error: error as DioError));
    }
    return ResponseHandler()..data = response;
  }
  Future<dynamic> getFProducts() async {
    final response =
    await _fetchFProducts(limit: 9, page: 1);
    if (response.data != null) {
      return response.data;
    } else if (response.getException()?.getErrorMessage() != "Canceled") {
      return await getErrorMessage(
          response.getException()?.getErrorMessage() ?? '');
    }
  }


}