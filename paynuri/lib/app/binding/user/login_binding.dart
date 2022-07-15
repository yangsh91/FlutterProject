import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:paynuri/app/controller/user/login_controller.dart';
import 'package:paynuri/app/data/provider/user/user_api.dart';
import 'package:paynuri/app/data/repository/user/user_repository.dart';

class LoginBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(() {
      return LoginController(
          userRepository: UserRepository(
              userApiClient: UserApiClient(httpClient: http.Client())));
    });
  }
}
