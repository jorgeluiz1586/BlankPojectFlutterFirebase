import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/screen3_controller.dart';
import '../../../global/layouts/default_layout.dart';

class Screen3View extends GetView<Screen3Controller> {
  const Screen3View({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 1,
        height: MediaQuery.of(context).size.height * 0.95,
        child: const Center(
          child: Text('Thrird Screen'),
        ),
      ),
    );
  }
}
