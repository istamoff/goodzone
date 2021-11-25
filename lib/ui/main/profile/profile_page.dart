import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:goodzone/core/appTextStyle/app_text_style.dart';
import 'package:goodzone/core/appbar/appbar.dart';
import 'package:goodzone/core/theme/appcolor.dart';
import 'package:goodzone/ui/main/profile/custom_row.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:const GoodzoneAppbar(icon: 'asset/svg/ic_notifications.svg',),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(16, 30, 16, 30),
            child: Column(

              children: const [
                Text('Alice Stevens' ,style: AppTextStyle.userName,),
                SizedBox(height: 4),
                Text('+9989012345678' ,style: AppTextStyle.userPhone,),

              ],
            ),

          ),
          Divider(
            height: 1,
            color: Colors.grey[200],
          ),
          Column(
            children:  [
              const CustomRow(
                  icon: Icon(
                    Icons.account_balance_wallet_sharp,
                    size: 20,
                    color: AppColors.black,
                  ),
                  text: Text(
                    'Оплата',
                    style: AppTextStyle.profilePreviewText,
                  ),
                  arrowIcon: Icon(
                    Icons.arrow_forward_ios_sharp,
                    size: 14,
                    color: AppColors.devider,

                  )),
              Divider(
                height: 1,
                color: Colors.grey[200],
              )
              ,
              const CustomRow(
                  icon: Icon(
                    Icons.shop,
                    size: 20,
                    color: AppColors.black,
                  ),
                  text: Text(
                    'Магазин',
                    style: AppTextStyle.profilePreviewText,
                  ),
                  arrowIcon: Icon(
                    Icons.arrow_forward_ios_sharp,
                    size: 14,
                    color: AppColors.devider,

                  )),
              const Divider(
                height: 1,
                color: AppColors.devider,
              ),

            ],
          ),
        ],
      ),
    );
  }
}
