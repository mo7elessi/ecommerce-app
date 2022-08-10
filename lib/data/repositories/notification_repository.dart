import 'package:bloc_state_managment/data/model/notification_model.dart';
import 'package:bloc_state_managment/data/network/end_points.dart';
import 'package:bloc_state_managment/data/network/remote/dio_helper.dart';

abstract class NotificationRepository{
  Future<NotificationModel> getNotifications();
}
class NotificationRepositoryImpl extends NotificationRepository{
  @override
  Future<NotificationModel> getNotifications() {
    var result = DioHelper.getData(url: Endpoints.notifications);
    throw UnimplementedError();
  }
}