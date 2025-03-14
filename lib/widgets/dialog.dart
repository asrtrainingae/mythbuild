// import 'package:awesome_dialog/awesome_dialog.dart';
// import 'package:flutter/material.dart';
// import 'dart:async';  // Import the Completer class
// import 'package:rflutter_alert/rflutter_alert.dart';

// //dialgo for showing errors and stuff
// class Alerts {
//   Future showError({required BuildContext context , required String title , required String body }) async {
//     await  Alert(
//       context: context,
//       type: AlertType.error,
//       title: "RFLUTTER ALERT",
//       desc: "Flutter is more awesome with RFlutter Alert.",
//       buttons: [
//         DialogButton(
//           child: Text(
//             "COOL",
//             style: TextStyle(color: Colors.white, fontSize: 20),
//           ),
//           onPressed: () => Navigator.pop(context),
//           width: 120,
//         )
//       ],
//     ).show();;
//   }
//    Future showSuccess({required BuildContext context , required String title , required String body }) async {
//     Completer<void> completer = Completer<void>();
//      AwesomeDialog(
//       btnCancel: null,
//             context: context,
//             dialogType: DialogType.success,
//             animType: AnimType.topSlide,
//             title:title,
//             desc: body,
//             // btnCancelOnPress: () {},
//             btnOkOnPress: () {
//               completer.complete();
//             },
//             )..show();
//             return  completer.future;
//   }
// }