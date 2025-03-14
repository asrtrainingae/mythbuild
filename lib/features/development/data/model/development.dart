import 'dart:convert';

class Development {
  final String? name;
  final bool? completed;
  final DateTime? startDate;
  final DateTime? endDate;
  final String? clinicName;
  final String? therapistName;
  final String? completedGoals;
  final String? treatmentGoals;
  final String? treatmentPlan;
  final String? video;

  Development({
    this.name,
    this.completed,
    this.startDate,
    this.endDate,
    this.clinicName,
    this.therapistName,
    this.completedGoals,
    this.treatmentGoals,
    this.treatmentPlan,
    this.video,
  });

  // Factory method to create a Development instance from JSON
  factory Development.fromJson(Map<String, dynamic> json) {
    return Development(
      name: json['name'] as String?,
      completed: json['completed']=="True"?true:false,
      startDate: json['startDate'] != null
          ? DateTime.parse(json['startDate'])
          : null,
      endDate: json['endtDate'] != null
          ? DateTime.parse(json['endtDate'])
          : null,
      clinicName: json['clinicName'] as String?,
      therapistName: json['therapistName'] as String?,
      completedGoals: json['completedGoals'] as String?,
      treatmentGoals: json['treatmentGoals'] as String?,
      treatmentPlan: json['treatmentPlan'] as String?,
      video: json['video'] as String?,
    );
  }

  // Method to convert a Development instance to JSON
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'completed': completed,
      'startDate': startDate?.toIso8601String(),
      'endtDate': endDate?.toIso8601String(),
      'clinicName': clinicName,
      'therapistName': therapistName,
      'completedGoals': completedGoals,
      'treatmentGoals': treatmentGoals,
      'treatmentPlan': treatmentPlan,
      'video': video,
    };
  }
}

// Example usage
void main() {
  String jsonResponse = '''
  {
    "name" : "speech treatment",
    "completed" : false,
    "startDate" : "2024-05-27T07:30:00",
    "endtDate" : "2024-05-27T07:30:00",
    "clinicName": "",
    "therapistName" : "",
    "completedGoals":"",
    "treatmentGoals":"",
    "treatmentPlan":"",
    "video" : ""
  }
  ''';

  // Parse JSON string into a Development instance
  Map<String, dynamic> jsonData = jsonDecode(jsonResponse);
  Development development = Development.fromJson(jsonData);

  print(development.name); // Output: speech treatment

  // Convert Development instance back to JSON
  String encodedJson = jsonEncode(development.toJson());
  print(encodedJson);
}
