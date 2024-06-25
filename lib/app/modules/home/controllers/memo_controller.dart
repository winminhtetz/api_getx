import 'package:api_getx/app/modules/home/controllers/api_controller.dart';
import 'package:api_getx/app/modules/home/memo_model.dart';
import 'package:get/get.dart';

class MemoController extends GetxController {
  final memo = Rxn<Memo>();
  final isLoading = false.obs;

  ApiController apiController = Get.put(ApiController());

  @override
  void onInit() {
    super.onInit();
    getAllMemo();
  }

  Future<void> getAllMemo() async {
    isLoading.value = true;
    try {
      final data = await apiController.getMemos();
      memo.value = data;
    } catch (e) {
      print(e);
    } finally {
      isLoading.value = false;
    }
  }
}
