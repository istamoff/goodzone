import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:goodzone/controller/main/home/product_detail/product_detail_controller.dart';
import 'package:goodzone/core/appTextStyle/app_text_style.dart';
import 'package:goodzone/core/theme/appcolor.dart';
import 'package:goodzone/data/data_sourse/local_sourse.dart';
import 'package:goodzone/data/floor/entity/favorite_products.dart';
import 'package:goodzone/routes/app_routes.dart';
import 'package:goodzone/ui/main/home/product_detail/widgets/product_detail.dart';

class HorizontalProductList extends StatelessWidget {
  const HorizontalProductList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = Get.height;
    final width = Get.width;
    return GetBuilder<ProductDetailController>(
      builder: (ctrl) {
        return ListView.builder(
          physics:const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount: ctrl.product?.relatedProducts?.length ?? 0,
            itemBuilder: (context, index) {
              var related = ctrl.product?.relatedProducts?[index];
              return StreamBuilder<List<FavoriteProducts>>(
                  stream: LocalSource.getInstance().getAllFavoriteProducts(),
                  builder: (context, snapshot) {
                    bool hasFav = false;
                    if (snapshot.hasData) {
                      for (var element in snapshot.data!) {
                        if (element.id == (related?.id ?? '')) {
                          hasFav = true;
                        }
                      }
                    }
                    return GestureDetector(
                      child: Container(
                        height: height / 3 + 29,
                        width: width / 2 - 42,
                        margin:
                        const EdgeInsets.fromLTRB(16, 16, 0, 16),
                        child: Column(
                          crossAxisAlignment:
                          CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: height / 4 - 16,
                              width: height / 4 - 16,
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
                                        imageUrl: related?.image??'',
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
                                                    id:  related?.id??'',
                                                    text: related?.name??'',
                                                    price: '${related?.price?.price??0}',
                                                    image: related?.image??'',
                                                    name: related?.category?.name??'',
                                                  ),
                                                );
                                              } else if (hasFav) {
                                                LocalSource.getInstance().deleteProduct(
                                                    FavoriteProducts(
                                                      id:  related?.id??'',
                                                      text: related?.name??'',
                                                      price: '${related?.price?.price??0}',
                                                      image: related?.image??'',
                                                      name: related?.category?.name??'',
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
                                related?.category?.name??'',
                                style: AppTextStyle.productsName,
                              ),
                            ),
                            SizedBox(
                              height: height / 21 + 5,
                              child: Text(
                                related?.name??'',
                                style: AppTextStyle.previewText,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            SizedBox(
                              height: height / 40,
                              child: Text('${related?.price?.price??0} sum',
                                  style: AppTextStyle.productsPrice),
                            ),
                          ],
                        ),
                      ),
                      onTap: () {
                        Get.toNamed(
                          Routes.FULLCONTENT,
                          arguments: FullContentArgument(
                              id: related?.id ?? '',
                              name: related?.category?.name ??''),
                        );
                      },
                    );
                  });
            });
      },
    );
  }
}

