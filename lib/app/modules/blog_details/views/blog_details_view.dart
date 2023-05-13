import 'package:blog/app/modules/blog_details/controllers/blog_details_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BlogDetailsView extends GetView<BlogDetailsController> {
  const BlogDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BlogDetailsView'),
        centerTitle: true,
      ),
      body: controller.obx(
        (state) {
          return ListView(
            children: [
              Text(
                state!.title!,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              Text(
                state.content!.replaceAll(RegExp(r'<[^>]*>|&[^;]+;'), ''),
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          );
        },
        onError: (error) => Text(error.toString()),
        onEmpty: const Center(child: Text('No Blog found')),
        onLoading: const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
