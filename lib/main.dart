import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:goodzone/binding/main/main_binding.dart';
import 'package:goodzone/core/theme/app_theme.dart';
import 'package:goodzone/data/floor/app_database.dart';
import 'package:goodzone/routes/app_pages.dart';
import 'package:goodzone/routes/app_routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppDatabase.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      initialBinding: MainBinding(),
      theme: appThemeData,
      initialRoute: Routes.INITIAL,
      getPages: AppPages.pages,
      defaultTransition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 100),
    );
  }
}
