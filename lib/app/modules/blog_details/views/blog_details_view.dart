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
            padding: const EdgeInsets.all(10),
            children: [
              Image.network(
                state!.thumbnail ??
                    'https://via.placeholder.com/150x150.png?text=No+Image',
                fit: BoxFit.cover,
                height: 300,
                width: double.infinity,
              ),
              const SizedBox(height: 10),
              Text(
                state.title!,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 10),
              Text(
                'By ${state.author!.username} on ${state.published!.toString().substring(0, 10)} at ${'${state.published!.toString().substring(11, 16)} UTC'}',
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      color: Theme.of(context)
                          .colorScheme
                          .primary
                          .withOpacity(0.5),
                    ),
              ),
              const SizedBox(height: 10),
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
