import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:goodzone/controller/main/home/home_controller.dart';
import 'package:goodzone/core/appTextStyle/app_text_style.dart';
import 'package:goodzone/core/appbar/appbar.dart';
import 'package:goodzone/core/theme/appcolor.dart';
import 'package:goodzone/routes/app_routes.dart';
import 'package:goodzone/ui/main/home/widgets/brand_data.dart';
import 'package:goodzone/ui/main/home/widgets/carousel_data.dart';
import 'package:goodzone/ui/main/home/widgets/carousel_shimmer.dart';
import 'package:goodzone/ui/main/home/widgets/featured_shimmer.dart';
import 'package:goodzone/ui/main/home/widgets/featured_product_data.dart';
import 'package:goodzone/ui/main/home/widgets/promo_data.dart';
import 'package:goodzone/ui/main/home/widgets/promo_shimmer.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const GoodzoneAppbar(
        icon: 'asset/svg/ic_notifications.svg',
      ),
      body: GetBuilder<HomeController>(
        builder: (logic) {
          return SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                logic.isLoading
                    ? const CarouselLoading()
                    : CarosulData(carouselList: logic.banners),
                Container(
                  margin: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                  height: 25,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Скидка',
                        style: AppTextStyle.titleName,
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.toNamed(Routes.DISCOUNT);
                        },
                        child: const Text(
                          'Все',
                          style: AppTextStyle.allStyle,
                        ),
                      ),
                    ],
                  ),
                ),
                logic.isLoading ? const PromoLoading() : const PromoData(),
                logic.isLoading
                    ? const FeaturedLoading()
                    : const ProductData(),
                const BrandData(),
              ],
            ),
          );
        },
      ),
    );
  }
}
