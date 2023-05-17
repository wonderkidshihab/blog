import 'package:blog/app/data/models/category_model.dart';
import 'package:blog/app/data/models/pagination_model.dart';
import 'package:blog/app/utils/api_client.dart';
import 'package:get/get.dart';

class CategoryRepository {
  Future<({List<CategoryModel> categories, PaginationModel pagination})>
      getCategories() async {
    final response = await ApiClient.instance.get(url: 'categories/');
    if (response.error != null) {
      throw Exception(response.error);
    } else {
      final categories = response.result['results'] as List;
      return (
        categories: categories.map((e) => CategoryModel.fromMap(e)).toList(),
        pagination: PaginationModel.fromMap(
          response.result['pagination'],
        ),
      );
    }
  }

  Future<Response> createCategory(Map<String, dynamic> data) async {
    final response =
        await ApiClient.instance.post(url: 'categories/', body: data);
    if (response.error != null) {
      throw Exception("Error creating category");
    } else {
      return response.result;
    }
  }
}
