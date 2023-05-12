import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: controller.obx(
          (state) => Text(state.toString()),
          onError: (error) => Text(error.toString()),
          onEmpty: const Text('No data found'),
          onLoading: const CircularProgressIndicator(),
        ),
      ),
    );
  }
}
