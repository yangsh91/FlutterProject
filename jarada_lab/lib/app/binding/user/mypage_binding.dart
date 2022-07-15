import 'package:get/get.dart';
import 'package:jarada_lab/app/controller/user/mypage_controller.dart';

class MyPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(MyPageController());
  }
}
