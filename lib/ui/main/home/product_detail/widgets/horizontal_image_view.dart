import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:goodzone/controller/main/home/product_detail/product_detail_controller.dart';

class HorizontalImageView extends StatefulWidget {
  const HorizontalImageView({Key? key}) : super(key: key);

  @override
  _HorizontalImageViewState createState() => _HorizontalImageViewState();
}

class _HorizontalImageViewState extends State<HorizontalImageView> {
  @override
  Widget build(BuildContext context) {
    final height = Get.height;
    final width = Get.width;
    return GetBuilder<ProductDetailController>(builder: (controller) {
      return SizedBox(
        height: height / 8 - 10,
        child: ListView.builder(
          physics:const BouncingScrollPhysics(),
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: controller.product?.gallery?.length,
            itemBuilder: (context, index) {
              return Container(
                height: height / 8 - 10,
                width: width / 6 + 10,
                margin: EdgeInsets.only(right: 12),
                child: InkWell(
                  onTap: () {
                    controller.pageController
                        ?.jumpToPage(controller.onTapImage(index));

                  },
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: controller.imagePosition == index
                              ? Colors.black
                              : Colors.grey,
                          width: 1),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(6.0)),
                    ),
                    child: ClipRRect(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(6.0)),
                      child: CachedNetworkImage(
                        imageUrl: controller.product?.gallery?[index] ?? '',
                        width: width / 6 + 10,
                        height: height / 8 - 10,
                        placeholder: (context, url) => SizedBox(
                          height: height / 8 - 40,
                          width: 30,
                          child: Center(
                            child: Image.asset(
                              'asset/png/logo.png',
                              color: Colors.grey,
                            ),
                          ),
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              );
            }),
      );
    });
  }
}
