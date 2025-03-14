import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:myth/utils/local_storage.dart';
import '../http_exceptions.dart';

class MainInterceptor extends Interceptor {
  static String token = "";

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (getToken().isNotEmpty) {
      // auth type is Bearer
      // options.headers["Authorization"] = "Bearer $token";
      //if auth type is basic auth
      
      options.headers["Authorization"] = "Bearer $token";
      
    }
    handler.next(options); //continue
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    throw HttpExceptions.fromDioException(err);
  }


  static getToken()  {
    //try search for token only
    token = LocalStorage.getData("token")??"";
    return token;
  }

  static logout() {
    token = "";
  }
}
