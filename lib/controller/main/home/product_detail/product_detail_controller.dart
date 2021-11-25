import 'package:flutter/cupertino.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:goodzone/base/base_controller.dart';
import 'package:goodzone/data/model/product_id_page/product_id_page_response.dart';
import 'package:goodzone/data/repository/product_detail_page/product_detail_repository.dart';
import 'package:goodzone/ui/main/home/product_detail/widgets/product_detail.dart';

class ProductDetailController extends BaseController{
  final ProductDetailRepository repository;
  var arguments =Get.arguments as FullContentArgument;

  ProductDetailController({required this.repository , });

    var products;
    var imagePosition = 0;
  PageController? pageController;



  @override
  void onInit() {
     getProductId();
     pageController = PageController(
       keepPage: true,
       initialPage: 0,
     );

    super.onInit();
  }

  int onTapImage(var position ) {
     imagePosition = position;
     update();
     return imagePosition;
  }




  Future<void> getProductId() async {
    setLoading(true);
    final result = await repository.getProductsId(id: arguments.id);
    if (result is ProductIdPageResponse) {
      products = result.product!;
      if(product?.gallery != null){
        product?.gallery?.insert(0, product?.image??'');
      }
      else  {
        product?.gallery?.insert(0, product?.image??'');
      }
      update();
    } else {
      Get.snackbar('error', result.toString());
    }
    setLoading(false);
  }

  Product? get product => products;
}