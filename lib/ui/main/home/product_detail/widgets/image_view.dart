import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:goodzone/controller/main/home/product_detail/product_detail_controller.dart';
import 'package:goodzone/routes/app_routes.dart';
import 'package:goodzone/ui/main/home/product_detail/widgets/product_detail.dart';
import 'package:photo_view/photo_view_gallery.dart';

class ImageView extends StatefulWidget {
  const ImageView({Key? key}) : super(key: key);

  @override
  _ImageViewState createState() => _ImageViewState();
}

class _ImageViewState extends State<ImageView> {


  @override
  Widget build(BuildContext context) {
    final height = Get.height;
    return GetBuilder<ProductDetailController>(
      builder: (controller) {
        return Stack(
          children: [
            Align(
                alignment: Alignment.center,
                child: SizedBox(
                  height: height / 3 - 3,
                  child: PhotoViewGallery(
                    pageOptions: controller.product?.gallery != null
                        ? controller.product?.gallery!
                        .map<PhotoViewGalleryPageOptions>((String path) {
                      return PhotoViewGalleryPageOptions.customChild(
                          basePosition: Alignment.center,
                          minScale: 0.99,
                          maxScale: 1.01,
                          child: GestureDetector(
                            onTap: (){

                              Get.toNamed(Routes.IMAGETAP
                                  ,
                                  arguments: FullContentArgument(
                                      id: controller.products?.id ?? '',
                                      name: controller.products?.name ??'' ));

                            },
                            child: CachedNetworkImage(
                              imageUrl: path,
                              height: height / 3 - 3,
                              width: double.infinity,
                              placeholder: (context, url) =>    SizedBox(
                                height: height/3-40,  width: 50,
                                child: Center(
                                  child:  Image.asset('asset/png/logo.png',color: Colors.grey,),
                                ),
                              ),
                            ),
                          ));
                    }).toList()
                        : [],
                    reverse: false,
                    backgroundDecoration:
                    const BoxDecoration(color: Colors.white),
                    pageController: controller.pageController,
                    scrollPhysics: const BouncingScrollPhysics(),
                    onPageChanged: (int index) {
                      controller.pageController
                          ?.jumpToPage(controller.onTapImage(index));
                    },
                  ),
                )),
          ],
        );
      },
    );
  }
}

