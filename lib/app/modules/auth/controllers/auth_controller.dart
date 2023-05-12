import 'dart:developer';

import 'package:blog/app/data/auth_repo/auth_repo.dart';
import 'package:blog/app/services/shared_preferences_service.dart';
import 'package:flutter/cupertino.dart';
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
  void onReady() async {
    super.onReady();
    var access = Get.find<SharedPreferencesService>().getString("access");
    var refresh = Get.find<SharedPreferencesService>().getString("refresh");
    if (access != null && refresh != null) {
      var response = await authRepository.refreshToken(refresh);
      if (response != null) {
        Get.find<SharedPreferencesService>()
            .setString("access", response['access']);
        change(true, status: RxStatus.success());
      } else {
        change(false, status: RxStatus.success());
      }
    }
  }

  Future<void> login() async {
    change(null, status: RxStatus.loading());
    try {
      var response = await authRepository.login({
        'username': usernameController.text,
        'password': passwordController.text,
      });

      if (response != null) {
        change(true, status: RxStatus.success());
        Get.find<SharedPreferencesService>()
            .setString("access", response['access']);
        Get.find<SharedPreferencesService>()
            .setString("refresh", response['refresh']);
        stateReset();
        Get.offAllNamed('/home');
      } else {
        errorLogin.value = response['detail'];
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
      log(response.toString(), name: 'AuthController.register');

      if (response != null) {
        login();
      } else {
        errorRegistration.value = response['detail'];
        change(false, status: RxStatus.success());
      }
    } on Exception {
      change(false, status: RxStatus.success());
    }
  }

  void logout() async {
    var result = await Get.dialog(
      CupertinoAlertDialog(
        title: const Text("Logout"),
        content: const Text("Are you sure you want to logout?"),
        actions: [
          CupertinoDialogAction(
            child: const Text("Cancel"),
            onPressed: () {
              Get.back(result: false);
            },
          ),
          CupertinoDialogAction(
            isDestructiveAction: true,
            onPressed: () {
              Get.back(result: true);
            },
            child: const Text("Logout"),
          ),
        ],
      ),
    );
    if (result == null || result == false) return;
    await Get.find<SharedPreferencesService>().remove("access");
    await Get.find<SharedPreferencesService>().remove("refresh");
    change(false, status: RxStatus.success());
  }

  /// Resets the state of the controllers and removes the errors
  void stateReset() {
    usernameController.clear();
    passwordController.clear();
    emailController.clear();
    confirmPasswordController.clear();
    errorLogin.value = null;
    errorRegistration.value = null;
  }
}
