import 'package:bloc_state_managment/data/model/cart_model.dart';
import 'package:bloc_state_managment/data/network/end_points.dart';
import 'package:bloc_state_managment/data/network/remote/dio_helper.dart';
import 'package:dartz/dartz.dart';

import '../../core/error/exceptions.dart';
import '../../core/error/failure.dart';

abstract class CartRepository {
  Future<Either<Failure, CartModel>> getCart();

  Future<Either<Failure, CartItems>> addOrRemove({required int productId});

  Future<Either<Failure, CartModel>> updateQuantity({
    required int productId,
    required int quantity,
  });
}

class CartRepositoryImpl extends CartRepository {
  @override
  Future<Either<Failure, CartModel>> getCart() async {
    try {
      var data = await DioHelper.getData(url: Endpoints.carts);
      return Right(CartModel.fromJson(data.data));
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, CartItems>> addOrRemove(
      {required int productId}) async {
    try {
      var data = await DioHelper.postData(
        url: Endpoints.carts,
        data: {'product_id': productId},
      );
      return Right(CartItems.fromJson(data.data));
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, CartModel>> updateQuantity({
    required int productId,
    required int quantity,
  }) async {
    try {
      var data = await DioHelper.putData(
        url: "${Endpoints.carts}/$productId",
        data: {'quantity': quantity},
      );
      return Right(CartModel.fromJson(data.data));
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
