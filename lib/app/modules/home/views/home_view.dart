import 'package:api_getx/app/modules/home/controllers/memo_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:getwidget/colors/gf_color.dart';
import 'package:getwidget/components/avatar/gf_avatar.dart';
import 'package:getwidget/components/button/gf_button.dart';
import 'package:getwidget/components/button/gf_button_bar.dart';
import 'package:getwidget/components/card/gf_card.dart';
import 'package:getwidget/components/list_tile/gf_list_tile.dart';
import 'package:getwidget/shape/gf_avatar_shape.dart';
import 'package:intl/intl.dart';

class HomeView extends GetView<MemoController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: GFColors.LIGHT,
        appBar: AppBar(
          title: const Text('HomeView'),
          centerTitle: false,
        ),
        floatingActionButton: FloatingActionButton(
          elevation: 1,
          backgroundColor: const Color(0xff4FC586),
          shape: const OvalBorder(),
          onPressed: () async {
            // await controller.getAllMemo();
            Get.toNamed('/create');
          },
          child: const Icon(
            Icons.add_rounded,
            color: GFColors.WHITE,
          ),
        ),
        body: Obx(() {
          if (controller.isLoading.value) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              itemCount: controller.memo.value?.data?.length ?? 0,
              separatorBuilder: (_, __) => const SizedBox(height: 8),
              itemBuilder: (context, index) {
                final data = controller.memo.value?.data?[index];
                final date =
                    DateTime.fromMillisecondsSinceEpoch(data?.createdAt ?? 0);
                String dayOfWeek = DateFormat.E().format(date);

                return GestureDetector(
                  onTap: () => Get.toNamed('/content/${data!.sId}'),
                  child: GFCard(
                    boxFit: BoxFit.cover,
                    margin: EdgeInsets.zero,
                    padding: const EdgeInsets.all(1),
                    title: GFListTile(
                      padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
                      margin: EdgeInsets.zero,
                      avatar: GFAvatar(
                        size: 28,
                        shape: GFAvatarShape.standard,
                        borderRadius: BorderRadius.circular(4),
                        backgroundColor: GFColors.LIGHT,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              dayOfWeek,
                              style: const TextStyle(
                                fontSize: 10,
                                color: GFColors.DARK,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                            Text(
                              '${date.day}',
                              style: const TextStyle(
                                fontSize: 12,
                                color: GFColors.DARK,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ),
                      title: Text(
                        data?.title ?? '',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      subTitle: Text(
                        '${date.hour}:${date.minute}',
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w300,
                          color: GFColors.DARK,
                        ),
                      ),
                    ),
                    content: Container(
                      margin: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                      width: double.infinity,
                      child: Text(
                        data?.content ?? '-',
                        maxLines: 4,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 14,
                          color: GFColors.DARK.withOpacity(.8),
                        ),
                      ),
                    ),
                  ),
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
