part of 'auth_bloc.dart';

abstract class AuthState {}

class UserInitial extends AuthState {}

class UserLoggedIn extends AuthState {
  final User user;
  UserLoggedIn({required this.user});
}

class UserNotLoggedIn extends AuthState {}

class UserLoading extends AuthState {}
class UserRegisteredSuccessful extends AuthState {}

class UserError extends AuthState {
  final String message;
  UserError(this.message);
}
