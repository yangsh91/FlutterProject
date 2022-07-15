import 'package:get/get.dart';
import 'package:maltaja/app/controller/news/news_detail_controller.dart';

class NewsDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NewsDetailController>(
      () => NewsDetailController(),
    );
  }
}
