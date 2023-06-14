// Abstract class/Mixin that would be bounded with a GetxController

import 'dart:developer';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

abstract class GetQuery<T> extends GetxController with StateMixin<T> {
  String get endpoint;
  Map<String, String> get params => {};
  Map<String, String> get headers => {};
  Map<String, dynamic> get body => {};
  String get method => 'GET';
  bool get isMultipart => false;
  GetHttpClient? client;

  GetQuery() {
    client ??= Get.find<GetHttpClient>();
  }

  T decoder(dynamic data);
  void onError(String error) {
    log(error, name: 'GetQuery $T');
  }

  void onFetch(data) {
    log('Data fetched successfully', name: 'GetQuery $T');
  }

  /// Create a new `GetHttpClient` using the provided getHttpClient function.
  /// If no getHttpClient function is provided, use the default `GetHttpClient`.
  /// Initialize `GetStorage`.
  static Future<void> init([GetHttpClient? getHttpClient]) async {
    Get.lazyPut<GetHttpClient>(() => getHttpClient ?? GetHttpClient());
    await GetStorage.init();
  }

  @override
  void onInit() {
    change(null, status: RxStatus.loading());
    fetch();
    super.onInit();
  }

  void fetch() async {
    try {
      final response = await client!.request(
        endpoint,
        method,
        headers: headers,
        body: body,
        query: params,
      );
      if (response.hasError) {
        onError(response.statusText!);
        change(null, status: RxStatus.error(response.statusText!));
      } else {
        onFetch(response.body);
        change(decoder(response.body as Map<String, dynamic>),
            status: RxStatus.success());
      }
    } catch (e) {
      onError(e.toString());
      change(null, status: RxStatus.error(e.toString()));
    }
  }
}

mixin CacheQuery<T> on GetQuery<T> {
  String get cacheKey => endpoint + params.toString();
  bool get cacheEnabled => true;

  @override
  void fetch() async {
    if (cacheEnabled) {
      final data = GetStorage().read(cacheKey);
      if (data != null) {
        change(decoder(data as Map<String, dynamic>),
            status: RxStatus.success());
        return;
      }
    }
    super.fetch();
  }

  @override
  void onFetch(data) {
    if (cacheEnabled) {
      GetStorage().write(cacheKey, data);
    }
    super.onFetch(data);
  }

  clearCache() {
    GetStorage().remove(cacheKey);
  }
}

abstract class GetQueryWithCache<T> extends GetQuery<T> with CacheQuery {
  GetQueryWithCache() : super();
}
