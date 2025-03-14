import 'dart:convert';

class Case {
  final String fullName;
  final int totalAppointments;
  final int cancelledAppointments;
  final List<CaseAppointment> appointments;

  Case({
    required this.fullName,
    required this.totalAppointments,
    required this.cancelledAppointments,
    required this.appointments,
  });

  factory Case.fromJson(Map<String, dynamic> json) {
    return Case(
      fullName: json['fullName'] ?? 'Unknown',
      totalAppointments: json['totalAppointments'] ?? 0,
      cancelledAppointments: json['cancelledAppointments'] ?? 0,
      appointments: (json['appointments'] as List?)?.map((item) => CaseAppointment.fromJson(item)).toList() ?? [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'fullName': fullName,
      'totalAppointments': totalAppointments,
      'cancelledAppointments': cancelledAppointments,
      'appointments': appointments.map((item) => item.toJson()).toList(),
    };
  }
}

class CaseAppointment {
  final DateTime date;
  final String status;

  CaseAppointment({
    required this.date,
    required this.status,
  });

  factory CaseAppointment.fromJson(Map<String, dynamic> json) {
    return CaseAppointment(
      date: json['date'] != null ? DateTime.parse(json['date']) : DateTime(2000, 1, 1),
      status: json['status'] ?? 'Unknown',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'date': date.toIso8601String(),
      'status': status,
    };
  }
}