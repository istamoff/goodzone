
import 'package:floor/floor.dart';
import 'package:goodzone/data/floor/entity/favorite_products.dart';

@dao
abstract class ProductDao {
  @Query('SELECT * FROM FavoriteProducts')
  Stream<List<FavoriteProducts>> getFavoriteProducts();

  @insert
  Future<void> insertProduct(FavoriteProducts  product);

  @delete
  Future<void> deleteProduct(FavoriteProducts  product);

  @update
  Future<void> updateProduct(FavoriteProducts  product);

  @delete
  Future<void> removeAll(List<FavoriteProducts>  products);

  @Query("DELETE FROM FavoriteProducts WHERE id = :productId")
  Future<void> deleteById(String productId);

}