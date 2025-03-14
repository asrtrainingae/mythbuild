
import 'package:myth/data_model/auth/user.dart';
import 'package:myth/services/network/api_service.dart';

class UserRepository {
  final ApiService _dioService;

  UserRepository(this._dioService);

  // Login function
  Future<User> login(String email, String password) async {
    final response = await _dioService.post('/login', data:{
      'email': email,
      'password': password,
    });

    if (response.statusCode == 200) {
      return User.fromJson(response.data['user']);
    } else {
      throw Exception('Login failed');
    }
  }

  // Fetch current user
  Future<User> fetchCurrentUser() async {
    final response = await _dioService.get('/current-user');

    if (response.statusCode == 200) {
      return User.fromJson(response.data['user']);
    } else {
      throw Exception('Failed to fetch current user');
    }
  }

  // Update user profile
  Future<User> updateUserProfile(User updatedUser) async {
    final response = await _dioService.put('/update-user', updatedUser.toJson());

    if (response.statusCode == 200) {
      return User.fromJson(response.data['user']);
    } else {
      throw Exception('Failed to update profile');
    }
  }

  // Logout function
  Future<void> logout() async {
    // You can implement actual API logout here if needed
    // e.g., clearing tokens or calling a logout endpoint
  }
}
