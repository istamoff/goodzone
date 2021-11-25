import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:goodzone/controller/main/home/home_controller.dart';

class BrandData extends StatelessWidget {
  const BrandData({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = Get.height;
    final width = Get.width;
    final controller = Get.find<HomeController>();
    return GetBuilder<HomeController>(
      builder: (controller) {
        return SizedBox(
          height: height / 10 + 6,
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount: controller.brands.length,
            itemBuilder: (context, index) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    margin: const EdgeInsets.fromLTRB(16, 0, 0, 0),
                    child: ClipRRect(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(0)),
                      child: CachedNetworkImage(
                        imageUrl: controller.brands[index].image!,
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                        placeholder: (context, url) => SizedBox(
                          height: height / 12,
                          width: 20,
                          child: Center(
                            child: Image.asset(
                              'asset/png/logo.png',
                              color: Colors.grey,
                            ),
                          ),
                        ),
                        fit: BoxFit.fill,
                        height: height / 10 + 6,
                        width: width / 6 + 10,
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        );
      },
    );
  }
}
