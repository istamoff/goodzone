import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:goodzone/core/theme/appcolor.dart';
import 'package:goodzone/routes/app_routes.dart';
class GoodzoneAppbar extends StatelessWidget with PreferredSizeWidget {
  const GoodzoneAppbar({Key? key,required this.icon}) : super(key: key);
   final String icon;


  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 1,
      backgroundColor: AppColors.white,
      title: Image.asset('asset/png/logo.png'),
      centerTitle: true,
      actions: [
        Container(
          margin: const EdgeInsets.only(left: 16),
          child: IconButton(
            splashRadius: 1,
            splashColor: AppColors.white,
            onPressed: () {
              Get.toNamed(Routes.NEW);
              print(Get.width);
              print(Get.height);
            },
            icon: SvgPicture.asset('$icon'),
            color: Colors.black,
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);
}
