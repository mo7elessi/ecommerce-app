import 'package:bloc_state_managment/data/model/product_model.dart';

class CartModel {
  bool? status;
  String? message;
  CartData? data;

  CartModel({this.status, this.message, this.data});

  CartModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ?  CartData.fromJson(json['data']) : null;
  }
}

class CartData {
  List<CartItems>? cartItems;
  dynamic subTotal;
  dynamic total;

  CartData({this.cartItems, this.subTotal, this.total});

  CartData.fromJson(Map<String, dynamic> json) {
    if (json['cart_items'] != null) {
      cartItems = <CartItems>[];
      json['cart_items'].forEach((v) {
        cartItems!.add( CartItems.fromJson(v));
      });
    }
    subTotal = json['sub_total'];
    total = json['total'];
  }
}

class CartItems {
  dynamic id;
  dynamic quantity;
  ProductModel? product;

  CartItems({this.id, this.quantity, this.product});

  CartItems.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    quantity = json['quantity'];
    product =
        json['product'] != null ? ProductModel.fromJson(json['product']) : null;
  }
}
