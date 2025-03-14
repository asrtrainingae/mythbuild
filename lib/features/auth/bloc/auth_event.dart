part of 'auth_bloc.dart';

@immutable
sealed class UserEvent {}

class LoginEvent extends UserEvent {
  LoginRequestModel data;
  LoginEvent({required LoginRequestModel this.data});
}

class LogoutEvent extends UserEvent {}

class RegisterEvent extends UserEvent {
  SignupRequest userReq;
  RegisterEvent({required this.userReq});
}


class ForgetPasswordEvent extends UserEvent {}
class GoogleLoginEvent extends UserEvent {}
class GoogleRegisterEvent extends UserEvent {}
class FacebookLoginEvent extends UserEvent {}


class ConfirmPasswordEvent extends UserEvent {}

