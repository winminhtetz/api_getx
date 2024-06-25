import 'package:api_getx/app/modules/home/controllers/memo_controller.dart';
import 'package:api_getx/app/modules/home/memo_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

import 'package:get/get.dart';

import '../controllers/content_controller.dart';

class ContentView extends GetView<ContentController> {
  ContentView({super.key});

  final memoController = Get.put(MemoController());

  @override
  Widget build(BuildContext context) {
    final id = Get.parameters['id']!;
    final memo = memoController.memo.value ?? Memo();
    final memoContent = memo.data?.where((e) => e.sId == id).first;

    return Scaffold(
      appBar: AppBar(
        title:  Text(memoContent?.title ?? ''),
        centerTitle: false,
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Markdown(data: memoContent?.content ?? ''),
      ),
    );
  }
}
