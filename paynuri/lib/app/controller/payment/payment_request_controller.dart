import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PaymentRequestController extends GetxController {
  late TextEditingController amt;
  //var tot_amt = Get.arguments['amt']!;
  String store_nm = '페이리누';
  var tot_amt = '';

  @override
  void onInit() {
    super.onInit();
    amt = TextEditingController();
    if (Get.arguments != null) {
      tot_amt = Get.arguments['amt'];
    }
    _amtSerialize();
  }

  void _amtSerialize() {
    //amt = TextEditingController();
    tot_amt != '' ? amt.text = tot_amt : amt.text = '';
  }
}
