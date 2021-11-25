import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:goodzone/controller/splash/splash_controller.dart';

class SplashPage extends GetView<SplashController> {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(
      builder: (controller) => Scaffold(
        body: Center(
          child: Image.asset(
            'asset/png/logo.png',
            height: Get.height/3,
            width:  Get.height/3,
          ),
        ),
      ),
    );
  }
}
