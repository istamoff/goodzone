import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:goodzone/core/theme/appcolor.dart';
import 'package:shimmer/shimmer.dart';

class CarouselLoading extends StatelessWidget{
  const CarouselLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      highlightColor: Colors.white,
      baseColor: AppColors.productNameColor,
      child: Container(
        height: Get.height/5+40,
        width:  Get.width-24,
        margin: const EdgeInsets.fromLTRB(16, 16, 16, 16),
        child: ClipRRect(
          borderRadius:const BorderRadius.all(Radius.circular(10)),
          child: Container(
            color: AppColors.productNameColor,
          ),
        ),
      ),
    );
  }

}