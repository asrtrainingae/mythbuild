class Noti {
  String? createDate;
  String? clinicName;
  String? centerName;
  String? body;
  String? title;
  bool? isRead;
  String? type;

  Noti(
      {this.createDate,
      this.clinicName,
      this.centerName,
      this.body,
      this.title,
      this.type,
      this.isRead});

  Noti.fromJson(Map<String, dynamic> json) {
    createDate = json['createDate'];
    clinicName = json['clinicName'];
    centerName = json['centerName'];
    body = json['body'];
    title = json['title'];
    isRead = json['isRead'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['createDate'] = this.createDate;
    data['clinicName'] = this.clinicName;
    data['centerName'] = this.centerName;
    data['body'] = this.body;
    data['title'] = this.title;
    data['isRead'] = this.isRead;
    data['type'] = this.type;
    return data;
  }
}

//types|
//1 reminder
//2 note
//3 update status
//4 birthday