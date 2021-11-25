import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:goodzone/controller/main/home/home_controller.dart';
import 'package:goodzone/core/appTextStyle/app_text_style.dart';
import 'package:goodzone/core/theme/appcolor.dart';
import 'package:goodzone/data/data_sourse/local_sourse.dart';
import 'package:goodzone/data/floor/entity/favorite_products.dart';
import 'package:goodzone/routes/app_routes.dart';
import 'package:goodzone/ui/main/home/product_detail/widgets/product_detail.dart';

class ProductData extends StatefulWidget {
  const ProductData({Key? key}) : super(key: key);

  @override
  _ProductDataState createState() => _ProductDataState();
}

class _ProductDataState extends State<ProductData> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (controller) {
      return Container(
        margin: const EdgeInsets.fromLTRB(16, 20, 0, 16),
        child: ListView.builder(
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (_, index) {
            var featured = controller.featureproducts[index];
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 25,
                  margin:const EdgeInsets.only(right: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        featured.title ?? '',
                        style: AppTextStyle.titleName,
                      ),
                      GestureDetector(
                        onTap: () {
                          if (index == 0) {
                            Get.toNamed(Routes.AllFORYOUPRODUCT);
                          }
                         if (index == 1) {
                            Get.toNamed(Routes.AllFAMOUSPRODUCT ,);
                          }
                          if (index == 2) {
                            Get.toNamed(Routes.AllNEWPRODUCTS);
                          }
                        },
                        child: const Text(
                          'Все',
                          style: AppTextStyle.allStyle,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: Get.height / 3 + 42,
                  child: ListView.builder(
                    physics:const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: featured.products?.length ?? 0,
                      itemBuilder: (context, index) {
                        var productPrice =
                            featured.products?[index].price?.price ?? 0;
                        var productName =
                            featured.products![index].category!.name;
                        var productText = featured.products![index].name;
                        var productImage = featured.products![index].image!;

                        return StreamBuilder<List<FavoriteProducts>>(
                            stream: LocalSource.getInstance()
                                .getAllFavoriteProducts(),
                            builder: (context, snapshot) {
                              bool hasFav = false;
                              if (snapshot.hasData) {
                                for (var element in snapshot.data!) {
                                  if (element.id ==
                                      (featured.products![index].id ?? '')) {
                                    hasFav = true;
                                  }
                                }
                              }
                              return GestureDetector(
                                child: Container(
                                  height: Get.height / 3 + 29,
                                  width: Get.width / 2 - 42,
                                  margin:
                                      const EdgeInsets.fromLTRB(0, 16, 16, 16),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: Get.height / 4 - 16,
                                        width: Get.height / 4 - 16,
                                        child: Card(
                                          shape: const RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(8))),
                                          margin: EdgeInsets.zero,
                                          child: Stack(
                                            children: [
                                              ClipRRect(
                                                borderRadius:
                                                    const BorderRadius.all(
                                                        Radius.circular(10)),
                                                child: CachedNetworkImage(
                                                  imageUrl: productImage,
                                                  errorWidget: (context, url, error) =>
                                                      const Icon(Icons.error),
                                                  placeholder: (context, url) =>
                                                      SizedBox(
                                                    height: Get.height / 5,
                                                    width: 70,
                                                    child: Center(
                                                      child: Image.asset(
                                                        'asset/png/logo.png',
                                                        color: Colors.grey,
                                                      ),
                                                    ),
                                                  ),
                                                  fit: BoxFit.fill,
                                                ),
                                              ),
                                              Positioned(
                                                top: 3,
                                                right: 3,
                                                child: Container(
                                                  height: 24,
                                                  width: 24,
                                                  decoration:
                                                      const BoxDecoration(
                                                          shape: BoxShape.circle,
                                                          color: AppColors.backgroundLike),
                                                  child: Center(
                                                    child: IconButton(
                                                      padding:
                                                        const  EdgeInsets.all(4),
                                                      splashRadius: 3,
                                                      icon: Icon(
                                                        Icons.favorite,
                                                        size: 17,
                                                        color: hasFav
                                                            ? AppColors.red
                                                            : AppColors.likeColor,
                                                      ),
                                                      onPressed: () {
                                                        if (!hasFav) {
                                                          LocalSource.getInstance().insertProduct(
                                                            FavoriteProducts(
                                                              id: featured.products![index].id ?? '',
                                                              text: '$productText',
                                                              price: '$productPrice',
                                                              image: productImage,
                                                              name: '$productName',
                                                            ),
                                                          );
                                                        } else if (hasFav) {
                                                          LocalSource.getInstance().deleteProduct(
                                                                  FavoriteProducts(
                                                            id: featured.products![index].id ?? '',
                                                            text: '$productText',
                                                            price: '$productPrice',
                                                            image: productImage,
                                                            name: '$productName',
                                                          ));
                                                          hasFav = false;
                                                        }
                                                      },
                                                    ),
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                      Container(
                                        margin:const EdgeInsets.only(top: 1),
                                        child: Text(
                                          '$productName',
                                          style: AppTextStyle.productsName,
                                        ),
                                      ),
                                      SizedBox(
                                        height: Get.height / 21 + 5,
                                        child: Text(
                                          '$productText',
                                          style: AppTextStyle.previewText,
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                      SizedBox(
                                        height: Get.height / 40,
                                        child: Text('$productPrice sum',
                                            style: AppTextStyle.productsPrice),
                                      ),
                                    ],
                                  ),
                                ),
                                onTap: () {
                                  Get.toNamed(
                                    Routes.FULLCONTENT,
                                    arguments: FullContentArgument(
                                        id: featured.products?[index].id ?? '',
                                        name: featured.products?[index].name ??''),
                                  );
                                },
                              );
                            });
                      }),
                ),
              ],
            );
          },
          itemCount: controller.featureproducts.length,
        ),
      );
    });
  }
}
