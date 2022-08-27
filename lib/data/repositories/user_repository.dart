import 'package:bloc_state_managment/core/error/exceptions.dart';
import 'package:bloc_state_managment/core/error/failure.dart';
import 'package:bloc_state_managment/data/model/user_model.dart';
import 'package:bloc_state_managment/data/network/end_points.dart';
import 'package:bloc_state_managment/data/network/remote/dio_helper.dart';
import 'package:dartz/dartz.dart';

typedef Response = Either<Failure, UserResponse>;

class UserRepository {
  Future<Response> createUser({required UserModel userModel}) async {
    var result = await DioHelper.postData(
      url: Endpoints.register,
      data: {
        'name': userModel.name,
        'phone': userModel.phone,
        'email': userModel.email,
        'password': userModel.password,
      },
    );
    return func(result: result);
  }

  Future<Response> login({
    required String email,
    required String password,
  }) async {
    var result = await DioHelper.postData(
      url: Endpoints.login,
      data: {'email': email, 'password': password},
    );
    return func(result: result);
  }

  Future<Response> verifyEmail({
    required String email,
  }) async {
    var result = await DioHelper.postData(
      url: Endpoints.verifyEmail,
      data: {'email': email},
    );
    return func(result: result);
  }

  Future<Response> verifyCode({
    required String email,
    required String code,
  }) async {
    var result = await DioHelper.postData(
      url: Endpoints.verifyCode,
      data: {'email': email, 'code': code},
    );
    return func(result: result);
  }

  Future<Response> resetPassword({
    required String email,
    required String code,
    required String password,
  }) async {
    var result = await DioHelper.postData(
      url: Endpoints.resetPassword,
      data: {'email': email, 'code': code, 'password': password},
    );
    return func(result: result);
  }

  Future<Response> func({required var result}) async {
    try {
      return Right(UserResponse.fromJson(result.data));
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
