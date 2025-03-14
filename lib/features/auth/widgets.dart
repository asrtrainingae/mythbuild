// import 'package:flutter/material.dart';
// import 'package:myth/utils/assets.dart';
// import 'package:myth/utils/extensions.dart';
// import 'package:myth/utils/text_styles.dart';
// import 'package:myth/widgets/text.dart';

// Widget inputTitle(String title){
//   return 
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal:8.0 , vertical: 4.0),
//               child: AlignedText(title , style: TextStyles.secondary16),
//             );

// }

// Widget socialLogin({Function? googlePressed , Function? facebookPressed}){
//   double size = 40;
//   return Row(
//     mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   // Image.asset(Assets.apple,width:size,height: size, fit:BoxFit.fill),
//                   // 20.w,
//                   // InkWell(
//                   //   onTap: (){
//                   //     facebookPressed?.call();
//                   //   },
//                   //   child: Image.asset(Assets.facebook,width:size,height: size, fit:BoxFit.fill)),
//                   // 20.w,
//                   InkWell(
//                     onTap : (){
//                       googlePressed?.call();
//                     },
//                     child: Image.asset(Assets.google,width:size,height: size, fit:BoxFit.fill)), 

//                 ]
//               ); 
// }