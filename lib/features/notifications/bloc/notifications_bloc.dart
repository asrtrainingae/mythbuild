import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:myth/features/notifications/data/models/noti.dart';
import 'package:myth/features/notifications/data/notification_repo.dart';
import 'package:myth/services/dependency_injector.dart';

part 'notifications_event.dart';
part 'notifications_state.dart';
part 'notifications_bloc.freezed.dart';

class NotificationsBloc extends Bloc<NotificationsEvent, NotificationsState> {
  NotificationsBloc() : super(_Loading()) {
    getNotifications();
    on<NotificationsEvent>((event, emit) {
      event.when(started: (){
        getNotifications();
      });
    });
  }

  getNotifications() async {
    emit(NotificationsState.loading());
        final data = await sl<NotificationRepo>().getNotifications();
        data.fold(
          (l){
            emit(NotificationsState.error(l));
          }, 
          (r){
            emit(NotificationsState.success(notifications: r));
        });
  }
}
