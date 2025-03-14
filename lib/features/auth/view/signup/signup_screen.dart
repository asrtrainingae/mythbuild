// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:myth/app_router/app_router.dart';
// import 'package:myth/features/auth/bloc/auth_bloc.dart';
// import 'package:myth/features/auth/data/model/request_models.dart';
// import 'package:myth/features/auth/widgets.dart';
// import 'package:myth/utils/assets.dart';
// import 'package:myth/utils/extensions.dart';
// import 'package:myth/utils/text_styles.dart';
// import 'package:myth/widgets/buttons.dart';
// import 'package:myth/widgets/dialog_legacy.dart';
// import 'package:myth/widgets/text.dart';
// import 'package:myth/widgets/text_inputs.dart';

// class SignupScreen extends StatelessWidget {
//   SignupScreen({super.key});

//   TextEditingController _nameController = TextEditingController();
//   TextEditingController _emailController = TextEditingController();
//   TextEditingController _phoneController = TextEditingController();
//   TextEditingController _confirmController = TextEditingController();
//   TextEditingController _passwordController = TextEditingController();

//   @override 
//   Widget build(BuildContext context) {
//     return  BlocConsumer<AuthBloc, AuthState>(
//       listener: (context, state) async {
//         if(state is UserRegisteredSuccessful){
//           await Alerts().showSuccess(context: context, title: "success", body: "User Registed Successful");
//           Navigator.of(context).pop();
//         }
//         else if (state is UserError) { 
//           Alerts().showError(context: context, title: "err", body: state.message);
//           }
//       },
//         builder: (context, state) => Scaffold(
//           extendBody: true,
//           body: Container(
//             padding:EdgeInsets.all(20),
//             width: double.infinity,
//             height: double.infinity,
//             decoration: BoxDecoration(
//               image: DecorationImage(
//                 image: AssetImage(Assets.background2),
//                 fit:BoxFit.cover)
//             ),
//             child: SingleChildScrollView(
//               child: Column(
//                 children: [
//                   60.h,
//                   Text("Create Account" , style: TextStyles.secondary22Bold),
//                   // AlignedText("Welcome"),
//                   // AlignedText("Please enter your details to proceed.", style: TextStyles.secondary14),
//                   20.h,
//                   inputTitle("User name"),
//                   InputField(
//                             placeholder:  "Alan Mohamed", 
//                             controller: _nameController,
//                           ),
//                   20.h,
//                   inputTitle("Email"),
//                   InputField(
//                             placeholder:  "email@example.com", 
//                             controller: _emailController,
//                           ),
//                   20.h,
//                   inputTitle("Password"),
//                   InputField(
//                             secureText: true ,
//                             placeholder:  "Password",
//                             controller: _passwordController,
//                           ),
//                   20.h,
//                   inputTitle("Confirm Password"),
//                   InputField(
//                             secureText: true ,
//                             placeholder:  "Confirm Password",
//                             controller: _confirmController,
//                           ),
//                   20.h,
    
//                   SizedBox(
//                     width: MediaQuery.of(context).size.width/1.5,
//                     child: Text("By continuing, you agree to Terms of Use and Privacy Policy.",
//                     textAlign: TextAlign.center , style: TextStyles.secondary14)),
//                   10.h, 
//                   state is UserLoading ?
//                              Center(child: CircularProgressIndicator()):RoundedButton("Sign up" , withBorder: true , pressed: (){
//                      final user= SignupRequest(
//                             name: _nameController.text,
//                             password: _passwordController.text.trim(),
//                             email: _emailController.text.trim(),
//                             phone: _phoneController.text.trim(),
//                             );
//                             BlocProvider.of<AuthBloc>(context).add(RegisterEvent(userReq: user));
//                   }),
//                    60.h,
//                   Text("or sign up with" , style: TextStyles.secondary14),
//                   20.h,
//                   socialLogin(googlePressed: (){
//                     BlocProvider.of<AuthBloc>(context).add(GoogleRegisterEvent());
//                   }),
//                   20.h,
    
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Text("Have an account? " , style: TextStyles.secondary14),
//                       InkWell(
//                         onTap: (){
//                           Navigator.of(context).pop();
//                         },
//                         child: Text("Sign in" , style: TextStyles.secondary14Bold)),
    
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           )
//   ));
//       }

// }