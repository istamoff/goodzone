import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:goodzone/core/appTextStyle/app_text_style.dart';
import 'package:goodzone/core/theme/appcolor.dart';
import 'package:goodzone/data/data_sourse/local_sourse.dart';
import 'package:goodzone/data/floor/entity/favorite_products.dart';
import 'package:goodzone/routes/app_routes.dart';
import 'package:goodzone/ui/main/favorite/widget/fav_product_card.dart';
import 'package:goodzone/ui/main/home/product_detail/widgets/product_detail.dart';

  class FavoritePage  extends StatefulWidget {
    const FavoritePage({Key? key}) : super(key: key);

    @override
    _FavoritePageState createState() => _FavoritePageState();
  }

  class _FavoritePageState extends State<FavoritePage> {

    @override
    Widget build(BuildContext context) {
      var width = (Get.width - 48) / 2;
      var height = width + 78;
      return Scaffold(
        backgroundColor: AppColors.white,
        appBar: AppBar(
          elevation: 1,
          backgroundColor: AppColors.white,
          title: const Text(
            'Любимый',
            style:  AppTextStyle.appBarNews,
          ),
        ),
        body: StreamBuilder<List<FavoriteProducts>>(
          stream: LocalSource.getInstance().getAllFavoriteProducts(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data!.isEmpty) {
                return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset('asset/svg/scene_12.svg'),
                        const SizedBox(height: 30),
                        const Text('У вас еще нет таких товаров' ,style: TextStyle( fontSize: 17 ,fontWeight: FontWeight.w600, color: Colors.black),),
                      ],
                    ));
              } else {
                return GridView.count(
                  physics: const BouncingScrollPhysics(),
                  crossAxisCount: 2,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                  padding:const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                  childAspectRatio: width / height,
                  children: List.generate(
                    snapshot.data!.length,
                        (index) {
                      return InkWell(
                        child: FavProductCard(
                          favProducts: snapshot.data![index],
                          width: width,
                          height: height,
                        ),
                        onTap: (){
                          Get.toNamed(Routes.FULLCONTENT ,
                          arguments: FullContentArgument(id: snapshot.data?[index].id??'', name: snapshot.data?[index].name??'')
                          );
                        },
                      );
                    },
                  ),
                );
              }
            } else {
              return const SizedBox();
            }
          },
        ),
      );
    }
  }



