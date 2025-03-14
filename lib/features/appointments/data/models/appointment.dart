import 'package:myth/data_model/auth/user.dart';

class Appointment {
  final DateTime? startDate;
  final DateTime? endDate;
  final String? clinicName;
  final String? fixedDay;
  final String? status;
  final String? therapistName;
  final List<AppointmentDetail>? appointmentDetails;
  User? patient;
  Appointment({
    this.startDate,
    this.endDate,
    this.clinicName,
    this.fixedDay,
    this.status,
    this.therapistName,
    this.appointmentDetails,
    this.patient,
  });

  factory Appointment.fromJson(Map<String, dynamic> json) {
    return Appointment(
      startDate: json['startDate'] != null ? DateTime.parse(json['startDate']) : null,
      endDate: json['endDate'] != null ? DateTime.parse(json['endDate']) : null,
      clinicName: json['clinicName'] as String?,
      fixedDay: json['fixedDay'] as String?,
      status: json['status'] as String?,
      therapistName: json['therapistName'] as String?,
      appointmentDetails: (json['appointmentDetails'] as List?)
          ?.map((item) => AppointmentDetail.fromJson(item))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'startDate': startDate?.toIso8601String(),
      'endDate': endDate?.toIso8601String(),
      'clinicName': clinicName,
      'fixedDay': fixedDay,
      'status': status,
      'therapistName': therapistName,
      'appointmentDetails': appointmentDetails?.map((item) => item.toJson()).toList(),
    };
  }
}

class AppointmentDetail {
  final String? name;
  final DateTime? startDate;
  final DateTime? endDate;

  AppointmentDetail({
    this.name,
    this.startDate,
    this.endDate,
  });

  factory AppointmentDetail.fromJson(Map<String, dynamic> json) {
    return AppointmentDetail(
      name: json['name'] as String?,
      startDate: json['startDate'] != null ? DateTime.parse(json['startDate']) : null,
      endDate: json['endDate'] != null ? DateTime.parse(json['endDate']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'startDate': startDate?.toIso8601String(),
      'endDate': endDate?.toIso8601String(),
    };
  }
}
