import 'package:blog/app/modules/create_blog/controllers/categories_controller.dart';
import 'package:get/get.dart';

import '../controllers/create_blog_controller.dart';

class CreateBlogBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CreateBlogController>(
      () => CreateBlogController(),
    );
    Get.lazyPut<CategoriesController>(
      () => CategoriesController(),
    );
  }
}
