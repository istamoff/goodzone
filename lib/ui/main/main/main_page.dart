import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:goodzone/controller/main/main_controller.dart';
import 'package:goodzone/core/theme/appcolor.dart';
import 'package:goodzone/ui/main/favorite/like_page.dart';
import 'package:goodzone/ui/main/home/home_page.dart';
import 'package:goodzone/ui/main/profile/profile_page.dart';
import 'package:goodzone/ui/main/search/search_page.dart';
import 'package:goodzone/ui/main/shopping/shop_page.dart';

class MainPage extends GetView<MainController> {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainController>(
      builder: (controller) => Scaffold(
        body: SafeArea(
          child: IndexedStack(
            index: controller.bottomMenu.index,
            children: const [
              HomePage(),
              SearchPage(),
              ShoppingPage(),
              FavoritePage(),
              ProfilePage(),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          onTap: (pos) => controller.setMenu(BottomMenu.values[pos]),
          currentIndex: controller.bottomMenu.index,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          elevation: 8,
          items: [
            _bottomNavigationBarItem(icon: 'ic_home-1', label: 'Главное'),
            _bottomNavigationBarItem(icon: 'ic_search', label: 'Поиск'),
            _bottomNavigationBarItem(icon: 'ic_shopping', label: 'Корзина'),
            _bottomNavigationBarItem(icon: 'ic_fav-2', label: 'Любимый'),
            _bottomNavigationBarItem(icon: 'ic_profile', label: 'Профиль'),
          ],
        ),
      ),
    );
  }

  _bottomNavigationBarItem({
    required String icon,
    required String label,
  }) {
    return BottomNavigationBarItem(
        icon: Padding(
          padding: const EdgeInsets.fromLTRB(0, 4, 0, 4),
          child: SvgPicture.asset(
            'asset/svg/$icon.svg',
            color: AppColors.black,
          ),
        ),
        activeIcon: Padding(
          padding: const EdgeInsets.fromLTRB(0, 4, 0, 4),
          child: SvgPicture.asset(
            'asset/svg/$icon.svg',
            color: AppColors.red,
          ),
        ),
        label: label);
  }
}
