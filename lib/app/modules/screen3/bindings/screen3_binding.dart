import 'package:get/get.dart';

import '../controllers/screen3_controller.dart';

class Screen3Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<Screen3Controller>(
      () => Screen3Controller(),
    );
  }
}
