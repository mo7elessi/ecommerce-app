import 'package:bloc_state_managment/data/model/product_model.dart';

class FavoriteModel {
  int? id;
  ProductModel<FavoriteModel>? product;

  FavoriteModel({this.id, this.product});

  FavoriteModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    product =
        json['product'] != null ? ProductModel.fromJson(json['product']) : null;
  }
}
