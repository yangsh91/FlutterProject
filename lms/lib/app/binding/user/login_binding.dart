import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:lms/app/controller/user/login_controller.dart';
import 'package:lms/app/data/provider/user/login_api.dart';
import 'package:lms/app/data/repository/login_repository.dart';

class LoginBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(() {
      return LoginController(
          repository: LoginRepository(
              loginApiClient: LoginApiClient(httpClient: http.Client())));
    });
  }
}
