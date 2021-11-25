import 'package:dio/dio.dart';
import 'package:goodzone/core/constants/constants.dart';
import 'package:goodzone/data/model/banner/banner_response.dart';
import 'package:goodzone/data/model/brand/brand.dart';
import 'package:goodzone/data/model/featured/featured_response.dart';
import 'package:goodzone/data/model/news/news_response.dart';
import 'package:goodzone/data/model/product_id_page/product_id_page_response.dart';
import 'package:goodzone/data/model/product_id_page/shop_response.dart';
import 'package:goodzone/data/model/promo/promo_response.dart';
import 'package:retrofit/http.dart';

part 'api_client.g.dart';

@RestApi(baseUrl: Constants.baseUrl)
abstract class ApiClient {
  static get getDio {
    Dio dio = Dio(BaseOptions(followRedirects: false));

    dio.interceptors.add(
        LogInterceptor(responseBody: true, requestBody: true, request: true));
    return dio;
  }

  static CancelToken cancelToken = CancelToken();

  static ApiClient? _apiClient;

  static ApiClient getInstance({String baseUrl = Constants.baseUrl}) {
    if (_apiClient != null) {
      return _apiClient!;
    } else {
      _apiClient = ApiClient(getDio, baseUrl);
      return _apiClient!;
    }
  }

  factory ApiClient(Dio dio, String baseUrl) {
    dio.options = BaseOptions(receiveTimeout: 30000, connectTimeout: 30000);
    return _ApiClient(dio, baseUrl: baseUrl);
  }

  /// Get banner list
  @GET('banner')
  Future<BannerResponse> getBanners(
    @Query('page') int page,
    @Query('limit') int limit,
  );

  @GET('featured-list')
  Future<FeaturedResponse> getFeaturedList(
    @Query('page') int page,
    @Query('limit') int limit,
  );

  @GET('promo')
  Future<PromoResponse> getPromos(
    @Query('page') int page,
    @Query('limit') int limit,
  );

  @GET('brand')
  Future<BrandsResponse> getBrands(
    @Query('page') int page,
    @Query('limit') int limit,
  );

  @GET('new')
  Future<NewsResponse> getNews(
    @Query('page') int page,
    @Query('limit') int limit,
  );

  @GET('product/{product_id}')
  Future<ProductIdPageResponse> getProductId(
    @Path('product_id') String id,
  );

  @GET('product/{product_key}/shops')
  Future<ShopResponse> getShops(
    @Path('product_key') String id,
  );
}
