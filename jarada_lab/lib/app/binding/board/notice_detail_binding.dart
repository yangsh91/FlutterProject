import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:jarada_lab/app/controller/board/notice_detail_controller.dart';
import 'package:jarada_lab/app/data/provider/board/notice_api.dart';
import 'package:jarada_lab/app/data/repository/board/notice_repositry.dart';

class NoticeDetailBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NoticeDetailController>(() {
      return NoticeDetailController(
          noticeRepository: NoticeRepository(
              noticeApiClient: NoticeApiClient(httpClient: http.Client())));
    });
  }
}
