import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:myth/data_model/auth/user.dart';
import 'package:myth/features/appointments/data/models/appointment.dart';
import 'package:myth/features/auth/bloc/methods.dart';
import 'package:myth/services/dependency_injector.dart';
import 'package:myth/services/network/api_service.dart';
import 'package:myth/services/network/models/error_response.dart';
import 'package:myth/utils/local_storage.dart';
import 'package:myth/utils/server/end_points.dart';
abstract class AppointmentRepo {
  Future<Either> getAppointments();
}

class AppointmentRepoImpl extends AppointmentRepo{
  final apiService = sl<ApiService>();

  @override
  Future<Either> getAppointments() async {

    // final appointmentExample = { "startDate": "2025-05-27T07:30:00", "endDate": "2025-05-27T08:00:00", "clinicName": "", "fixedDay" : "sunday", "status" : "completed", "therapistName": "", "appointmentDetails" : [ {"name" : "Speech Treatment" , "startDate" : "2025-09-27T07:30:00", "endDate" : "2025-05-27T07:30:00", }, ] };
    // final appointmentCanceledExample = { "startDate": "2024-05-27T07:30:00", "endDate": "2024-05-27T08:00:00", "clinicName": "", "fixedDay" : "sunday", "status" : "canceled", "therapistName": "", "appointmentDetails" : [ {"name" : "Speech Treatment" , "startDate" : "2024-05-27T07:30:00", "endDate" : "2024-05-27T07:30:00", }, ] };
    // final appointment = Appointment.fromJson(appointmentExample);
    // final  List<Appointment> list = [
    //   appointment,appointment,appointment,appointment
    // ];
    // return right(list);
    final isDoct =  await isDoctor();
    final res = await apiService.get(isDoct?EndPoints.getDoctorAppointments3 :EndPoints.getAppointments);
    if(res is ErrorResponse){
      return left(res.message);
    }else{
       return right(res["data"].map<Appointment>((r)=>Appointment.fromJson(r)).toList()); 
    }
  }
}