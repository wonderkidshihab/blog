import 'package:blog/app/data/blog_repo/blog_repository.dart';
import 'package:blog/app/data/models/blog_model.dart';
import 'package:get/get.dart';

class HomeController extends GetxController with StateMixin<List<BlogModel>> {
  final _blogRepository = BlogRepository();
  @override
  void onInit() {
    super.onInit();
    getBlogs();
  }

  Future<void> getBlogs() async {
    change([], status: RxStatus.loading());
    try {
      final blogs = await _blogRepository.getBlogs();
      if (blogs.isEmpty) {
        change([], status: RxStatus.empty());
        return;
      }
      change(blogs, status: RxStatus.success());
    } catch (e) {
      change([], status: RxStatus.error(e.toString()));
    }
  }
}
