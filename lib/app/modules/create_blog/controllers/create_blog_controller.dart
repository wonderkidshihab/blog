import 'package:blog/app/data/blog_repo/blog_repository.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class CreateBlogController extends GetxController with StateMixin<bool> {
  late GlobalKey<FormState> formKey;

  // fields = ["id", "title", "author", "excerpt", "content", "status", "slug", "category"]
  late TextEditingController titleController;
  late TextEditingController excerptController;
  late TextEditingController contentController;
  String statusController = "publish";
  late TextEditingController slugController;
  BlogRepository blogRepository = BlogRepository();

  List<String> statuses = ["publish", "draft"];

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
    await blogRepository.createBlog(
      title: titleController.text,
      excerpt: excerptController.text,
      content: contentController.text,
      status: statusController,
      slug: slugController.text,
    );
    change(false, status: RxStatus.success());
  }
}
