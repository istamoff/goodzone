import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:goodzone/controller/main/home/product_detail/shops_controller.dart';
import 'package:goodzone/core/appTextStyle/app_text_style.dart';
import 'package:goodzone/core/theme/appcolor.dart';
import 'package:goodzone/data/model/product_id_page/shop_response.dart';
import 'package:get/get.dart';

class ShopTabView  extends StatelessWidget {
  const ShopTabView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = Get.height;
    final width = Get.width;

    return GetBuilder<ShopsController>(builder: (controller){
      return SingleChildScrollView(
        child: SizedBox(
          width: width,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  Text(
                    'Магазин',
                    style: AppTextStyle.shopRowName,
                    maxLines: 1,
                    textAlign: TextAlign.start,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    'Рабочий час',
                    style: AppTextStyle.shopRowName,
                    textAlign: TextAlign.start,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    'Доступный',
                    style: AppTextStyle.shopRowName,
                    textAlign: TextAlign.start,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
              SizedBox(
                height: height/3+86,
                width: width,
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: controller.shops.length,
                    itemBuilder: (ctx , index){
                      return SizedBox(
                        height: height/21,
                        width: width,
                        child: Row(
                          children: [
                            Container(

                              margin: const EdgeInsets.only(left: 20),
                              width: width/2-80,
                              child: Text(
                                controller.shops[index].shop?.name?.replaceAll("GOODZONE ", "") ?? '',
                                textAlign: TextAlign.start,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: AppTextStyle.html,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only( right: 10.0,),
                              child: SizedBox(
                                width: width/2-50,
                                child: Text(
                                  controller.shops[index].shop?.workingHours ?? '',
                                  textAlign: TextAlign.start,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style:  AppTextStyle.html,
                                ),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      color: controller.shops[index].quantity == 0
                                          ?  AppColors.devider
                                          : AppColors.red,
                                      shape: BoxShape.circle),
                                  width: 8,
                                  height: 8,
                                ),
                                const SizedBox(width: 5),
                                Text(
                                  getQuantity(controller.shops[index]),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.start,
                                  style: AppTextStyle.html,
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    }),
              ),
            ],
          ),
        ),
      );
    });

  }
  String getQuantity(Shops shops) {
    var quantity = '';
    if (shops.quantity != null) {
      if (shops.quantity == 0) {
        quantity = 'Нет';
      } else if (shops.quantity! > 0 && shops.quantity! <= 5) {
        quantity = 'Немного';
      } else if (shops.quantity! > 5 && shops.quantity! <= 10) {
        quantity = 'Достаточно';
      } else if (shops.quantity! > 10) {
        quantity = 'Много';
      }
    }
    return quantity;
  }

}



