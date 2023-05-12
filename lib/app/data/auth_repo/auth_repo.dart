import 'package:blog/app/utils/api_client.dart';

class AuthRepository {
  Future<dynamic> login(Map<String, dynamic> data) =>
      ApiClient.instance.post(url: '/accounts/login/', body: data);
  Future<dynamic> register(Map<String, dynamic> data) =>
      ApiClient.instance.post(url: '/accounts/register/', body: data);
  Future<dynamic> logout() => ApiClient.instance.post(url: '/accounts/logout/');
  Future<dynamic> me() => ApiClient.instance.get(url: '/accounts/me/');

  Future<dynamic> refreshToken(String refresh) {
    return ApiClientWithoutAuth.instance.post(
      url: '/accounts/token/refresh/',
      body: {
        "refresh": refresh,
      },
    );
  }
}
