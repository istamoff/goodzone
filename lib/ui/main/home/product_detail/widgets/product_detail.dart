import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:goodzone/controller/main/home/product_detail/product_detail_controller.dart';
import 'package:goodzone/core/appTextStyle/app_text_style.dart';
import 'package:goodzone/core/theme/appcolor.dart';
import 'package:goodzone/data/data_sourse/local_sourse.dart';
import 'package:goodzone/data/floor/entity/favorite_products.dart';
import 'package:goodzone/ui/main/home/product_detail/widgets/build_content.dart';

class ProductDetail extends StatefulWidget {
  const ProductDetail({Key? key}) : super(key: key);

  @override
  _ProductDetailState createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail>
    with SingleTickerProviderStateMixin {
  var arguments = Get.arguments as FullContentArgument;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductDetailController>(builder: (controller) {
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          iconTheme: const IconThemeData(
            color: Colors.black, //change your color here
          ),
          elevation: 1,
          centerTitle: true,
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
            onPressed: () {
              Get.back();
            },
          ),
          title: Text(arguments.name, style: AppTextStyle.appBarNews),
          actions: <Widget>[
            StreamBuilder<List<FavoriteProducts>>(
              stream: LocalSource.getInstance().getAllFavoriteProducts(),
              builder: (_, snapshot) {
                bool isActive = false;
                if (snapshot.hasData) {
                  for (var element in snapshot.data!) {
                    if (element.id == arguments.id) {
                      isActive = true;
                    }
                  }
                  ;
                }
                return Center(
                  child: IconButton(
                    splashRadius: 8,
                    splashColor: AppColors.white,
                    onPressed: () {
                      if (isActive) {
                        LocalSource.getInstance().deleteProduct(
                            FavoriteProducts(
                                id: controller.product?.id ?? '',
                                image: controller.product?.image ?? '',
                                name: controller.product?.category?.name ?? '',
                                price: controller.product?.price?.price ?? '',
                                text: controller.product?.name ?? ''));
                        isActive = false;
                      } else {
                        LocalSource.getInstance().insertProduct(
                            FavoriteProducts(
                                id: controller.product?.id ?? '',
                                image: controller.product?.image ?? '',
                                name: controller.product?.category?.name ?? '',
                                price: controller.product?.price?.price ?? '',
                                text: controller.product?.name ?? ''));
                        isActive = true;
                      }
                    },
                    icon: Icon(
                        isActive ? Icons.favorite : Icons.favorite_border,
                        size: 24,
                        color: isActive ? AppColors.red : AppColors.black),
                  ),
                );
              },
            ),
          ],
        ),
        body: Stack(
          children: [
            const BuildContent(),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 70,
                width: double.infinity,
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16, 5, 16, 16),
                  child: SizedBox(
                    height: 40,
                    child: FlatButton(
                      onPressed: () async {},
                      child: Center(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              'asset/svg/ic_basket.svg',
                              width: 24,
                              height: 24,
                              color: Colors.white,
                            ),
                            const SizedBox(width: 12),
                            const Text(
                              'Перейти в корзину',
                              style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white),
                            )
                          ],
                        ),
                      ),
                      color: Colors.red,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0)),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}

class FullContentArgument {
  final String id;

  final String name;

  FullContentArgument({required this.id, required this.name});
}
