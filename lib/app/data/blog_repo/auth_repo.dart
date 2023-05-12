import 'dart:convert';

import 'package:get/get.dart';

class AuthRepository extends GetConnect {
  AuthRepository() {
    httpClient.baseUrl = 'http://localhost:8000/api/accounts';
    httpClient.defaultContentType = 'application/json';
  }

  Future<Response> login(Map<String, dynamic> data) =>
      post('/login/', jsonEncode(data));
  Future<Response> register(Map<String, dynamic> data) =>
      post('/register/', data);
  Future<Response> logout() => get('/logout/');
  Future<Response> me() => get('/me/');

  Future<Response> refreshToken(String refresh) {
    return post('/token/refresh/', {'refresh': refresh});
  }
}
