import 'package:blog/app/modules/auth/controllers/auth_controller.dart';
import 'package:blog/app/modules/home/controllers/blog_controller.dart';
import 'package:blog/app/modules/home/sections/categories_section.dart';
import 'package:blog/app/modules/home/sections/create_blog_button.dart';
import 'package:blog/app/modules/home/sections/filter_bottomsheet.dart';
import 'package:blog/app/modules/home/sections/posts_section.dart';
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
          OutlinedButton.icon(
            onPressed: () {
              Get.bottomSheet(const FilterBottomsheet());
            },
            icon: const Icon(Icons.filter_alt_outlined),
            label: const Text('Filter'),
          ),
          const SizedBox(width: 10),
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
      body: Column(
        children: [
          const SizedBox(height: 20),
          const CategoriesSection(),
          const SizedBox(height: 20),
          // PostsSection(),
          GetBuilder<BlogController>(
            init: BlogController(),
            builder: (controller) {
              return controller.obx(
                (state) {
                  return const PostsSection();
                },
                onError: (error) => Text(error.toString()),
                onEmpty: const Center(child: Text('No Posts found')),
                onLoading: const Center(child: CircularProgressIndicator()),
              );
            },
          ),
        ],
      ),
      floatingActionButton: const CreateBlogButton(),
    );
  }
}
