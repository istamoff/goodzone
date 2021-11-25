import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:goodzone/controller/main/home/product_detail/product_detail_controller.dart';
import 'package:goodzone/core/appTextStyle/app_text_style.dart';
import 'package:goodzone/core/theme/appcolor.dart';
import 'package:goodzone/data/data_sourse/local_sourse.dart';
import 'package:goodzone/data/floor/entity/favorite_products.dart';

import 'horizontal_image_view.dart';
import 'image_view.dart';

class ImageTap extends StatelessWidget {
  ImageTap({Key? key}) : super(key: key);

  final ProductDetailController ctrl = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
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
        title: Text(ctrl.product?.category?.name ?? '',
            style: AppTextStyle.appBarNews),
        actions: <Widget>[
          StreamBuilder<List<FavoriteProducts>>(
            stream: LocalSource.getInstance().getAllFavoriteProducts(),
            builder: (_, snapshot) {
              bool isActive = false;
              if (snapshot.hasData) {
                for (var element in snapshot.data!) {
                  if (element.id == ctrl.product?.id) {
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
                      LocalSource.getInstance().deleteProduct(FavoriteProducts(
                          id: ctrl.product?.id ?? '',
                          image: ctrl.product?.image ?? '',
                          name: ctrl.product?.category?.name ?? '',
                          price: ctrl.product?.price?.price ?? '',
                          text: ctrl.product?.name ?? ''));
                      isActive = false;
                    } else {
                      LocalSource.getInstance().insertProduct(FavoriteProducts(
                          id: ctrl.product?.id ?? '',
                          image: ctrl.product?.image ?? '',
                          name: ctrl.product?.category?.name ?? '',
                          price: ctrl.product?.price?.price ?? '',
                          text: ctrl.product?.name ?? ''));
                      isActive = true;
                    }
                  },
                  icon: Icon(isActive ? Icons.favorite : Icons.favorite_border,
                      size: 24,
                      color: isActive ? AppColors.red : AppColors.black),
                ),
              );
            },
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          ImageView(),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 40),
            child: Center(child: HorizontalImageView()),
          ),
        ],
      ),
    );
  }
}
