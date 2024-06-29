import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';

import '../controllers/create_controller.dart';

class CreateView extends GetView<CreateController> {
  const CreateView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        actions: [
          GFButton(
            onPressed: () async => controller.createMemo(),
            borderShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            color: const Color(0xff4FC586),
            child: const Text('Save'),
          ),
          const SizedBox(width: 10)
        ],
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        width: double.infinity,
        child: Column(
          children: [
            GFTextField(
              controller: controller.title,
              style: const TextStyle(
                fontSize: 26,
              ),
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: 'Title',
              ),
            ),
            GFTextField(
              controller: controller.content,
              style: const TextStyle(
                fontSize: 16,
              ),
              textInputAction: TextInputAction.newline,
              maxLines: null,
              keyboardType: TextInputType.multiline,
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: 'Type something...',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
