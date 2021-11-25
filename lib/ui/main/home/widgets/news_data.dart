import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:goodzone/controller/main/home/news/news_controller.dart';
import 'package:goodzone/core/appTextStyle/app_text_style.dart';
import 'package:goodzone/core/theme/appcolor.dart';
import 'package:intl/intl.dart';

class NewData extends StatefulWidget with PreferredSizeWidget {
  const NewData({Key? key}) : super(key: key);

  @override
  _NewDataState createState() => _NewDataState();

  @override
  Size get preferredSize => const Size.fromHeight(52);
}

class _NewDataState extends State<NewData> {
  DateFormat formatDate = DateFormat('dd MMMM y');
  @override
  Widget build(BuildContext context) {
    final height =Get.height;
    return Scaffold(
      backgroundColor: AppColors.white,
        appBar: AppBar(
          elevation: 1,
          backgroundColor: Colors.white,
          title: const Text(
            'Новости',
            style:  AppTextStyle.appBarNews,
          ),
          centerTitle: true,
          leading: IconButton(
            splashRadius: 1,
            splashColor: AppColors.white,
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
            onPressed: () {
              Get.back();
            },
          ),
        ),
        body: GetBuilder<NewsController>(
          builder: (nlogic) {
            return ListView.builder(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.vertical,
              itemCount: nlogic.news.length,
              itemBuilder: (BuildContext context, int index) {

                DateTime dt = DateTime.parse( '${nlogic.news[index].formattedDate}');
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
                            child: ClipRRect(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(8)),
                              child: Stack(
                                children: [
                                  CachedNetworkImage(
                                    imageUrl: nlogic.news[index].previewImage!,
                                    errorWidget: (context, url, error) =>
                                        const Icon(Icons.error),
                                    placeholder: (context, url) =>  SizedBox(
                                      height: height/8-10,  width: 30,
                                      child: Center(
                                        child:  Image.asset('asset/png/logo.png',color: Colors.grey,),
                                      ),
                                    ),
                                    fit: BoxFit.cover,
                                    height: height/8,
                                    width: height/8,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '${nlogic.news[index].title}',
                                  style:  AppTextStyle.titleName,
                                  maxLines: 3,
                                ),
                                const SizedBox(
                                  height: 3,
                                ),
                                Text(
                                  _date,
                                  style:  AppTextStyle.newsPreviewDate,
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 1,
                      color: Colors.grey[200],
                    )
                  ],
                );
              },
            );
          },
        ));
  }
}
