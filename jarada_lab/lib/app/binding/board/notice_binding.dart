import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:jarada_lab/app/controller/board/notice_controller.dart';
import 'package:jarada_lab/app/data/repository/board/notice_repositry.dart';
import 'package:jarada_lab/app/data/provider/board/notice_api.dart';

class NoticeBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(NoticeController(
        noticeRepository: NoticeRepository(
            noticeApiClient: NoticeApiClient(httpClient: http.Client()))));
    /*
    Get.lazyPut<NoticeController>(() {
      return NoticeController(
          noticeRepository: NoticeRepository(
              noticeApiClient: NoticeApiClient(httpClient: http.Client())));
    });
    */
  }
}
