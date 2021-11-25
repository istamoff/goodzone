
import 'package:goodzone/data/floor/app_database.dart';
import 'package:goodzone/data/floor/dao/products_dao.dart';
import 'package:goodzone/data/floor/entity/favorite_products.dart';


class LocalSource {
   ProductDao _productDao  = AppDatabase.instance.productDao;

  LocalSource._();

  static LocalSource? _instance;

  static LocalSource getInstance() {

    if (_instance != null) {
      return _instance!;
    } else {
      return LocalSource._();
    }
  }

  Stream<List<FavoriteProducts>> getAllFavoriteProducts() {
    return _productDao.getFavoriteProducts();
  }


  Future<void> insertProduct(FavoriteProducts product) async {
    await _productDao.insertProduct(product);
  }

  Future<void> deleteProduct(FavoriteProducts product) async {
    await _productDao.deleteProduct(product);
  }

  Future<void> updateProduct(FavoriteProducts product) async {
    await _productDao.updateProduct(product);
  }

  Future<void> removeAll(List<FavoriteProducts> products) async {
    await _productDao.removeAll(products);
  }

  Future<void> deleteById(String productId) async {
    await _productDao.deleteById(productId );
  }
}
