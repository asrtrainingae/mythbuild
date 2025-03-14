class AppointmentPayload {
  String? startDate;
  String? clinicId;
  String? serviceId;
  String? petId;
  String? title;
  String? description;

  AppointmentPayload(
      {this.startDate,
      this.clinicId,
      this.serviceId,
      this.petId,
      this.title,
      this.description});

  AppointmentPayload.fromJson(Map<String, dynamic> json) {
    startDate = json['StartDate'];
    clinicId = json['ClinicId'];
    serviceId = json['ServiceId'];
    petId = json['PetId'];
    title = json['Title'];
    description = json['Description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['StartDate'] = this.startDate;
    data['ClinicId'] = this.clinicId;
    data['ServiceId'] = this.serviceId;
    data['PetId'] = this.petId;
    data['Title'] = this.title;
    data['Description'] = this.description;
    return data;
  }
}
