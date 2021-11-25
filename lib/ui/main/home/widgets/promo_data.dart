import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:goodzone/controller/main/home/home_controller.dart';
import 'package:goodzone/core/appTextStyle/app_text_style.dart';

 class PromoData  extends StatelessWidget {
   const PromoData({Key? key}) : super(key: key);

   @override
   Widget build(BuildContext context) {
     final height = Get.height;
     final width = Get.width;
     return GetBuilder<HomeController>(
       builder: (controller) {
         return SizedBox(
           height: height/5+46,
           child: ListView.builder(
             physics:const BouncingScrollPhysics(),
             scrollDirection: Axis.horizontal,
             itemCount: controller.promos.length,
             itemBuilder: (context, index) {
               return Column(
                 mainAxisSize: MainAxisSize.min,
                 children: [
                   Container(
                     margin: const EdgeInsets.fromLTRB(16, 16, 0, 0),
                     child: ClipRRect(
                       borderRadius: const BorderRadius.all(Radius.circular(10)),
                       child: Card(
                         shape: const RoundedRectangleBorder(
                             borderRadius: BorderRadius.all(
                                 Radius.circular(8))),
                         margin: EdgeInsets.zero,
                         child: CachedNetworkImage(
                           imageUrl: controller.promos[index].previewImage!,
                           errorWidget: (context, url, error) =>
                           const Icon(Icons.error),
                           placeholder: (context, url) =>    SizedBox(
                             height: height/5-40,  width: 40,
                             child: Center(
                               child:  Image.asset('asset/png/logo.png',color: Colors.grey,),
                             ),
                           ),
                           fit: BoxFit.fill,
                           height: height/5-12,
                           width: width/2+26,
                         ),
                       ),
                     ),
                   ),
                   Container(
                       width: width/2+26,
                       height: height/20,
                       margin: const EdgeInsets.fromLTRB(16, 1, 0, 0),
                       child: Text(
                         '${controller.promos[index].title}',
                         style: AppTextStyle.previewText,
                         maxLines: 2,
                         overflow: TextOverflow.ellipsis,
                       ))
                 ],
               );
             },
           ),
         );
       },
     );
   }
 }



