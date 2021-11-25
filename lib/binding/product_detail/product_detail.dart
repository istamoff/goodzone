import 'package:get/get.dart';
import 'package:goodzone/controller/main/home/product_detail/product_detail_controller.dart';
import 'package:goodzone/controller/main/home/product_detail/shops_controller.dart';
import 'package:goodzone/data/provider/api_client.dart';
import 'package:goodzone/data/repository/product_detail_page/product_detail_repository.dart';
import 'package:goodzone/data/repository/product_detail_page/shop_repository.dart';

class ProductDetailBinding extends Bindings{
  @override
  void dependencies() {
  Get.lazyPut(() => ProductDetailController(repository: ProductDetailRepository(apiClient: ApiClient.getInstance())), fenix: true);
  Get.lazyPut(() => ShopsController(repository: ShopRepository(apiClient: ApiClient.getInstance())),fenix: true);


  }

}