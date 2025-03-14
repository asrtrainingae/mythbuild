import 'dart:convert';

import 'package:equatable/equatable.dart';

class User extends Equatable {
  String? userName;
  String? fullName;
  String? email;
  String? phoneNumber;
  String? birthDate;
  String? medicalCenterId;
  String? centerName;
  int? generalNumber;
  String? image;
  Diagnosis? diagnosis;
  bool? isDoctor;
  String? experiance;
  User({
    this.isDoctor,
    this.userName,
    this.fullName,
    this.email,
    this.phoneNumber,
    this.birthDate,
    this.medicalCenterId,
    this.centerName,
    this.generalNumber,
    this.image,
    this.diagnosis,
    this.experiance
  });

  // From JSON
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      isDoctor: json['isDoctor']?? false,
      experiance: json['experiance']?? "",
      userName: json['userName'] as String?,
      fullName: json['fullName'] as String?,
      email: json['email'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      birthDate: json['birthDate'] as String?,
      medicalCenterId: json['medicalCenterId'] as String?,
      centerName: json['centerName'] as String?,
      generalNumber: json['generalNumber'] as int?,
      image: json['image'] as String?,
      diagnosis: json['diagnosis'] != null
          ? Diagnosis.fromJson(json['diagnosis'] as Map<String, dynamic>)
          : null,
    );
  }

  // To JSON
  Map<String, dynamic> toJson() {
    return {
      'userName': userName,
      'isDoctor': isDoctor,
      'fullName': fullName,
      'email': email,
      'phoneNumber': phoneNumber,
      'birthDate': birthDate,
      'medicalCenterId': medicalCenterId,
      'centerName': centerName,
      'generalNumber': generalNumber,
      'image': image,
      'diagnosis': diagnosis?.toJson(),
    };
  }

  @override
  // TODO: implement props
  List<Object?> get props => [userName,phoneNumber, email
  ];
}

class Diagnosis {
  String? patientId;
  String? value;
  String? diagnosisDate;

  Diagnosis({
    this.patientId,
    this.value,
    this.diagnosisDate,
  });

  // From JSON
  factory Diagnosis.fromJson(Map<String, dynamic> json) {
    return Diagnosis(
      patientId: json['patientId'] as String?,
      value: json['value'] as String?,
      diagnosisDate: json['diagnosisDate'] as String?,
    );
  }

  // To JSON
  Map<String, dynamic> toJson() {
    return {
      'patientId': patientId,
      'value': value,
      'diagnosisDate': diagnosisDate,
    };
  }
}

