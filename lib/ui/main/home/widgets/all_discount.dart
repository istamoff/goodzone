import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:goodzone/controller/main/home/home_controller.dart';
import 'package:goodzone/core/appTextStyle/app_text_style.dart';
import 'package:goodzone/core/theme/appcolor.dart';
import 'package:intl/intl.dart';

class AllDiscountData extends StatefulWidget with PreferredSizeWidget {
  const AllDiscountData({Key? key}) : super(key: key);

  @override
  _AllDiscountDataState createState() => _AllDiscountDataState();

  @override
  Size get preferredSize => const Size.fromHeight(52);
}

class _AllDiscountDataState extends State<AllDiscountData> {
  DateFormat formatDate = DateFormat('dd MMMM y - dd MMMM y');

  @override
  Widget build(BuildContext context) {
    final height = Get.height;
    return Scaffold(
        appBar: AppBar(
          elevation: 1,
          backgroundColor: AppColors.white,
          title: const Text(
            'Скидка',
            style:  AppTextStyle.appBarNews,
          ),
          centerTitle: true,
          leading: IconButton(
            splashRadius: 1,
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
            onPressed: () {
              Get.back();
            },
          ),
        ),
        body: GetBuilder<HomeController>(
          builder: (nlogic) {
            return ListView.builder(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.vertical,
              itemCount: nlogic.promos.length,
              itemBuilder: (BuildContext context, int index) {
                DateTime dt =
                    DateTime.parse('${nlogic.promos[index].formattedDate}');
                String _date = formatDate.format(dt);

                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(right: 16),
                            height: height/8,
                            width: height/8,
                            child: Stack(
                              children: [
                                CachedNetworkImage(
                                  imageUrl: nlogic.promos[index].previewImage!,
                                  errorWidget: (context, url, error) =>
                                      const Icon(Icons.error),
                                  placeholder: (context, url) =>  SizedBox(
                                    height: height/8-10,  width: 30,
                                    child: Center(
                                      child:  Image.asset('asset/png/logo.png',color: Colors.grey,),
                                    ),
                                  ),
                                  fit: BoxFit.fill,
                                  height: height/8,
                                  width: height/8,
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '${nlogic.promos[index].title}',
                                  style:  AppTextStyle.titleName,
                                  maxLines: 3,
                                  overflow:TextOverflow.ellipsis ,
                                ),
                                const SizedBox(
                                  height: 3,
                                ),
                                Text(
                                  _date,
                                  style:  AppTextStyle.newsPreviewDate,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 1,
                      color:  AppColors.devider,
                    )
                  ],
                );
              },
            );
          },
        ));
  }
}
