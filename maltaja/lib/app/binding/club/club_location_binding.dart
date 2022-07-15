import 'package:get/get.dart';
import 'package:maltaja/app/controller/club/club_location_controller.dart';

class ClubLocationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ClubLocationController>(
      () => ClubLocationController(),
    );
  }
}
