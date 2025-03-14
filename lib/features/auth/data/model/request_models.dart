class RegisterRequest {
  String email;
  String password;
  String phone;
  String name;

  RegisterRequest({
    required this.email,
    required this.password,
    required this.phone,
    required this.name,
  });

  // Factory method to create an instance of User from JSON
  factory RegisterRequest.fromJson(Map<String, dynamic> json) {
    return RegisterRequest(
      email: json['email'] as String,
      password: json['password'] as String,
      phone: json['phone'] as String,
      name: json['name'] as String,
    );
  }

  // Method to convert an instance of RegisterRequest to JSON
  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
      'phone': phone,
      'name': name,
    };
  }
}



/////////////////////////////////////////
class LoginRequestModel {
  String email;
  String username;
  String password;
  String? type;

  LoginRequestModel({
    required this.email,
    required this.username,
    required this.password,
    this.type,
  });

  // Factory method to create an instance of LoginRequestModel from JSON
  factory LoginRequestModel.fromJson(Map<String, dynamic> json) {
    return LoginRequestModel(
      email: json['email'] as String,
      username: json['username'] as String,
      password: json['password'] as String,
      type: json['type']??"" as String,
    );
  }

  // Method to convert an instance of LoginRequestModel to JSON
  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'username': username,
      'password': password,
      'type': type??"",
    };
  }
}


class SignupRequest {
  String email;
  String password;
  String phone;
  String name;

  SignupRequest({
    required this.email,
    required this.password,
    required this.phone,
    required this.name,
  });

  // Converts a User object into a JSON map
  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
      'phone': phone,
      'name': name,
    };
  }
}

