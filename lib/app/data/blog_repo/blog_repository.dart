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

  createBlog(
      {required String title,
      required String excerpt,
      required String content,
      required String status,
      required String slug}) async {
    final response = await post('posts', {
      "title": title,
      "excerpt": excerpt,
      "content": content,
      "status": status,
      "slug": slug,
    });
    if (response.hasError) {
      throw Exception(response.statusText);
    } else {
      return response.body;
    }
  }
}
