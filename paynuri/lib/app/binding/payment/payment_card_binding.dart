import 'package:get/get.dart';
import 'package:paynuri/app/controller/payment/payment_card_controller.dart';

class PaymentCardBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(PaymentCardController());
  }
}
