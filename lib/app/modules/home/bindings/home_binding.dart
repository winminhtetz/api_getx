import 'package:api_getx/app/modules/home/controllers/memo_controller.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
    Get.lazyPut<MemoController>(
      () => MemoController(),
    );
  }
}
