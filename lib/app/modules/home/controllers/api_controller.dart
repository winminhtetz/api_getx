import 'dart:convert';

import 'package:api_getx/app/modules/home/memo_model.dart';
import 'package:dio/dio.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class ApiController extends GetxController {
  final dio = Dio();
  Future<Memo> getMemos() async {
    final response =
        await dio.get('https://v1.appbackend.io/v1/rows/G8cTgQQCzchQ');
    return Memo.fromJson(response.data);
  }

  Future<void> createMemo({
    required String title,
    required String content,
    required String date,
  }) async {
    final response = await dio.post(
      'https://v1.appbackend.io/v1/rows/G8cTgQQCzchQ',
      options: Options(
        headers: {'Content-Type': 'application/json'},
      ),
      data: [
        {
          "title": title,
          "date": date,
          "content": content,
        }
      ],
    );
    // final data = response.data;
    // return Memo.fromJson(data[0]);
  }
}
