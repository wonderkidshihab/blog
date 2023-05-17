import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ignore: constant_identifier_names
const String BASEURL = "http://127.0.0.1:8000/api/";

class ApiClient {
  static final Dio dio = Dio();
  static final ApiClient _instance = ApiClient._internal();
  static ApiClient get instance => _instance;

  factory ApiClient() {
    return _instance;
  }

  ApiClient._internal();

  static Future<ApiClient> init() async {
    dio.options.baseUrl = BASEURL;
    dio.options.connectTimeout = const Duration(seconds: 60);
    dio.options.receiveTimeout = const Duration(seconds: 60);
    dio.options.headers = {
      HttpHeaders.acceptHeader: "application/json",
      HttpHeaders.contentTypeHeader: "application/json",
    };
    await _addInterceptors();
    return _instance;
  }

  static Future<void> _addInterceptors() async {
    final prefs = await SharedPreferences.getInstance();
    dio.interceptors
        .add(InterceptorsWrapper(onRequest: (RequestOptions options, handler) {
      if (prefs.getString("access") != null) {
        options.headers["Authorization"] =
            "Bearer ${prefs.getString("access")}";
        kDebugMode ? log("Token: ${prefs.getString("access")}") : null;
      }
      log(options.data.toString(), name: "Request Data");
      log(options.headers.toString(), name: "Request Headers");
      return handler.next(options);
    }, onResponse: (Response response, handler) {
      log(response.data.toString(), name: "Response Data");
      return handler.next(response);
    }, onError: (DioError e, handler) {
      log(e.toString(), name: "Error");
      log(e.response?.data.toString() ?? "", name: "Error Data");
      return handler.next(e);
    }));
  }

  Future<({String? error, dynamic result})> get({required String url, Map<String, dynamic>? params}) async {
    try {
      final response = await dio.get(url, queryParameters: params);
      return (error: null, result: response.data);
    } on DioError catch (e){
      return (error: e.response?.data["detail"].toString(), result: null);
    }
  }

  Future<({String? error, dynamic result})> post({required String url, Map<String, dynamic>? body}) async {
    try {
      final response = await dio.post(url, data: body);
      return (error: null, result: response.data);
    } on DioError catch (e){
      return (error: e.response?.data["detail"].toString(), result: null);
    }
  }

  Future<({String? error, dynamic result})> put({required String url, Map<String, dynamic>? body}) async {
    try {
      final response = await dio.put(url, data: body);
      return (error: null, result: response.data);
    } on DioError catch (e){
      return (error: e.response?.data["detail"].toString(), result: null);
    }
  }

  Future<({String? error, dynamic result})> delete({required String url, Map<String, dynamic>? body}) async {
    try {
      final response = await dio.delete(url, data: body);
      return (error: null, result: response.data);
    } on DioError catch (e){
      return (error: e.response?.data["detail"].toString(), result: null);
    }
  }

  Future<({String? error, dynamic result})> requestWithFile(
      {required String url,
      Map<String, dynamic>? body,
      required List<MapEntry<String, File>> files}) async {
    try {
      FormData formData = FormData.fromMap(body ?? {});
      for (var fileEntry in files) {
        formData.files.add(
          MapEntry(
            fileEntry.key,
            MultipartFile.fromFileSync(
              fileEntry.value.path,
              filename: fileEntry.value.path.split("/").last,
            ),
          ),
        );
      }

      final response = await dio.post(url, data: formData);
      return (error: null, result: response.data);
    } on DioError catch (e) {
      log(e.toString(), name: "FIle up");
      return (error: e.response?.data["detail"].toString(), result: null);
    }
  }
}

class ApiClientWithoutAuth {
  static final Dio dio = Dio(
    BaseOptions(
      baseUrl: BASEURL,
      headers: {
        HttpHeaders.acceptHeader: "application/json",
        HttpHeaders.contentTypeHeader: "application/json",
      },
    ),
  );
  static final ApiClientWithoutAuth _instance =
      ApiClientWithoutAuth._internal();
  static ApiClientWithoutAuth get instance => _instance;

  factory ApiClientWithoutAuth() {
    return _instance;
  }
  ApiClientWithoutAuth._internal();
  Future get({required String url, Map<String, dynamic>? params}) async {
    try {
      final response = await dio.get(url, queryParameters: params);
      return response.data;
    } on DioError {
      return null;
    }
  }

  // Future post({required String url, Map<String, dynamic>? body}) async {
  //   try {
  //     final response = await dio.post(url, data: body);
  //     return response.data;
  //   } on DioError catch (e) {
  //     log(e.toString(), name: "Error");
  //     return null;
  //   }
  // }

  Future<({String? error, dynamic result})> post({required String url, Map<String, dynamic>? body}) async {
    try {
      final response = await dio.post(url, data: body);
      return (error: null, result: response.data);
    } on DioError catch (e){
      return (error: e.response?.data["detail"].toString(), result: null);
    }
  }

  Future<({String? error, dynamic result})> put({required String url, Map<String, dynamic>? body}) async {
    try {
      final response = await dio.put(url, data: body);
      return (error: null, result: response.data);
    } on DioError catch (e){
      return (error: e.response?.data["detail"].toString(), result: null);
    }
  }

  Future<({String? error, dynamic result})> delete({required String url, Map<String, dynamic>? body}) async {
    try {
      final response = await dio.delete(url, data: body);
      return (error: null, result: response.data);
    } on DioError catch (e){
      return (error: e.response?.data["detail"].toString(), result: null);
    }
  }

  Future<({String? error, dynamic result})> requestWithFile(
      {required String url,
      Map<String, dynamic>? body,
      required List<MapEntry<String, File>> files}) async {
    try {
      FormData formData = FormData.fromMap(body ?? {});
      for (var fileEntry in files) {
        formData.files.add(
          MapEntry(
            fileEntry.key,
            MultipartFile.fromFileSync(
              fileEntry.value.path,
              filename: fileEntry.value.path.split("/").last,
            ),
          ),
        );
      }

      final response = await dio.post(url, data: formData);
      return (error: null, result: response.data);
    } on DioError catch (e) {
      log(e.toString(), name: "FIle up");
      return (error: e.response?.data["detail"].toString(), result: null);
    }
  }
}
