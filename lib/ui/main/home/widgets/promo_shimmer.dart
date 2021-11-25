import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:goodzone/core/theme/appcolor.dart';
import 'package:shimmer/shimmer.dart';
import 'package:get/get.dart';

class PromoLoading extends StatelessWidget {
  const PromoLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = Get.height;
    final width = Get.width;
    return Shimmer.fromColors(
      baseColor: AppColors.productNameColor,
      highlightColor: Colors.white,
      child: SizedBox(
        height: height / 5 + 45,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            Container(
              width: width - 170,
              margin: const EdgeInsets.fromLTRB(16, 16, 0, 16),
              decoration: const BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.all(Radius.circular(10))),
            ),
            Container(
              width: width - 170,
              margin: const EdgeInsets.fromLTRB(16, 16, 16, 16),
              decoration: const BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.all(Radius.circular(10))),
            ),
          ],
        ),
      ),
    );
  }
}
