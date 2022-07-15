import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:lms/app/controller/user/user_controller.dart';
import 'package:lms/app/data/provider/user/login_api.dart';
import 'package:lms/app/data/provider/user/user_api.dart';
import 'package:lms/app/data/repository/user_repository.dart';

class UserBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => UserController(
        repository: UserRepository(
            userApiClient: UserApiClient(httpClient: http.Client()))));
  }
}
