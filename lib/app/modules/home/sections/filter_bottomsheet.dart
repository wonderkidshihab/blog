import 'package:blog/app/modules/home/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FilterBottomsheet extends GetView<HomeController> {
  const FilterBottomsheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        children: [
          const SizedBox(height: 20),
          const Text('Filter',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              )),
          const SizedBox(height: 20),
          TextField(
            controller: controller.searchController,
            decoration: InputDecoration(
              hintText: 'Search',
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              suffixIcon: IconButton(
                onPressed: () {
                  controller.searchController.clear();
                  controller.queryParams['search'] = '';
                },
                icon: const Icon(
                  Icons.clear,
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: 50,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: controller.listOfOrder.length,
              itemBuilder: (context, index) {
                return Obx(
                  () => ChoiceChip(
                    label: Text(controller.listOfOrder[index].capitalizeFirst!),
                    selected: controller.queryParams['ordering'] ==
                        controller.listOfOrder[index],
                    onSelected: (value) {
                      controller.selectOrder(controller.listOfOrder[index]);
                    },
                  ),
                );
              },
              separatorBuilder: (context, index) => const SizedBox(width: 10),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  controller.searchController.clear();
                  controller.queryParams['search'] = '';
                  controller.getBlogs();
                  Get.back();
                },
                child: const Text('Clear'),
              ),
              ElevatedButton(
                onPressed: () {
                  controller.queryParams['search'] =
                      controller.searchController.text;
                  controller.getBlogs();
                  Get.back();
                },
                child: const Text('Apply'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
