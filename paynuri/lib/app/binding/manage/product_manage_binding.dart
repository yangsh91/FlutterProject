import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:paynuri/app/controller/manage/product_manage_controller.dart';
import 'package:paynuri/app/data/provider/manage/manage_api.dart';
import 'package:paynuri/app/data/repository/manage/manage_repository.dart';

class ProductManageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProductManageController>(() {
      return ProductManageController(
          manageRepository: ManageRepository(
              manageApiClient: ManageApiClient(httpClient: http.Client())));
    });
  }
}
