import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PaymentCardController extends GetxController {
  late TextEditingController cardNum, cardExp, birth, password;
  var amt = ''.obs;
  RxDouble boxHeight = 245.0.obs;
  RxDouble cardInfoHeight = 170.0.obs;
  RxBool isVisible = false.obs;

  @override
  void onInit() {
    super.onInit();

    cardNum = TextEditingController();
    cardExp = TextEditingController();
    birth = TextEditingController();
    password = TextEditingController();

    if (Get.arguments != null) {
      amt.value = Get.arguments['amt'];
      if (Get.arguments['type'] == 'scan') {
        cardNum.text = Get.arguments['cardNum'];
        cardExp.text = Get.arguments['cardExp'];

        boxHeight.value = 185.0;
        cardInfoHeight.value = 80.0;
        isVisible.value = false;
      } else {
        boxHeight.value = 245.0;
        cardInfoHeight.value = 170.0;
        isVisible.value = true;
      }
    }
  }
}
