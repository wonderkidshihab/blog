import 'package:blog/app/modules/create_blog/controllers/categories_controller.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
    Get.lazyPut<CategoriesController>(
      () => CategoriesController(),
    );
  }
}
