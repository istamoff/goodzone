
import 'dart:async';

import 'package:floor/floor.dart';
import 'package:goodzone/data/floor/entity/favorite_products.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
import 'dao/products_dao.dart';

part 'app_database.g.dart';

@Database(version: 1, entities: [FavoriteProducts])
abstract class AppDatabase extends FloorDatabase {
  ProductDao get productDao;

  static late AppDatabase instance;

  static Future<void> init() async {
    instance =
    await $FloorAppDatabase.databaseBuilder('goodzone.db').build();
  }
}