import 'package:get/get.dart';
import 'package:jarada_lab/app/controller/home/home_controller.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(HomeController());
  }
}
