import 'package:get/get.dart';
import 'package:maltaja/app/controller/home/notice_detail_controller.dart';

class NoticeDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NoticeDetailController>(
      () => NoticeDetailController(),
    );
  }
}
