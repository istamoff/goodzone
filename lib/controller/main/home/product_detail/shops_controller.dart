import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:goodzone/base/base_controller.dart';
import 'package:goodzone/data/model/product_id_page/shop_response.dart';
import 'package:goodzone/data/repository/product_detail_page/shop_repository.dart';
import 'package:goodzone/ui/main/home/product_detail/widgets/product_detail.dart';

class ShopsController extends BaseController{
  final ShopRepository repository;
  var arguments =Get.arguments as FullContentArgument;
  ShopsController({required this.repository , });



  List<Shops> _shops = [];
  @override
  void onInit() {
    getShopsId();


    super.onInit();
  }

  Future<void> getShopsId() async {
    setLoading(true);
    final result = await repository.getShopsId(id:arguments.id );
    if (result is ShopResponse) {
      _shops = result.shops??[];

      update();
    } else {
      Get.snackbar('error', result.toString());
    }
    setLoading(false);
  }

  List<Shops> get shops => _shops;
}