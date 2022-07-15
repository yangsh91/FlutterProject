import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:jarada_lab/app/controller/user/login_controller.dart';
import 'package:jarada_lab/app/data/provider/user/user_api.dart';
import 'package:jarada_lab/app/data/repository/user/user_repository.dart';

class LoginBinding implements Bindings {
  @override
  void dependencies() {
    // Get.put(LoginController(
    //     repository: LoginRepository(
    //         loginApiClient: LoginApiClient(httpClient: http.Client()))));
    Get.lazyPut<LoginController>(() {
      return LoginController(
          userRepository: UserRepository(
              userApiClient: UserApiClient(httpClient: http.Client())));
    });
  }
}
