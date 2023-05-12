import 'package:blog/app/data/blog_repo/blog_repository.dart';
import 'package:blog/app/data/models/blog_model.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class HomeController extends GetxController with StateMixin<List<BlogModel>> {
  final _blogRepository = BlogRepository();
  RxMap<String, dynamic> queryParams = <String, dynamic>{}.obs;
  final listOfOrder = <String>[
    'title',
    'category',
    'published',
  ];

  TextEditingController searchController = TextEditingController();
  @override
  void onInit() {
    super.onInit();
    getBlogs();
  }

  Future<void> getBlogs() async {
    change([], status: RxStatus.loading());
    final blogs = await _blogRepository.getBlogs(queryParams: queryParams);
    if (blogs.isEmpty) {
      change([], status: RxStatus.empty());
      return;
    }
    change(blogs, status: RxStatus.success());
  }

  void selectCategory(int id) async {
    queryParams['category'] == id
        ? queryParams.remove('category')
        : queryParams['category'] = id;
    change(state, status: RxStatus.loading());
    final blogs = await _blogRepository.getBlogs(queryParams: queryParams);
    if (blogs.isEmpty) {
      change([], status: RxStatus.empty());
      return;
    }
    change(blogs, status: RxStatus.success());
  }

  void selectOrder(String order) async {
    queryParams['ordering'] == order
        ? queryParams.remove('ordering')
        : queryParams['ordering'] = order;
    change(state, status: RxStatus.loading());
    final blogs = await _blogRepository.getBlogs(queryParams: queryParams);
    if (blogs.isEmpty) {
      change([], status: RxStatus.empty());
      return;
    }
    change(blogs, status: RxStatus.success());
  }
}
