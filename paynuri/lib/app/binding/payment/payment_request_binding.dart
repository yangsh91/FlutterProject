import 'package:get/get.dart';
import 'package:paynuri/app/controller/payment/payment_request_controller.dart';

class PaymentRequestBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(PaymentRequestController());
  }
}
