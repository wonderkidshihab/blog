import 'package:blog/app/data/get_query.dart';
import 'package:blog/app/data/models/blog_model.dart';
import 'package:get/get_connect/http/src/http.dart';

class BlogController extends GetQueryWithCache<List<BlogModel>> {
  @override
  String get endpoint => 'posts/';

  @override
  GetHttpClient? get client => GetHttpClient(
        baseUrl: "http://localhost:8000/api/",
      );

  @override
  List<BlogModel> decoder(dynamic data) {
    return (data['results'] as List)
        .map((e) => BlogModel.fromMap(e as Map<String, dynamic>))
        .toList();
  }
}
