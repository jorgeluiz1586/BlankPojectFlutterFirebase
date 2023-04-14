import 'package:get/get.dart';

import '../controllers/screen4_controller.dart';

class Screen4Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<Screen4Controller>(
      () => Screen4Controller(),
    );
  }
}
