import 'package:bloc_state_managment/data/model/cart_model.dart';
import 'package:bloc_state_managment/data/network/end_points.dart';
import 'package:bloc_state_managment/data/network/remote/dio_helper.dart';

abstract class CartRepository {
  Future<CartModel> getCart();

  Future<CartItems> addOrRemove({required int productId});

  Future<CartModel> updateQuantity({
    required int productId,
    required int quantity,
  });
}

class CartRepositoryImpl extends CartRepository {
  @override
  Future<CartModel> getCart() async {
    var data = await DioHelper.getData(url: Endpoints.carts);
    return CartModel.fromJson(data.data);
  }

  @override
  Future<CartItems> addOrRemove({required int productId}) async {
    var data = await DioHelper.postData(
      url: Endpoints.carts,
      data: {'product_id': productId},
    );
    return CartItems.fromJson(data.data);
  }

  @override
  Future<CartModel> updateQuantity({
    required int productId,
    required int quantity,
  }) async {
    var data = await DioHelper.putData(
      url: "${Endpoints.carts}/$productId",
      data: {'quantity': quantity},
    );
    return CartModel.fromJson(data.data);
  }
}
