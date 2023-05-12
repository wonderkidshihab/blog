import 'package:get/get.dart';

import '../controllers/create_blog_controller.dart';

class CreateBlogBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CreateBlogController>(
      () => CreateBlogController(),
    );
  }
}
