import 'package:blog/app/modules/home/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PostsSection extends GetView<HomeController> {
  const PostsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: controller.obx(
        (state) => RefreshIndicator(
          onRefresh: () {
            return controller.getBlogs();
          },
          child: ListView.separated(
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(state[index].title ?? 'No title found'),
                subtitle: Text(state[index].excerpt ?? 'No excerpt found'),
                trailing: Text(state[index].published.toString()),
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(
                    state[index].thumbnail ??
                        'https://via.placeholder.com/150x150.png?text=No+Image',
                  ),
                ),
                onTap: () {
                  Get.toNamed(
                    '/blog-details',
                    parameters: {
                      'id': state[index].id.toString(),
                    },
                  );
                },
              );
            },
            itemCount: state!.length,
            separatorBuilder: (context, index) => const Divider(),
          ),
        ),
        onError: (error) => Text(error.toString()),
        onEmpty: const Center(child: Text('No Posts found')),
        onLoading: const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
