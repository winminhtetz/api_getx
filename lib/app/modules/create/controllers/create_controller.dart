import 'package:api_getx/app/modules/home/controllers/api_controller.dart';
import 'package:api_getx/app/modules/home/controllers/memo_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateController extends GetxController {
  final TextEditingController title = TextEditingController();
  final TextEditingController content = TextEditingController();
  final MemoController memoController = Get.put(MemoController());
  final ApiController apiController = Get.put(ApiController());

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  void createMemo() async {
    final title = this.title.text.trim();
    final content = this.content.text.trim();
    final date = DateTime.now().toString();
    // if (title.isEmpty || content.isEmpty) {
    //   return;
    // }
    print('create memo');
    await apiController.createMemo(title: title, content: content, date: date);
    await memoController.getAllMemo();
    Get.back();
  }

  @override
  void onClose() {
    title.dispose();
    content.dispose();
    super.onClose();
  }
}
