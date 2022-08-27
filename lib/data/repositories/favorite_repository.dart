import 'package:bloc_state_managment/core/error/exceptions.dart';
import 'package:bloc_state_managment/core/error/failure.dart';
import 'package:bloc_state_managment/data/model/change_data_model.dart';
import 'package:bloc_state_managment/data/model/favorite_model.dart';
import 'package:bloc_state_managment/data/model/response.dart';
import 'package:bloc_state_managment/data/network/remote/dio_helper.dart';
import 'package:dartz/dartz.dart';

import '../network/end_points.dart';

abstract class FavoriteRepository {
  Future<Either<Failure, MyResponse<FavoriteModel>>> getFavorite();

  Future<Either<Failure, ChangeDataModel>> addOrRemove({
    required int id,
  });
}

class FavoriteRepositoryImpl extends FavoriteRepository {
  @override
  Future<Either<Failure, MyResponse<FavoriteModel>>> getFavorite() async {
    try {
      var data = await DioHelper.getData(url: Endpoints.favorite);
      return Right(MyResponse.fromJson(data.data));
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, ChangeDataModel>> addOrRemove({
    required int id,
  }) async {
    try {
      var data = await DioHelper.getData(
        url: Endpoints.favorite,
        query: {'product_id': id},
      );
      return Right(ChangeDataModel.fromJson(data.data));
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
