class MedicalService {
late String id;
late String name;
late int cost;
late String image;

  MedicalService({
  required this.id,
  required this.name,
  required this.cost,
  required this.image});

  MedicalService.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? "";
    name = json['name'] ?? "";
    cost = json['cost'] ?? "0";
    image = json['image'] ?? "assets/images/appointment/app1.png";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['cost'] = this.cost;
    data['image'] = this.image;
    return data;
  }
}
