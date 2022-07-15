import 'package:get/get.dart';
import 'package:maltaja/app/controller/home/guide_list_controller.dart';
import 'package:maltaja/app/controller/home/home_controller.dart';

class GuideListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GuideListController>(
      () => GuideListController(),
    );
  }
}
