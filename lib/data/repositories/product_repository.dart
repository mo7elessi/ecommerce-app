import 'package:bloc_state_managment/core/error/exceptions.dart';
import 'package:bloc_state_managment/core/error/failure.dart';
import 'package:bloc_state_managment/data/model/product_model.dart';
import 'package:bloc_state_managment/data/model/response.dart';
import 'package:bloc_state_managment/data/network/end_points.dart';
import 'package:bloc_state_managment/data/network/remote/dio_helper.dart';
import 'package:dartz/dartz.dart';

typedef Response = Either<Failure, MyResponse<ProductModel>>;

abstract class ProductRepository {
  Future<Response> search({required String text});

  Future<Response> productsByCategory({required int categoryId});

  Future<Response> productDetails({required int productId});
}

class ProductRepositoryImpl extends ProductRepository {
  @override
  Future<Response> search({required String text}) async {
    try {
      var result = await DioHelper.postData(
        url: Endpoints.search,
        data: {'text': text},
      );
      return Right(MyResponse.fromJson(result.data));
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Response> productsByCategory({required int categoryId}) async {
    try {
      var result = await DioHelper.getData(
        url: Endpoints.categories,
        query: {'category_id': categoryId},
      );
      return Right(MyResponse.fromJson(result.data));
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Response> productDetails({required int productId}) async {
    try {
      var result = await DioHelper.getData(
        url: "${Endpoints.products}/$productId",
      );
      return Right(MyResponse.fromJson(result.data));
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
