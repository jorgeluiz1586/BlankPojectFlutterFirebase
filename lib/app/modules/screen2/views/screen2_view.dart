import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/screen2_controller.dart';
import '../../../global/layouts/default_layout.dart';

class Screen2View extends GetView<Screen2Controller> {
  const Screen2View({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 1,
        height: MediaQuery.of(context).size.height * 0.95,
        child: const Center(
          child: Text('Secound Screen'),
        ),
      ),
    );
  }
}
