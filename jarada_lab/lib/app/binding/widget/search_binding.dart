import 'package:get/get.dart';
import 'package:jarada_lab/app/controller/widget/search_controller.dart';

class SearchBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SearchController>(() {
      return SearchController();
    });
  }
}
