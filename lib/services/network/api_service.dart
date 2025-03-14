import 'dart:convert';

import 'package:myth/utils/server/server_config.dart';

import 'http_exceptions.dart';
import 'interceptors/main_interceptor.dart';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import 'models/error_response.dart';
class ApiService {

  final Dio _dio = Dio();
  ApiService() {
    // Add any Dio configuration or interceptors here
    _dio.options.baseUrl = baseUrl;  // Replace with your base URL
    _dio.options.connectTimeout = Duration(seconds: 5);  // Connection timeout in sconds
    _dio.options.headers.addAll({"custom-security" : custom_security_key});
    _dio.options.headers.addAll({"Purchase-Code" : purchase_code});
    _dio.interceptors.add(MainInterceptor());
    _dio.interceptors.add(LogInterceptor(requestBody: true,requestHeader :true,
    responseHeader: false,request: false, responseBody: true, error: true),); 
    
    // _dio.interceptors.add(LogInterceptor(requestBody: false,requestHeader :false,
    // responseHeader: false,request: false, responseBody: false, error: true),); 
  }

  // GET request
  Future<dynamic> get(String url) async {
    try {
      final response = await _dio.get(url);
      final String res = json.encode(response.data);
      if(response.data["status"]==200) 
        return response.data;
      else return ErrorResponse(code: 401,message: response!.data['message']);
    } on DioException catch (e) {
      if (e.response != null) {
        return ErrorResponse(code: 401,message: e.response!.data['message']);
      } else {
        return  ErrorResponse(code: 401,message: e.toString());
      }
    } 
  }

  // POST request
  Future<dynamic> post(String path,{dynamic data}) async {

    try {
      final response = await _dio.post(path, data: data);
      print("DIO RES $response");
      if(response.data["status"]==200) 
        return response.data;
      else return ErrorResponse(code: 401,message: response!.data['message']);
    } on DioException catch (e) {
      if (e.response != null) {
        return ErrorResponse(code: 401,message: e.response!.data['message']);
      } else {
        return  ErrorResponse(code: 401,message: e.toString());
      }
    } 
  }

  // PUT request
  Future<Response> put(String path, Map<String, dynamic> data) async {
    return await _dio.put(path, data: data);
  }
}
