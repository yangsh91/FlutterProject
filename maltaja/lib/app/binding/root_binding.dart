import 'package:get/get.dart';
import 'package:maltaja/app/controller/root_controller.dart';

class RootBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<RootController>(RootController(), permanent: true);
  }
}
