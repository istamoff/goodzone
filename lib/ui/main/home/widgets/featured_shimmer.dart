 import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:goodzone/core/theme/appcolor.dart';
import 'package:shimmer/shimmer.dart';

class FeaturedLoading extends StatelessWidget {
  const FeaturedLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColors.productNameColor,
      highlightColor: Colors.white,
      child:   Container(
        margin: const EdgeInsets.fromLTRB(16, 0, 0, 16),
        child: ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 3,
          itemBuilder: (_, index) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: Get.height - 473.7,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: AppColors.white),
                          height: Get.height - 473.7,
                          width: Get.width / 2 - 42,
                                margin: const EdgeInsets.fromLTRB(0, 16, 16, 16),
                              );
                            }
                      ),
                ),
              ],
            );
          },
        ),
      ),


    );
  }
}
