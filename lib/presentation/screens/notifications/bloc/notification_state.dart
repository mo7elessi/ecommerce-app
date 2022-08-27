part of 'notification_bloc.dart';

@immutable
abstract class NotificationState {}

class NotificationInitial extends NotificationState {}

class NotificationLoadingState extends NotificationState {}

class NotificationLoadedState extends NotificationState {
  final List<NotificationModel> notificationModel;

  NotificationLoadedState({required this.notificationModel});
}

class NotificationErrorState extends NotificationState {
  final String error;

  NotificationErrorState({required this.error});
}
