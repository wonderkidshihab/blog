import 'package:blog/app/data/category_repo/category_repo.dart';
import 'package:blog/app/data/models/category_model.dart';
import 'package:get/get.dart';

class CategoriesController extends GetxController
    with StateMixin<List<CategoryModel>> {
  CategoryRepository categoryRepository = CategoryRepository();
  @override
  void onInit() {
    super.onInit();
    change([], status: RxStatus.loading());
    fetchCategories();
  }

  Future<void> fetchCategories() async {
    try {
      List<CategoryModel> categories = await categoryRepository.getCategories();
      if (categories.isNotEmpty) {
        change(categories, status: RxStatus.success());
      } else {
        change([], status: RxStatus.empty());
      }
    } on Exception catch (e) {
      change([], status: RxStatus.error(e.toString()));
    }
  }
}
