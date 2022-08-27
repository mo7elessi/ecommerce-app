import 'package:bloc_state_managment/core/error/failure.dart';
import 'package:bloc_state_managment/data/model/category_model.dart';
import 'package:bloc_state_managment/data/network/end_points.dart';
import 'package:bloc_state_managment/data/network/remote/dio_helper.dart';
import 'package:dartz/dartz.dart';
import '../../core/error/exceptions.dart';
import '../model/product_model.dart';
import '../model/response.dart';

abstract class CategoryRepository {
  Future<Either<Failure, MyResponse<CategoryModel>>> getCategories();

  Future<Either<Failure, MyResponse<ProductModel>>> getProductsByCategory({
    required int categoryId,
  });
}

class CategoryRepositoryImpl extends CategoryRepository {
  @override
  Future<Either<Failure, MyResponse<CategoryModel>>> getCategories() async {
    try {
      final categories = await DioHelper.getData(url: Endpoints.categories);
      return Right(MyResponse.fromJson(categories.data));
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, MyResponse<ProductModel>>> getProductsByCategory({
    required int categoryId,
  }) async {
    try {
      var products = await DioHelper.getData(
        url: "${Endpoints.categories}/$categoryId",
      );
      return Right(MyResponse.fromJson(products.data));
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
