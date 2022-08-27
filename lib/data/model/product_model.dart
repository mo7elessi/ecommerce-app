import 'package:bloc_state_managment/data/model/favorite_model.dart';

class ProductModel<T>{
  dynamic id;
  dynamic price;
  dynamic oldPrice;
  dynamic discount;
  String? image;
  String? name;
  String? description;
  List<String>? images;
  bool? inFavorites;
  bool? inCart;

  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    price = json['price'];
    oldPrice = json['old_price'];
    discount = json['discount'];
    image = json['image'];
    name = json['name'];
    description = json['description'];
    if(T != FavoriteModel) {
      images = json['images'].cast<String>();
    }
    inFavorites = json['in_favorites'];
    inCart = json['in_cart'];
  }
}
