import 'package:blog/app/data/blog_repo/blog_repository.dart';
import 'package:blog/app/data/models/blog_model.dart';
import 'package:get/get.dart';

class BlogDetailsController extends GetxController with StateMixin<BlogModel> {
  final BlogRepository _blogRepository = BlogRepository();

  @override
  void onInit() {
    fetchPost(int.parse(Get.parameters['id'].toString()));
    super.onInit();
  }

  void fetchPost(int parse) async {
    change(null, status: RxStatus.loading());
    final blog = await _blogRepository.getBlog(id: parse);
    if (blog == null) {
      change(null, status: RxStatus.error("Error fetching blog"));
      return;
    }
    change(blog, status: RxStatus.success());
  }
}
