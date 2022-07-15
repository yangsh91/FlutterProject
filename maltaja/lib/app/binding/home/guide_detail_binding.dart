import 'package:get/get.dart';
import 'package:maltaja/app/controller/home/guide_detail_controller.dart';
import 'package:maltaja/app/controller/home/home_controller.dart';

class GuideDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GuideDetailController>(
      () => GuideDetailController(),
    );
  }
}
