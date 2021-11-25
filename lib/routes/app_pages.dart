
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:goodzone/binding/main/main_binding.dart';
import 'package:goodzone/binding/news/news_binding.dart';
import 'package:goodzone/binding/product_detail/product_detail.dart';
import 'package:goodzone/ui/main/favorite/like_page.dart';
import 'package:goodzone/ui/main/home/product_detail/widgets/all_related_products.dart';
import 'package:goodzone/ui/main/home/product_detail/widgets/image_tap.dart';
import 'package:goodzone/ui/main/home/product_detail/widgets/product_detail.dart';
import 'package:goodzone/ui/main/home/widgets/all_discount.dart';
import 'package:goodzone/ui/main/home/widgets/all_famous_products.dart';
import 'package:goodzone/ui/main/home/widgets/all_for_you_products.dart';
import 'package:goodzone/ui/main/home/widgets/all_new_products.dart';
import 'package:goodzone/ui/main/home/widgets/news_data.dart';
import 'package:goodzone/ui/main/main/main_page.dart';
import 'package:goodzone/ui/splash/splash_page.dart';

import 'app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(name: Routes.INITIAL, page: () => const SplashPage()),
    GetPage(name: Routes.MAIN, page: () => const MainPage(), binding: MainBinding()),
    GetPage(name: Routes.NEW, page: () => const NewData() , binding: NewsBinding()),
    GetPage(name: Routes.FAVORITE , page: () => const FavoritePage()),
    GetPage(name: Routes.DISCOUNT, page: () => const AllDiscountData()),
    GetPage(name: Routes.FULLCONTENT, page: () => const ProductDetail() , binding: ProductDetailBinding()),
    GetPage(name: Routes.AllFAMOUSPRODUCT, page: () => const AllFamousProduct() ),
    GetPage(name: Routes.AllNEWPRODUCTS, page: () => const AllNewProducts() ),
    GetPage(name: Routes.AllFORYOUPRODUCT, page: () => const AllForYouProducts() ),
    GetPage(name: Routes.IMAGETAP, page: ()=> ImageTap()),
    GetPage(name: Routes.RELATEDPRODUCTS, page: ()=> AllRelatedProducts()),
  ];
}
