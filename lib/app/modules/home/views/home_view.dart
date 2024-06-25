import 'package:api_getx/app/modules/home/controllers/memo_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:getwidget/colors/gf_color.dart';
import 'package:getwidget/components/list_tile/gf_list_tile.dart';

class HomeView extends GetView<MemoController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('HomeView'),
          centerTitle: false,
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.refresh),
          onPressed: () async => await controller.getAllMemo(),
        ),
        body: Obx(() {
          if (controller.isLoading.value) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return ListView.separated(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              itemCount: controller.memo.value?.data?.length ?? 0,
              separatorBuilder: (_, __) => const SizedBox(height: 8),
              itemBuilder: (context, index) {
                final data = controller.memo.value?.data?[index];
                return GFListTile(
                  margin: EdgeInsets.zero,
                  color: GFColors.LIGHT,
                  shadow: const BoxShadow(),
                  icon: const Icon(Icons.book),
                  title: Text(data?.title ?? ''),
                  onTap: () {
                    Get.toNamed('/content/${data!.sId}');
                  },
                );
                // return Container(
                //     width: double.infinity,
                //     height: 100,
                //     child: Markdown(data: data?.content ?? ''));
              },
            );
          }
        }));
  }
}
