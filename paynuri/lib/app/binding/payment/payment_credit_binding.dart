import 'package:get/get.dart';
import 'package:paynuri/app/controller/payment/payment_credit_controller.dart';

class PaymentCreditBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(PaymentCreditController());
    /*
    Get.lazyPut<PaymentCreditController>(() {
      return PaymentCreditController();
    });
    */
  }
}
