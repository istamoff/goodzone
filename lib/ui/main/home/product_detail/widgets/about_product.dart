import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:goodzone/controller/main/home/product_detail/product_detail_controller.dart';
import 'package:goodzone/core/appTextStyle/app_text_style.dart';
import 'package:goodzone/routes/app_routes.dart';
import 'package:goodzone/ui/main/home/product_detail/widgets/horizontal_product_list.dart';

 class ProductTab  extends StatelessWidget {
   const ProductTab({Key? key}) : super(key: key);

   @override
   Widget build(BuildContext context) {
     return  GetBuilder<ProductDetailController>(builder: (ctx ){
       return Stack(children: [
         SingleChildScrollView(
           physics: const BouncingScrollPhysics(),
           child: Column(
             mainAxisSize: MainAxisSize.min,
             children: [
               Padding(
                 padding:const EdgeInsets.all(16),
                 child: Html(
                   data:ctx.product?.description??'' ,
                 ),
               ),
               Padding(
                 padding: const EdgeInsets.fromLTRB(16, 0, 8, 0),
                 child: Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                       const Text(
                         'Сопутствующие товары',
                         style:  AppTextStyle.titleName,
                       ),
                       InkWell(
                         onTap: () {
                           Get.toNamed(Routes.RELATEDPRODUCTS);
                         },
                         child:const Padding(
                           padding: EdgeInsets.symmetric(
                               horizontal: 8, vertical: 4),
                           child: Text(
                             'Все',
                             style:  AppTextStyle.allStyle
                           ),
                         ),
                       ),
                     ]),
               ),
               SizedBox(
                   height: Get.height/3+67,
                   child: const HorizontalProductList()),
             ],
           ),
         ),
       ]);
     });
   }
 }



