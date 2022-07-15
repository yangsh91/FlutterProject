import 'package:get/get.dart';
import 'package:maltaja/app/controller/club/club_detail_controller.dart';

class ClubDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ClubDetailController>(
      () => ClubDetailController(),
    );
  }
}
