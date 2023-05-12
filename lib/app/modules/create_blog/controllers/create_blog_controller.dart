import 'dart:developer';

import 'package:blog/app/data/blog_repo/blog_repository.dart';
import 'package:blog/app/data/models/category_model.dart';
import 'package:blog/app/modules/home/controllers/home_controller.dart';
import 'package:blog/app/routes/app_pages.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class CreateBlogController extends GetxController with StateMixin<bool> {
  late GlobalKey<FormState> formKey;

  // fields = ["id", "title", "author", "excerpt", "content", "status", "slug", "category"]
  late TextEditingController titleController;
  late TextEditingController excerptController;
  late TextEditingController contentController;
  String statusController = "published";
  late TextEditingController slugController;
  BlogRepository blogRepository = BlogRepository();

  List<String> statuses = ["published", "draft"];

  Rxn<CategoryModel> selectedCategory = Rxn<CategoryModel>();

  @override
  void onInit() {
    super.onInit();
    formKey = GlobalKey<FormState>();
    titleController = TextEditingController();
    excerptController = TextEditingController();
    contentController = TextEditingController();
    slugController = TextEditingController();
    change(false, status: RxStatus.success());
  }

  Future<void> createBlog() async {
    change(true, status: RxStatus.loading());
    try {
      var response = await blogRepository.createBlog(
        title: titleController.text,
        excerpt: excerptController.text,
        content: contentController.text,
        status: statusController,
        slug: slugController.text,
        category: selectedCategory.value!.id,
      );
      log(response.toString(), name: "CreateBlogController");
      if (response != null) {
        Get.find<HomeController>().getBlogs();
        Get.snackbar("Success", "Blog created successfully");
        Get.offAndToNamed(Routes.HOME);
      } else {
        Get.snackbar("Error", "Something went wrong");
      }
    } on Exception catch (e) {
      log(e.toString(), name: "CreateBlogController");
      Get.snackbar("Error", e.toString());
    }
    change(false, status: RxStatus.success());
  }
}
