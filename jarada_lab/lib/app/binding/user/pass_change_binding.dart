import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:jarada_lab/app/controller/user/pass_change_controller.dart';
import 'package:jarada_lab/app/data/provider/user/user_api.dart';
import 'package:jarada_lab/app/data/repository/user/user_repository.dart';

class PassChangeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PassChangeController>(() {
      return PassChangeController(
          userRepository: UserRepository(
              userApiClient: UserApiClient(httpClient: http.Client())));
    });
  }
}
