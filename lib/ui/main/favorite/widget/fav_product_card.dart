import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:goodzone/core/appTextStyle/app_text_style.dart';
import 'package:goodzone/core/theme/appcolor.dart';
import 'package:goodzone/data/data_sourse/local_sourse.dart';
import 'package:goodzone/data/floor/entity/favorite_products.dart';

class FavProductCard extends StatelessWidget {
  const FavProductCard({
    Key? key,
    required this.favProducts,
    required this.width,
    required this.height,
  }) : super(key: key);
  final FavoriteProducts favProducts;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: AppColors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: Get.height / 5 + 20,

            child: Card(
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                      Radius.circular(8))),

              child: Stack(children: [
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Image.network(
                    favProducts.image,
                    height: width,
                    width: width,
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
                        shape: BoxShape.circle, color: AppColors.backgroundLike),
                    child: Center(
                      child: IconButton(
                        padding: EdgeInsets.all(4),
                        splashRadius: 3,
                        icon: Icon(Icons.favorite, color: AppColors.red , size: 17,),
                        onPressed: () {
                          LocalSource.getInstance().deleteProduct(
                            FavoriteProducts(
                              id: favProducts.id,
                              text: favProducts.text,
                              price: favProducts.price,
                              image: favProducts.image,
                              name: favProducts.name,
                            ),
                          );
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
            margin: const EdgeInsets.fromLTRB(5, 1, 5, 1),
            child: Text(
              favProducts.name,
              style: AppTextStyle.productsName,
            ),
          ),
          Container(
            height: 40,
            margin: const EdgeInsets.fromLTRB(5, 1, 5, 1),
            child: Text(
              favProducts.text,
              style: AppTextStyle.previewText,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(5, 1, 5, 1),
            child: Text(
              '${favProducts.price} sum',
              style: AppTextStyle.productsPrice,
            ),
          ),
        ],
      ),
    );
  }
}
