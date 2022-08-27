import 'package:bloc_state_managment/core/error/failure.dart';
import 'package:bloc_state_managment/data/model/home_model.dart';
import 'package:bloc_state_managment/data/network/end_points.dart';
import 'package:bloc_state_managment/data/network/remote/dio_helper.dart';
import 'package:dartz/dartz.dart';

import '../../core/error/exceptions.dart';

abstract class HomeRepository {
  Future<Either<Failure, HomeModel>> getHomeData();
}

class HomeRepositoryImpl extends HomeRepository {
  @override
  Future<Either<Failure, HomeModel>> getHomeData() async {
    try {
      var home = await DioHelper.getData(url: Endpoints.home);
      return Right(HomeModel.fromJson(home.data));
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
