import 'package:blog/app/data/category_repo/category_repo.dart';
import 'package:blog/app/data/models/category_model.dart';
import 'package:blog/app/data/models/pagination_model.dart';
import 'package:get/get.dart';

class CategoriesController extends GetxController
    with StateMixin<List<CategoryModel>> {
  CategoryRepository categoryRepository = CategoryRepository();
  Rxn<PaginationModel> pagination = Rxn<PaginationModel>();
  @override
  void onInit() {
    super.onInit();
    change([], status: RxStatus.loading());
    fetchCategories();
  }

  Future<void> fetchCategories() async {
    try {
      var data = await categoryRepository.getCategories();
      var categories = data.categories;
      pagination.value = data.pagination;
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
