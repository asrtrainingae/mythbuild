part of 'notifications_bloc.dart';



@freezed
class NotificationsState with _$NotificationsState {
  const factory NotificationsState.loading() = _Loading;
  const factory NotificationsState.success({required List<Noti> notifications}) = _Success;
  const factory NotificationsState.error(String error) = _Error;
}
