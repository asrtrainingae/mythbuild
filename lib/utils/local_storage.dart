import 'dart:convert';
import 'dart:io';
import 'package:hive_flutter/hive_flutter.dart';

//for local storage we use hive package
class StorageKeys {
  static const tokenKey = 'token' ;
  static const userKey = 'user' ;
}
class LocalStorage {
  static String boxName = "data";

  static Future<void> initHive() async {
    // Directory dir = await getApplicationDocumentsDirectory();
    // var path = Directory.current.path;
    await Hive.initFlutter();
    await Hive.openBox(boxName);
  }

  static Box<dynamic> getBox() {
    return Hive.box(boxName);
  }

  static void addData(String key, dynamic value) {
    try {
    getBox().put(key, jsonEncode(value));
    print("SUCCESS ADD TO LLOCAL SRORA");
      
    } catch (e) {
      getBox().put(key,value);
    }
    }
  

  static dynamic getData(String key) {
    try {
      final box = getBox();
      var data = box.get(key);
      if (data != null) {
        return jsonDecode(data);
      }
      return null;
    } catch (e) {
      print(e);
    }
  }

  static void remove(String key) {
    getBox().delete(key);
  }
}
