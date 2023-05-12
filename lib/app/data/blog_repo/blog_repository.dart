import 'package:blog/app/data/models/blog_model.dart';
import 'package:blog/app/utils/api_client.dart';

class BlogRepository {
  Future<List<BlogModel>> getBlogs({required Map<String, dynamic> queryParams}) async {
    final response = await ApiClient.instance.get(url: 'posts/', params: queryParams);
    if (response == null) {
      throw Exception("Error fetching blogs");
    } else {
      final blogs = response as List;
      return blogs.map((e) => BlogModel.fromMap(e)).toList();
    }
  }

  Future<Map<String, dynamic>?> createBlog(
      {required String title,
      required String excerpt,
      required String content,
      required String status,
      required String slug,
      required int category}) async {
    final response = await ApiClient.instance.post(url: 'posts/', body: {
      'title': title,
      'excerpt': excerpt,
      'content': content,
      'status': status,
      'slug': slug,
      'category': category,
    });
    if (response == null) {
      throw Exception("Error creating blog");
    } else {
      return response;
    }
  }
}
