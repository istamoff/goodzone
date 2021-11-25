// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:get/get_navigation/src/extension_navigation.dart';
// import 'package:goodzone/core/theme/appcolor.dart';
//
// class ProductCard  extends StatelessWidget {
//   const ProductCard({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       child: Container(
//         height: Get.height / 3 + 29,
//         width: Get.width / 2 - 42,
//         margin:
//         const EdgeInsets.fromLTRB(0, 16, 16, 16),
//         child: Column(
//           crossAxisAlignment:
//           CrossAxisAlignment.start,
//           children: [
//             SizedBox(
//               height: Get.height / 4 - 16,
//               width: Get.height / 4 - 16,
//               child: Card(
//                 shape: const RoundedRectangleBorder(
//                     borderRadius: BorderRadius.all(
//                         Radius.circular(8))),
//                 margin: EdgeInsets.zero,
//                 child: Stack(
//                   children: [
//                     ClipRRect(
//                       borderRadius:
//                       const BorderRadius.all(
//                           Radius.circular(10)),
//                       child: CachedNetworkImage(
//                         imageUrl: productImage,
//                         errorWidget: (context, url, error) =>
//                         const Icon(Icons.error),
//                         placeholder: (context, url) =>
//                             SizedBox(
//                               height: Get.height / 5,
//                               width: 70,
//                               child: Center(
//                                 child: Image.asset(
//                                   'asset/png/logo.png',
//                                   color: Colors.grey,
//                                 ),
//                               ),
//                             ),
//                         fit: BoxFit.fill,
//                       ),
//                     ),
//                     Positioned(
//                       top: 3,
//                       right: 3,
//                       child: Container(
//                         height: 24,
//                         width: 24,
//                         decoration:
//                         const BoxDecoration(
//                             shape: BoxShape.circle,
//                             color: AppColors.backgroundLike),
//                         child: Center(
//                           child: IconButton(
//                             padding:
//                             const  EdgeInsets.all(4),
//                             splashRadius: 3,
//                             icon: Icon(
//                               Icons.favorite,
//                               size: 17,
//                               color: hasFav
//                                   ? AppColors.red
//                                   : AppColors.likeColor,
//                             ),
//                             onPressed: () {
//                               if (!hasFav) {
//                                 LocalSource.getInstance().insertProduct(
//                                   FavoriteProducts(
//                                     id: featured.products![index].id ?? '',
//                                     text: '$productText',
//                                     price: '$productPrice',
//                                     image: productImage,
//                                     name: '$productName',
//                                   ),
//                                 );
//                               } else if (hasFav) {
//                                 LocalSource.getInstance().deleteProduct(
//                                     FavoriteProducts(
//                                       id: featured.products![index].id ?? '',
//                                       text: '$productText',
//                                       price: '$productPrice',
//                                       image: productImage,
//                                       name: '$productName',
//                                     ));
//                                 hasFav = false;
//                               }
//                             },
//                           ),
//                         ),
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//             ),
//             Container(
//               margin:const EdgeInsets.only(top: 1),
//               child: Text(
//                 '$productName',
//                 style: AppTextStyle.productsName,
//               ),
//             ),
//             SizedBox(
//               height: Get.height / 21 + 5,
//               child: Text(
//                 '$productText',
//                 style: AppTextStyle.previewText,
//                 maxLines: 2,
//                 overflow: TextOverflow.ellipsis,
//               ),
//             ),
//             SizedBox(
//               height: Get.height / 40,
//               child: Text('$productPrice sum',
//                   style: AppTextStyle.productsPrice),
//             ),
//           ],
//         ),
//       ),
//       onTap: () {
//         Get.toNamed(
//           Routes.FULLCONTENT,
//           arguments: FullContentArgument(
//               id: featured.products?[index].id ?? '',
//               name: featured.products?[index].name ??''),
//         );
//       },
//     );
//   }
// }
