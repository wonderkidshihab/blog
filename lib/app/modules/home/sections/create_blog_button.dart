import 'package:blog/app/modules/auth/controllers/auth_controller.dart';
import 'package:blog/app/modules/home/controllers/home_controller.dart';
import 'package:blog/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateBlogButton extends GetView<HomeController> {
  const CreateBlogButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
      builder: (controller) {
        return controller.obx(
          (state) {
            return state == true
                ? FloatingActionButton(
                    onPressed: () {
                      Get.toNamed(Routes.CREATE_BLOG);
                    },
                    child: const Icon(Icons.add),
                  )
                : const SizedBox.shrink();
          },
        );
      },
    );
  }
}
