import 'package:blog/app/modules/blog_details/controllers/blog_details_controller.dart';
import 'package:get/get.dart';

class BlogDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BlogDetailsController());
  }
}
