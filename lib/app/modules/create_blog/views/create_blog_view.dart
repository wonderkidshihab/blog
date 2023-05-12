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
                    border: OutlineInputBorder(),
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
                    border: OutlineInputBorder(),
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
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter content';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                DropdownButtonFormField<String>(
                  value: controller.statusController,
                  decoration: const InputDecoration(
                    labelText: 'Status',
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) {
                    controller.statusController = value!;
                  },
                  items: controller.statuses
                      .map(
                        (e) => DropdownMenuItem(
                          value: e,
                          child: Text(e),
                        ),
                      )
                      .toList(),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: controller.slugController,
                  decoration: const InputDecoration(
                    labelText: 'Slug',
                    border: OutlineInputBorder(),
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
