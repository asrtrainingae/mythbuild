//create a service locator (sl)
import 'package:get_it/get_it.dart';
import 'package:myth/features/appointments/data/appointment_repo.dart';
import 'package:myth/features/auth/bloc/auth_bloc.dart';
import 'package:myth/features/auth/data/repo/auth_repo.dart';
import 'package:myth/features/development/data/model/development_repo.dart';
import 'package:myth/features/notifications/bloc/notifications_bloc.dart';
import 'package:myth/features/notifications/data/notification_repo.dart';
import 'package:myth/services/network/api_service.dart';

final sl = GetIt.instance;

void setupServiceLocator() {
  //register singletones
  sl.registerSingleton<ApiService>(ApiService());

  // repositories
  sl.registerSingleton<AuthRepo>(AuthRepoImpl());
  sl.registerSingleton<NotificationRepo>(NotificationRepoImpl());
  sl.registerSingleton<DevelopmentRepo>(DevelopmentRepoImpl());
  sl.registerSingleton<AppointmentRepo>(AppointmentRepoImpl());

  //register bloc
  sl.registerLazySingleton<AuthBloc>(()=>AuthBloc());
  sl.registerLazySingleton<NotificationsBloc>(()=>NotificationsBloc());

}