import 'package:bloc/bloc.dart';
import 'package:bloc_state_managment/core/error/exceptions.dart';
import 'package:bloc_state_managment/data/model/notification_model.dart';
import 'package:meta/meta.dart';

import '../../../../data/repositories/notification_repository.dart';

part 'notification_event.dart';

part 'notification_state.dart';

class NotificationBloc extends Bloc<NotificationEvent, NotificationState> {
  final NotificationRepository repo;

  NotificationBloc({required this.repo}) : super(NotificationInitial()) {
    on<NotificationEvent>((event, emit) async {
      if (event is FetchNotificationsEvent) {
        emit(NotificationLoadingState());
        var failureOrNotifications = await repo.getNotifications();
        failureOrNotifications.fold(
          (failure) => emit(
            NotificationErrorState(error: "${failure.runtimeType}"),
          ),
          (data) => emit(
            NotificationLoadedState(notificationModel: data.data!.items!),
          ),
        );
      }
    });
  }
}
