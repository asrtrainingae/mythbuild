import 'dart:convert';

import 'package:myth/data_model/auth/user.dart';
import 'package:myth/utils/local_storage.dart';

Future<bool> isDoctor() async {
  final userData = await LocalStorage.getData("user");
  final user = User.fromJson(jsonDecode(userData!));
  return user.isDoctor??false;
}