import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:meta/meta.dart';
import 'package:myth/data_model/auth/user.dart';
import 'package:myth/features/auth/data/model/request_models.dart';
import 'package:myth/features/auth/data/repo/auth_repo.dart';
import 'package:myth/services/dependency_injector.dart';
import 'package:myth/utils/local_storage.dart';
import 'package:flutter_login_facebook/flutter_login_facebook.dart';

part 'auth_event.dart';
part 'auth_state.dart';
 
class AuthBloc extends Bloc<UserEvent, AuthState> {
  AuthBloc() : super(UserInitial()) {
    
    on<UserEvent>((event, emit) async {
      if(event is FacebookLoginEvent){
        _onFacebookLogin();
      }
      if(event is LoginEvent){
        emit(UserLoading());
        final user = await sl<AuthRepo>().login(data: event.data);
        user.fold(
          (l){
            emit(UserError(l));
          }, 
          (r){
            emit(UserLoggedIn(user: r));
            final userWithPassword = {
            ...r.toJson(),
            'password': event.data.password, // Add password explicitly
          };
            LocalStorage.addData("user", jsonEncode(userWithPassword));
        });
      }
      if(event is LogoutEvent){

        LocalStorage.remove("user");
        
        // _googleLogout();
        emit(UserNotLoggedIn());
      }
      if(event is RegisterEvent){
        emit(UserLoading());
        final user = await sl<AuthRepo>().signup(data: event.userReq);
        user.fold(
          (l){
            emit(UserError(l));
          }, 
          (r ){
            SignupRequest user = r; 
            add(LoginEvent(data: LoginRequestModel(email: user.email,username: user.email,password: user.password) ));
            // emit(UserLoggedIn(user: User(id:1,userEmail: user.email)));
            // emit(UserRegisteredSuccessful());
        });

      }
      if(event is GoogleLoginEvent){
        // _onGoogleSignInRequested();
      }
      if(event is GoogleRegisterEvent){
        _onGoogleRegisterRequested();
      }
    });
    getUserFromLocalStorage();
  }
  getUserFromLocalStorage() async{
    final user =await LocalStorage.getData("user");
    print("USER IS $user");
    if(user==null || user.isEmpty) emit(UserNotLoggedIn());
    else emit(UserLoggedIn(user: User.fromJson(jsonDecode(user)))); //User.fromJson(jsonDecode(user)());
}
_googleLogout(){
  final GoogleSignIn googleSignIn = GoogleSignIn();
  googleSignIn.signOut();
  }
//  Future<void> _onGoogleSignInRequested() async {
//   final GoogleSignIn googleSignIn = GoogleSignIn();
//     emit(UserLoading());
//     try {
//       final GoogleSignInAccount? user = await googleSignIn.signIn();
//       if (user == null) {
//         // emit(Unauthenticated());
//         print("googleSign in ${user?.email}");
//         return; // Sign-in was aborted
//       }
//       final signUpPayload = SignupRequest(
//         email: user.email, password: "", phone: "", name: user.displayName?? user.email);

//       final GoogleSignInAuthentication googleAuth = await user.authentication;
//       add(LoginEvent(data: LoginRequestModel(email: user.email, password: ""  , type: "social")));
//     } catch (e) {
//       print("googleSign ERRRR $e");
//       emit(UserError(e.toString()));
//     }
//   }
  Future<void> _onGoogleRegisterRequested() async {
  final GoogleSignIn googleSignIn = GoogleSignIn();
    emit(UserLoading());
    try {
      final GoogleSignInAccount? user = await googleSignIn.signIn();
      if (user == null) {
        // emit(Unauthenticated());
        print("googleSign in ${user?.email}");
        return; // Sign-in was aborted
      }
      final signUpPayload = SignupRequest(
        email: user.email, password: "", phone: "", name: user.displayName?? user.email);

      final GoogleSignInAuthentication googleAuth = await user.authentication;
      add(RegisterEvent(userReq: SignupRequest(
        email: user.email, password: "1122", phone: "", name: user.displayName?? user.email)));
    } catch (e) {
      print("googleSign ERRRR $e");
      emit(UserError(e.toString()));
    }
  }

  _onFacebookLogin() async {
    final fb = FacebookLogin();

// Log in
final res = await fb.logIn(permissions: [
  FacebookPermission.publicProfile,
  FacebookPermission.email,
]);

print("Checking result");
// Check result status
switch (res.status) {
  case FacebookLoginStatus.success:
    // Logged in
    
    // Send access token to server for validation and auth
    final FacebookAccessToken? accessToken = res.accessToken;
    print('Access token: ${accessToken?.token}');

    // Get profile data
    final profile = await fb.getUserProfile();
    print('Hello, ${profile?.name}! You ID: ${profile?.userId}');

    // Get user profile image url
    final imageUrl = await fb.getProfileImageUrl(width: 100);
    print('Your profile image: $imageUrl');

    // Get email (since we request email permission)
    final email = await fb.getUserEmail();
    // But user can decline permission
    if (email != null)
      print('And your email is $email');

    break;
  case FacebookLoginStatus.cancel:
    // User cancel log in
    break;
  case FacebookLoginStatus.error:
    // Log in failed
    print('Error while log in: ${res.error}');
    break;
}

  }
}


