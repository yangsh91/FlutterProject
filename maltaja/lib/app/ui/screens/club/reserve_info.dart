import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maltaja/app/controller/club/reserve_info_controller.dart';

class ReserveInfo extends GetView<ReserveInfoController> {
  @override
  ReserveInfoController controller = Get.put(ReserveInfoController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('기본정보'),
      ),
    );
  }
}
