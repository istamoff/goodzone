import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:goodzone/core/appbar/appbar.dart';

class ShoppingPage extends StatelessWidget {
  const ShoppingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = Get.width / 2 + 60;
    final height = Get.height / 3 + 37;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const GoodzoneAppbar(icon: 'asset/svg/ic_delete.svg'),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'asset/png/ic_empty_basket.png',
            height: height,
            width: width,
          ),
          const SizedBox(height: 30),
          const Text(
            'У вас еще нет таких товаров',
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          )
        ],
      )),
    );
  }
}
