import 'package:blog/app/data/models/category_model.dart';
import 'package:blog/app/modules/create_blog/controllers/categories_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/create_blog_controller.dart';

class CreateBlogView extends GetView<CreateBlogController> {
  const CreateBlogView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CreateBlogView'),
        centerTitle: true,
      ),
      body: controller.obx(
        (state) {
          return Form(
            key: controller.formKey,
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                TextFormField(
                  controller: controller.titleController,
                  decoration: const InputDecoration(
                    labelText: 'Title',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter title';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: controller.excerptController,
                  decoration: const InputDecoration(
                    labelText: 'Excerpt',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter excerpt';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: controller.contentController,
                  decoration: const InputDecoration(
                    labelText: 'Content',
                  ),
                  maxLines: 10,
                  maxLength: 1000,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter content';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                GetBuilder<CategoriesController>(
                    builder: (CategoriesController categoriesController) {
                  return categoriesController.obx(
                    (state) {
                      return DropdownButtonFormField<CategoryModel>(
                        value: controller.selectedCategory.value,
                        onChanged: (value) {
                          controller.selectedCategory.value = value;
                        },
                        items: state!
                            .map((e) => DropdownMenuItem<CategoryModel>(
                                  value: e,
                                  child: Text(e.name),
                                ))
                            .toList(),
                        decoration: const InputDecoration(
                          labelText: 'Category',
                        ),
                        validator: (value) {
                          if (value == null) {
                            return 'Please select category';
                          }
                          return null;
                        },
                      );
                    },
                    onError: (error) => Text(error.toString()),
                    onEmpty: const Center(child: Text('No data found')),
                    onLoading: const Center(child: CircularProgressIndicator()),
                  );
                }),
                const SizedBox(height: 16),
                DropdownButtonFormField<String>(
                  value: controller.statusController,
                  onChanged: (value) {
                    controller.statusController = value!;
                  },
                  items: controller.statuses
                      .map((e) => DropdownMenuItem<String>(
                            value: e,
                            child: Text(e.capitalizeFirst!),
                          ))
                      .toList(),
                  decoration: const InputDecoration(
                    labelText: 'Status',
                  ),
                  validator: (value) {
                    if (value == null) {
                      return 'Please select status';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: controller.slugController,
                  decoration: const InputDecoration(
                    labelText: 'Slug',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter slug';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    if (controller.formKey.currentState!.validate()) {
                      controller.createBlog();
                    }
                  },
                  child: const Text('Create'),
                ),
              ],
            ),
          );
        },
        onError: (error) => Text(error.toString()),
        onEmpty: const Center(child: Text('No data found')),
        onLoading: const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
