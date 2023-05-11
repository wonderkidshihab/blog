import 'package:blog/app/modules/auth/widgets/login_page.dart';
import 'package:blog/app/modules/auth/widgets/register_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/auth_controller.dart';

class AuthView extends GetView<AuthController> {
  const AuthView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Authenticate'),
        centerTitle: true,
        bottom: TabBar(
          controller: controller.tabController,
          tabs: const [
            Tab(
              text: 'Login',
            ),
            Tab(
              text: 'Register',
            ),
          ],
        ),
      ),
      body: controller.obx(
        (state) => TabBarView(
          controller: controller.tabController,
          children: const [
            Center(
              child: LoginPage(),
            ),
            Center(
              child: RegistrationPage(),
            ),
          ],
        ),
        onError: (error) {
          return Center(
            child: SelectableText(error.toString()),
          );
        },
        onLoading: const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
