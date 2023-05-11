import 'package:blog/app/data/models/blog_model.dart';
import 'package:get/get.dart';

class BlogRepository extends GetConnect {
  BlogRepository() {
    // httpClient.baseUrl = 'http://127.0.0.1:8000/api/';
    baseUrl = 'http://127.0.0.1:8000/api/';
  }
  Future<List<BlogModel>> getBlogs() async {
    final response = await get('posts');
    if (response.hasError) {
      throw Exception(response.statusText);
    } else {
      final blogs = response.body as List;
      return blogs.map((e) => BlogModel.fromMap(e)).toList();
    }
  }
}