import 'package:api_getx/app/modules/home/memo_model.dart';
import 'package:dio/dio.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class ApiController extends GetxController {
  final dio = Dio();
  Future<Memo> getMemos() async {
    final response =
        await dio.get('https://v1.appbackend.io/v1/rows/G8cTgQQCzchQ');
    return Memo.fromJson(response.data);
  }
}
