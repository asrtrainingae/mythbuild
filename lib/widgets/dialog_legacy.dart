// import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import 'package:myth/services/toast.dart';  // Import the Completer class

//dialgo for showing errors and stuff
class Alerts {
  Future showError({required BuildContext context , required String title , required String body }) async {
    await Future.delayed(Duration(seconds: 1));
    return ToastService.showToast(body);
  }

  Future showSuccess({required BuildContext context , required String title , required String body }) async {
    await Future.delayed(Duration(seconds: 1));
    return ToastService.showToast(body);
  }
  // Future showError({required BuildContext context , required String title , required String body }) async {
  //   await AwesomeDialog(
  //     btnOkColor: Colors.red,
  //     btnCancel: null,
  //           context: context,
  //           dialogType: DialogType.error,
  //           animType: AnimType.topSlide,
  //           title:title,
  //           desc: body,
  //           // btnCancelOnPress: () {},
  //           btnOkOnPress: () {},
  //           )..show();
  // }
  //  Future showSuccess({required BuildContext context , required String title , required String body }) async {
  //   Completer<void> completer = Completer<void>();
  //    AwesomeDialog(
  //     btnCancel: null,
  //           context: context,
  //           dialogType: DialogType.success,
  //           animType: AnimType.topSlide,
  //           title:title,
  //           desc: body,
  //           // btnCancelOnPress: () {},
  //           btnOkOnPress: () {
  //             completer.complete();
  //           },
  //           )..show();
  //           return  completer.future;
  // }
}