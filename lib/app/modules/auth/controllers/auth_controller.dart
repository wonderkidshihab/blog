import 'dart:developer';

import 'package:blog/app/data/blog_repo/auth_repo.dart';
import 'package:blog/app/services/shared_preferences_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController
    with GetTickerProviderStateMixin, StateMixin<bool> {
  late TabController tabController;
  late GlobalKey<FormState> loginFormKey;
  late GlobalKey<FormState> registerFormKey;
  AuthRepository authRepository = AuthRepository();
  RxnString errorLogin = RxnString();
  RxnString errorRegistration = RxnString();

  TextEditingController emailController = TextEditingController();
  TextEditingController usernameController = TextEditingController();

  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  @override
  void onInit() {
    change(null, status: RxStatus.success());
    tabController = TabController(length: 2, vsync: this);
    loginFormKey = GlobalKey<FormState>();
    registerFormKey = GlobalKey<FormState>();
    super.onInit();
  }

  @override
  void onReady()async{
    super.onReady();
  }



  Future<void> login() async {
    change(null, status: RxStatus.loading());
    try {
      var response = await authRepository.login({
        'username': usernameController.text,
        'password': passwordController.text,
      });

      if (response.statusCode == 200) {
        change(true, status: RxStatus.success());
        Get.find<SharedPreferencesService>().setString("access", response.body['access']);
        Get.find<SharedPreferencesService>().setString("refresh", response.body['refresh']);
        Get.offAllNamed('/home');
      } else {
        errorLogin.value = response.body['detail'];
        change(false, status: RxStatus.success());
      }
    } on Exception {
      change(false, status: RxStatus.success());
    }
  }

  Future<void> register() async {
    change(null, status: RxStatus.loading());
    try {
      var response = await authRepository.register({
        'username': usernameController.text,
        'email': emailController.text,
        'password': passwordController.text,
      });
      log(response.body.toString(), name: 'AuthController.register');

      if (response.statusCode == 200) {
        login();
      } else {
        errorRegistration.value = response.body['detail'];
        change(false, status: RxStatus.success());
      }
    } on Exception {
      change(false, status: RxStatus.success());
    }
  }
}
