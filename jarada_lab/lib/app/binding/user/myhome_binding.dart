import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:jarada_lab/app/controller/user/myhome_controller.dart';
import 'package:jarada_lab/app/data/provider/user/myhome_api.dart';
import 'package:jarada_lab/app/data/repository/user/myhome_repository.dart';

class MyHomeBinding implements Bindings {
  @override
  void dependencies() {
    /*
    Get.lazyPut<MyHomeController>(() {
      return MyHomeController(
          myHomeRepository: MyHomeRepository(
              myHomeApiClient: MyHomeApiClient(httpClient: http.Client())));
    });
    */
    Get.put(MyHomeController(
        myHomeRepository: MyHomeRepository(
            myHomeApiClient: MyHomeApiClient(httpClient: http.Client()))));
  }
}
