import 'package:get/get.dart';

class ReserveController extends GetxController {
  static ReserveController get to => Get.find();
  RxInt reservePageIndex = 0.obs;

  @override
  void onInit() {
    super.onInit();
  }

  void changeReservePageIndex(int index) {
    reservePageIndex(index);
  }
}
