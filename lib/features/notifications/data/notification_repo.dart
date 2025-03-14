import 'package:dartz/dartz.dart';
import 'package:myth/features/appointments/data/models/appointment.dart';
import 'package:myth/features/notifications/data/models/noti.dart';
import 'package:myth/services/dependency_injector.dart';
import 'package:myth/services/network/api_service.dart';
import 'package:myth/services/network/models/error_response.dart';
import 'package:myth/utils/server/end_points.dart';
abstract class NotificationRepo {
  Future<Either> getNotifications();
}

class NotificationRepoImpl extends NotificationRepo{
  final apiService = sl<ApiService>();

  @override
  Future<Either> getNotifications() async {

    // final appointmentExample = { "startDate": "2025-05-27T07:30:00", "endDate": "2025-05-27T08:00:00", "clinicName": "", "fixedDay" : "sunday", "status" : "completed", "therapistName": "", "appointmentDetails" : [ {"name" : "Speech Treatment" , "startDate" : "2025-09-27T07:30:00", "endDate" : "2025-05-27T07:30:00", }, ] };
    // final appointmentCanceledExample = { "startDate": "2024-05-27T07:30:00", "endDate": "2024-05-27T08:00:00", "clinicName": "", "fixedDay" : "sunday", "status" : "canceled", "therapistName": "", "appointmentDetails" : [ {"name" : "Speech Treatment" , "startDate" : "2024-05-27T07:30:00", "endDate" : "2024-05-27T07:30:00", }, ] };
    // final appointment = Appointment.fromJson(appointmentExample);
    // final  List<Appointment> list = [
    //   appointment,appointment,appointment,appointment
    // ];
    // return right(list);
    
    final res = await apiService.get(EndPoints.getNotifications);
    if(res is ErrorResponse){
      return left(res.message);
    }else{
    //   List<Noti> notis =  [
    //   Noti(title:"Patient Ahmed's appointment" , body: "You have an appointment an hour later." , createDate: "2024-10-10 17:33:07" , type: "1"),
    //   Noti(title:"Patient Ahmed's appointment" , body: "The first session has been completed." , createDate: "2024-10-10 17:33:07" , type: "2"),
    //   Noti(title:"Patient Ahmed's appointment" , body: "You have an appointment an hour later." , createDate: "2024-10-10 17:33:07" , type: "1"),
    //   Noti(title:"Patient Ahmed's appointment" , body: "You have a new newly added video." , createDate: "2024-10-10 17:33:07" , type: "3"),
    //   Noti(title:"Patient Ahmed's appointment" , body: "Happy birthday." , createDate: "2024-10-10 17:33:07" , type: "4"),
    // ];
    //   return right(notis);
       return right(res["data"].map<Noti>((r)=>Noti.fromJson(r)).toList()); 
    }
  }
}