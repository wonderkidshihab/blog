import 'package:blog/app/modules/auth/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegistrationPage extends GetView<AuthController> {
  const RegistrationPage({super.key});
  // username, email, password, confirm_password

  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.registerFormKey,
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
            controller: controller.emailController,
            decoration: const InputDecoration(
              labelText: 'Email',
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Email is required';
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
              } else if (value.length < 6) {
                return 'Password must be at least 6 characters';
              }
              return null;
            },
          ),
          TextFormField(
            controller: controller.confirmPasswordController,
            decoration: const InputDecoration(
              labelText: 'Confirm Password',
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Confirm Password is required';
              } else if (value != controller.passwordController.text) {
                return 'Confirm Password must be same as Password';
              }
              return null;
            },
          ),
          const SizedBox(
            height: 10,
          ),
          Obx(() => controller.errorRegistration.value != null
              ? Text(
                  controller.errorRegistration.value!,
                  style: const TextStyle(color: Colors.red),
                )
              : Container()),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
            onPressed: () {
              if (controller.registerFormKey.currentState!.validate()) {
                controller.register();
              }
            },
            child: const Text('Register'),
          ),
        ],
      ),
    );
  }
}
