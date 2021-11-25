import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:goodzone/controller/main/home/product_detail/product_detail_controller.dart';
import 'package:goodzone/core/appTextStyle/app_text_style.dart';
import 'package:goodzone/ui/main/home/product_detail/widgets/horizontal_image_view.dart';
import 'package:goodzone/ui/main/home/product_detail/widgets/image_view.dart';
import 'package:goodzone/ui/main/home/product_detail/widgets/reviews_page.dart';
import 'package:goodzone/ui/main/home/product_detail/widgets/shop_tap_view.dart';

import 'about_product.dart';

class BuildContent  extends StatefulWidget {
  const BuildContent({Key? key}) : super(key: key);

  @override
  _BuildContentState createState() => _BuildContentState();
}

class _BuildContentState extends State<BuildContent> with SingleTickerProviderStateMixin {


  late TabController _controller;
  int tabSelected = 0;


  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 3, vsync: this);
    _controller.addListener(_handleTabSelection);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  _handleTabSelection() {
    setState(() {
      tabSelected = _controller.index;
    }
    );
  }
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductDetailController>(builder: (controller){
      return   controller.isLoading
          ? const Center(child: CircularProgressIndicator())
          : NestedScrollView(
        physics: const BouncingScrollPhysics(),
        headerSliverBuilder:
            (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                     const  ImageView(),

                      const Padding(
                        padding: EdgeInsets.only(
                            right: 16, left: 16, top: 16),
                        child: HorizontalImageView(),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            right: 16, left: 16, top: 8),
                        child: Text(
                          controller.product?.name ?? '',
                          style:  AppTextStyle.productIdName,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ];
        },
        body: DefaultTabController(
          length: 3,
          child: Column(
            children: <Widget>[
              Padding(
                padding:const EdgeInsets.only(left: 16, right: 16, top: 8),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: TabBar(
                      controller: _controller,
                      onTap: (index) {
                        tabSelected = _controller.index;
                      },
                      labelPadding:const EdgeInsets.only(
                          left: 4, right: 4, top: 4, bottom: 2),
                      unselectedLabelColor: Colors.black,
                      labelColor: Colors.red,
                      indicatorColor: Colors.transparent,
                      tabs: [
                        Tab(
                          child: Container(
                            decoration: BoxDecoration(
                              color: tabSelected == 0
                                  ? Colors.white
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: const Center(
                              child: Text(
                                'О продукте',
                                style:
                                   AppTextStyle.tabBar,
                                ),
                              ),
                            ),
                          ),
                        Tab(
                          child: Container(
                            decoration: BoxDecoration(
                                color: tabSelected == 1
                                    ? Colors.white
                                    : Colors.transparent,
                                borderRadius: BorderRadius.circular(6)),
                            child: const Center(
                              child: Text(
                                'В магазине',
                                style:  AppTextStyle.tabBar,
                                ),
                              ),
                            ),
                          ),

                        Tab(
                          child: Container(
                            decoration: BoxDecoration(
                                color: tabSelected == 2
                                    ? Colors.white
                                    : Colors.transparent,
                                borderRadius: BorderRadius.circular(6)),
                            child: const Center(
                              child: Text(
                                'Отзывы',
                                style:  AppTextStyle.tabBar,
                              ),
                            ),
                          ),
                        ),
                      ]),
                ),
              ),
              Expanded(
                child: TabBarView(
                  children: const [
                    ProductTab(),
                    ShopTabView(),
                     ReviewsPage(),
                  ],
                  controller: _controller,

                ),
              ),
              Container(
                height: 60.0,
                // color: colorRedDefault,
              )
            ],
          ),
        ),
      );
    },
    );
  }
}
