import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:lms/app/controller/notice/notice_controller.dart';
import 'package:lms/app/data/provider/notice/notice_api.dart';
import 'package:lms/app/data/repository/notice_repository.dart';

class ListBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NoticeController>(() {
      return NoticeController(
          repository: NoticeRepository(
              noticeApiClient: NoticeApiClient(httpClient: http.Client())));
    });
  }
}
