import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';

class MyPageController extends GetxController {
  RxInt widgetIndex = 0.obs;
  int widgetNum = Get.arguments;
  late PageController pageController;

  @override
  void onInit() {
    super.onInit();

    if (widgetNum != null) {
      widgetIndex.value = widgetNum;
    }

    pageController = PageController(initialPage: widgetIndex.value);
  }

  @override
  void onClose() {
    super.onClose();
  }

  void onReady() {
    super.onReady();
  }

  void widgetChanged(int? num) {
    widgetIndex.value = num!;
    pageController.jumpToPage(widgetIndex.value);
  }
}
