import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:goodzone/controller/main/home/home_controller.dart';
import 'package:goodzone/core/appTextStyle/app_text_style.dart';
import 'package:goodzone/core/theme/appcolor.dart';
import 'package:goodzone/data/data_sourse/local_sourse.dart';
import 'package:goodzone/data/floor/entity/favorite_products.dart';
import 'package:goodzone/routes/app_routes.dart';
import 'package:goodzone/ui/main/home/product_detail/widgets/product_detail.dart';

class AllFamousProduct extends StatelessWidget {
  const AllFamousProduct({Key? key, }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var indexs = 1;
    var width = (Get.width - 48) / 2;
    var height = width + 63;
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: AppColors.white,
        title: const Text(
          'Известный продукт',
          style: AppTextStyle.appBarNews,
        ),
        centerTitle: true,
        leading: IconButton(
          splashRadius: 1,
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: GetBuilder<HomeController>(
        builder: (nlogic) {
          var featured = nlogic.featureproducts[indexs];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            child: GridView.builder(
              physics:const BouncingScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: width / height,
              ),
              itemBuilder: (context, index) {
                var productPrice = featured.products?[index].price?.price ?? 0;
                var productName = featured.products![index].category!.name;
                var productText = featured.products![index].name;
                var productImage = featured.products![index].image!;

                return StreamBuilder<List<FavoriteProducts>>(
                    stream: LocalSource.getInstance().getAllFavoriteProducts(),
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
                      return InkWell(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: width,
                              width: width,
                              child: Card(
                                shape: const RoundedRectangleBorder(
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(8))),
                                child: Stack(children: [
                                  Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: CachedNetworkImage(
                                      imageUrl: productImage,
                                      errorWidget: (context, url, error) =>
                                      const Icon(Icons.error),
                                      placeholder: (context, url) => SizedBox(
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
                                      decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: AppColors.backgroundLike),
                                      child: Center(
                                        child: IconButton(
                                          padding:const EdgeInsets.all(4),
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
                                              LocalSource.getInstance()
                                                  .insertProduct(
                                                FavoriteProducts(
                                                  id: featured
                                                      .products![index].id ??
                                                      '',
                                                  text: '$productText',
                                                  price: '$productPrice',
                                                  image: productImage,
                                                  name: '$productName',
                                                ),
                                              );
                                            } else if (hasFav) {
                                              LocalSource.getInstance()
                                                  .deleteProduct(FavoriteProducts(
                                                id: featured
                                                    .products![index].id ??
                                                    '',
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
                                  ),
                                ]),
                              ),
                            ),
                            Container(
                              height: 13,
                              margin: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                              child: Text(
                                '$productName',
                                style: AppTextStyle.productsName,
                              ),
                            ),
                            Container(
                              height: 40,
                              margin: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                              child: Text(
                                '$productText',
                                style: AppTextStyle.previewText,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                              child: Text(
                                '$productPrice sum',
                                style: AppTextStyle.productsPrice,
                              ),
                            ),
                          ],
                        ),
                        onTap: (){
                          Get.toNamed(Routes.FULLCONTENT ,
                              arguments: FullContentArgument(id: featured.products?[index].id??'', name: productName??''));
                        },
                      );
                    });
              },
              itemCount: nlogic.featureproducts[indexs].products?.length,
            ),
          );
        },
      ),
    );
  }


}
