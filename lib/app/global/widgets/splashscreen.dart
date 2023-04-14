import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:async';

class SplashScreen extends GetView {
  SplashScreen({super.key}) {
    toHome();
  }

  void toHome() {
    Timer(Duration(seconds: 2), () => Get.toNamed("/login"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width * 1,
        height: MediaQuery.of(context).size.height * 1,
        color: Colors.white,
        child: const Center(
          child: Text('Splashing...'),
        ),
      ),
    );
  }
}
