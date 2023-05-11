import 'package:blog/app/modules/auth/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends GetView<AuthController> {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.loginFormKey,
      child: Column(
        children: [
          TextFormField(
            controller: controller.usernameController,
            decoration: const InputDecoration(
              labelText: 'Username',
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Username is required';
              }
              return null;
            },
          ),
          TextFormField(
            controller: controller.passwordController,
            decoration: const InputDecoration(
              labelText: 'Password',
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Password is required';
              }
              return null;
            },
          ),
          const SizedBox(
            height: 10,
          ),
          Obx(() => controller.errorLogin.value != null
              ? Text(
                  controller.errorLogin.value!,
                  style: const TextStyle(color: Colors.red),
                )
              : Container()),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
            onPressed: () {
              if (controller.loginFormKey.currentState!.validate()) {
                controller.login();
              }
            },
            child: const Text('Login'),
          ),
        ],
      ),
    );
  }
}
