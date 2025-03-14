// import 'package:flutter/material.dart';
// import 'package:myth/app_router/app_router.dart';
// import 'package:myth/features/auth/widgets.dart';
// import 'package:myth/utils/assets.dart';
// import 'package:myth/utils/extensions.dart';
// import 'package:myth/utils/text_styles.dart';
// import 'package:myth/widgets/buttons.dart';
// import 'package:myth/widgets/text.dart';
// import 'package:myth/widgets/text_inputs.dart';

// class ConfirmPasswordScreen extends StatelessWidget {
//   ConfirmPasswordScreen({super.key});

//   TextEditingController _passwordController = TextEditingController();

//   @override 
//   Widget build(BuildContext context) {
//     return  Scaffold(
//       extendBody: true,
//       body: Container(
//         padding:EdgeInsets.all(20),
//         width: double.infinity,
//         height: double.infinity,
//         decoration: BoxDecoration(
//           image: DecorationImage(
//             image: AssetImage(Assets.background2),
//             fit:BoxFit.cover)
//         ),
//         child: SingleChildScrollView(
//           child: Column(
//             children: [
//               80.h,
//               Text("Confirm Password" , style: TextStyles.secondary22Bold),
//               40.h,
//               60.h,
//               inputTitle("Email"),
//               InputField(
//                         placeholder:  "Email", 
//                         controller: _passwordController,
//                       ),
//               30.h,
//               inputTitle("OTP"),
//               InputField(
//                         placeholder:  "XXXXX",
//                         controller: _passwordController,
//                       ),
//               30.h,
//               inputTitle("Password"),
//               InputField(
//                         secureText: true ,
//                         placeholder:  "Password",
//                         controller: _passwordController,
//                       ),
//               30.h,
//               inputTitle("Confirm Password"),
//               InputField(
//                         secureText: true ,
//                         placeholder:  "Confirm Password",
//                         controller: _passwordController,
//                       ),
//               40.h,
//               RoundedButton("Confirm" , withBorder: true,
//               pressed: (){
//                 Navigator.pushNamed(context, Routes.login);
//               }),
//             ],
//           ),
//         ),
//       )
//     );
//   }

// }