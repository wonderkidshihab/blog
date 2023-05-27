import 'package:blog/app/data/models/blog_model.dart';
import 'package:blog/app/data/models/pagination_model.dart';
import 'package:blog/app/utils/api_client.dart';

class BlogRepository {
  Future<({List<BlogModel> blogs, PaginationModel pagination})> getBlogs(
      {required Map<String, dynamic> queryParams}) async {
    final response =
        await ApiClient.instance.get(url: 'posts/', params: queryParams);
    if (response.error != null) {
      return (
        blogs: <BlogModel>[],
        pagination: PaginationModel(),
      );
    } else {
      final blogs = response.result['results'] as List;
      return (
        blogs: blogs.map((e) => BlogModel.fromMap(e)).toList(),
        pagination: PaginationModel.fromMap(
          response.result['pagination'],
        ),
      );
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
    if (response.error != null) {
      throw Exception(response.error);
    } else {
      return response.result;
    }
  }

  getBlog({required int id}) async {
    final response = await ApiClient.instance.get(url: 'posts/$id/');
    if (response.error != null) {
      throw Exception(response.error);
    } else {
      return BlogModel.fromMap(response.result);
    }
  }
}
