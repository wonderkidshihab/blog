import 'package:blog/app/modules/create_blog/controllers/categories_controller.dart';
import 'package:blog/app/modules/home/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoriesSection extends GetView<HomeController> {
  const CategoriesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: GetBuilder<CategoriesController>(
        builder: (CategoriesController categoriesController) {
          return categoriesController.obx(
            (state) {
              return ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Obx(
                    () => ChoiceChip(
                      label: Text(state[index].name),
                      selected:
                          controller.queryParams['category'] == state[index].id,
                      onSelected: (value) {
                        controller.selectCategory(state[index].id);
                      },
                    ),
                  );
                },
                itemCount: state!.length,
                separatorBuilder: (BuildContext context, int index) {
                  return const SizedBox(width: 10);
                },
              );
            },
            onError: (error) => Text(error.toString()),
            onEmpty: const Center(child: Text('No Categories found')),
            onLoading: const Center(child: CircularProgressIndicator()),
          );
        },
      ),
    );
  }
}
