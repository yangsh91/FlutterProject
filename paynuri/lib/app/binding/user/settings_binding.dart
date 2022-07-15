import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:paynuri/app/controller/user/settings_controller.dart';
import 'package:paynuri/app/data/provider/user/user_api.dart';
import 'package:paynuri/app/data/repository/user/user_repository.dart';

class SettingsBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(SettingsController(
        userRepository: UserRepository(
            userApiClient: UserApiClient(httpClient: http.Client()))));

    /*
    Get.lazyPut<SettingsController>(() {
      return SettingsController(
          userRepository: UserRepository(
              userApiClient: UserApiClient(httpClient: http.Client())));
    });
    */
  }
}
