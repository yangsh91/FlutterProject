import 'package:get/get.dart';
import 'package:jarada_lab/app/data/model/board/notice_model.dart';
import 'package:jarada_lab/app/data/repository/board/notice_repositry.dart';

class NoticeDetailController extends GetxController {
  final NoticeRepository? noticeRepository;

  NoticeDetailController({this.noticeRepository})
      : assert(noticeRepository != null);

  @override
  void onInit() {
    super.onInit();
  }

  final _post = NoticeModel().obs;
  get post => this._post.value;
  set post(value) => this._post.value = value;
}
