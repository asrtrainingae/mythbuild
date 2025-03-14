import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:myth/features/appointments/data/appointment_repo.dart';
import 'package:myth/features/appointments/data/models/appointment.dart';
import 'package:myth/features/auth/data/repo/auth_repo.dart';
import 'package:myth/services/dependency_injector.dart';

part 'appointment_event.dart';
part 'appointment_state.dart';
part 'appointment_bloc.freezed.dart';

class AppointmentBloc extends Bloc<AppointmentEvent, AppointmentState> {
  AppointmentBloc() : super(_Loading()) {
    getAppointments();
    on<AppointmentEvent>((event, emit) { 
      event.when(started: ()=>getAppointments());
    });
  }

  getAppointments() async {
    emit(AppointmentState.loading());
        final data = await sl<AppointmentRepo>().getAppointments();
        data.fold(
          (l){
            emit(AppointmentState.error(l));
          }, 
          (r){
            List<Appointment> appointments = r;
            List<Appointment> app = appointments.where((ap)=>ap.status != "canceled").toList();
            List<Appointment> canceledApp = appointments.where((ap)=>ap.status == "canceled").toList();
            emit(AppointmentState.success(appointments: app, canceledAppointments: canceledApp));
        });
  }
}
