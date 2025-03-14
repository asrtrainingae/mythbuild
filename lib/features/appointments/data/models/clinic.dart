class Clinic {
  String? id;
  String? name;
  String? description;
  String? speicality;
  String? image;

  Clinic({this.id, this.name, this.description, this.speicality, this.image});

  Clinic.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    speicality = json['speicality'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['speicality'] = this.speicality;
    data['image'] = this.image;
    return data;
  }
}
