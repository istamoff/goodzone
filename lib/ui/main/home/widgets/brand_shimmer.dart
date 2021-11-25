import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class BrandLoading extends StatelessWidget {
  const BrandLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height =Get.height;
    final width = Get.width;
    return Shimmer.fromColors(
      baseColor: Colors.white10,
      highlightColor: Colors.grey,
        child: Container(
          height: height/10+6,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              Container(
                width: width/6+10,
                margin: const EdgeInsets.fromLTRB(16, 0, 0, 0),
                decoration: const BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.all(Radius.circular(5))
                ),

              ),
              Container(
                width: width/6+10,
                margin: const EdgeInsets.fromLTRB(16, 0, 0, 0),
                decoration: const BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.all(Radius.circular(5))
                ),

              ),
              Container(
                width: width/6+10,
                margin: const EdgeInsets.fromLTRB(16, 0, 0, 0),
                decoration: const BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.all(Radius.circular(5))
                ),

              ),
              Container(
                width: width/6+10,
                height: height/10+6,
                margin: const EdgeInsets.fromLTRB(16, 0, 0, 0),
                decoration: const BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.all(Radius.circular(5))
                ),

              ),
              Container(
                width: width/6+10,
                height: height/10+6,
                margin: const EdgeInsets.fromLTRB(16, 0, 0, 0),
                decoration: const BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.all(Radius.circular(5))
                ),

              ),
              Container(
                width: width/6+10,
                height: height/10+6,
                margin: const EdgeInsets.fromLTRB(16, 0, 0, 0),
                decoration: const BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.all(Radius.circular(5))
                ),

              ),



            ],
          ),
        ),
    );
  }
}
