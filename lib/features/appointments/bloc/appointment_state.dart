part of 'appointment_bloc.dart';

@freezed
class AppointmentState with _$AppointmentState {
  const factory AppointmentState.loading() = _Loading;
  const factory AppointmentState.success({required List<Appointment> canceledAppointments,required List<Appointment> appointments}) = _Success;
  const factory AppointmentState.error(String error) = _Error;
}
