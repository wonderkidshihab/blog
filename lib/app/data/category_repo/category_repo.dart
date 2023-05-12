import 'package:blog/app/data/models/category_model.dart';
import 'package:blog/app/utils/api_client.dart';
import 'package:get/get.dart';

class CategoryRepository {
  Future<List<CategoryModel>> getCategories() async {
    final response = await ApiClient.instance.get(url: 'categories/');
    if (response == null) {
      throw Exception("Error fetching categories");
    } else {
      final categories = response as List;
      return categories.map((e) => CategoryModel.fromMap(e)).toList();
    }
  }

  Future<Response> createCategory(Map<String, dynamic> data) async {
    final response =
        await ApiClient.instance.post(url: 'categories/', body: data);
    if (response == null) {
      throw Exception("Error creating category");
    } else {
      return response;
    }
  }
}
