import 'package:floor/floor.dart';

@entity
class FavoriteProducts {
  @primaryKey
  String id;
  String name;
  String text;
  String price;
  String image;

  FavoriteProducts(
      {required this.id,
        required this.image,
      required this.name,
      required this.price,
      required this.text});
}
