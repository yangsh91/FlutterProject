import 'package:get/get.dart';
import 'package:maltaja/app/controller/club/reserve_controller.dart';

class ReserveBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ReserveController>(
      () => ReserveController(),
    );
  }
}
