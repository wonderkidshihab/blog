import 'package:blog/app/modules/auth/controllers/auth_controller.dart';
import 'package:blog/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeView'),
        centerTitle: true,
        actions: [
          GetBuilder<AuthController>(
            builder: (controller) {
              return controller.obx(
                (state) {
                  return state == true
                      ? ElevatedButton.icon(
                          onPressed: () {
                            controller.logout();
                          },
                          icon: const Icon(Icons.logout),
                          label: const Text('Logout'),
                        )
                      : ElevatedButton.icon(
                          onPressed: () {
                            Get.toNamed(Routes.AUTH);
                          },
                          icon: const Icon(Icons.login),
                          label: const Text('Login'),
                        );
                },
              );
            },
          ),
        ],
      ),
      body: controller.obx(
        (state) => ListView.separated(
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(state[index].title ?? 'No title found'),
              subtitle: Text(state[index].excerpt ?? 'No excerpt found'),
            );
          },
          itemCount: state!.length,
          separatorBuilder: (context, index) => const Divider(),
        ),
        onError: (error) => Text(error.toString()),
        onEmpty: const Center(child: Text('No data found')),
        onLoading: const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
