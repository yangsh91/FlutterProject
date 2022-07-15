import 'package:get/get.dart';
import 'package:paynuri/app/data/repository/user/user_repository.dart';

class SettingsController extends GetxController {
  final UserRepository? userRepository;

  SettingsController({required this.userRepository})
      : assert(userRepository != null);

  late RxBool isSaving, isPayment, isNfc, isScan, isSms;

  @override
  void onInit() {
    super.onInit();

    isSaving = false.obs;
    isPayment = false.obs;
    isNfc = false.obs;
    isScan = false.obs;
    isSms = false.obs;

    print("????");
  }
}
