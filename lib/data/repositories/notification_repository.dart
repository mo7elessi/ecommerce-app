import 'package:bloc_state_managment/data/model/notification_model.dart';
import 'package:bloc_state_managment/data/model/response.dart';
import 'package:bloc_state_managment/data/network/end_points.dart';
import 'package:bloc_state_managment/data/network/remote/dio_helper.dart';
import 'package:dartz/dartz.dart';

import '../../core/error/exceptions.dart';
import '../../core/error/failure.dart';

abstract class NotificationRepository {
  Future<Either<Failure, MyResponse<NotificationModel>>> getNotifications();
}

class NotificationRepositoryImpl extends NotificationRepository {
  @override
  Future<Either<Failure, MyResponse<NotificationModel>>>getNotifications() async {
    try {
      var result = await DioHelper.getData(url: Endpoints.notifications);
      return Right(MyResponse.fromJson(result.data));
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
