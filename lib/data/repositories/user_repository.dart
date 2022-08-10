import 'package:bloc_state_managment/data/model/user_model.dart';
import 'package:bloc_state_managment/data/network/end_points.dart';
import 'package:bloc_state_managment/data/network/remote/dio_helper.dart';

class UserRepository {
  Future<UserModel> createUser({required UserData userModel}) async {
    var request = await DioHelper.postData(
      url: Endpoints.register,
      //if found error, please check model!
      data: {
        'name': userModel.name,
        'phone': userModel.phone,
        'email': userModel.email,
        'password': userModel.password,
      },
    );
    return UserModel.fromJson(request.data);
  }

  Future<UserModel> login({
    required String email,
    required String password,
  }) async {
    var request = await DioHelper.postData(
      url: Endpoints.login,
      data: {'email': email, 'password': password},
    );
    return UserModel.fromJson(request.data);
  }

  Future<UserModel> verifyEmail({
    required String email,
  }) async {
    var request = await DioHelper.postData(
      url: Endpoints.verifyEmail,
      data: {'email': email},
    );
    return UserModel.fromJson(request.data);
  }

  Future<UserModel> verifyCode({
    required String email,
    required String code,
  }) async {
    var request = await DioHelper.postData(
      url: Endpoints.verifyCode,
      data: {'email': email,'code':code},
    );
    return UserModel.fromJson(request.data);
  }

  Future<UserModel> resetPassword({
    required String email,
    required String code,
    required String password,
  }) async {
    var request = await DioHelper.postData(
      url: Endpoints.resetPassword,
      data: {'email': email,'code':code,'password':password},
    );
    return UserModel.fromJson(request.data);
  }
}
