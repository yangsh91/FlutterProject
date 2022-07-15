import 'package:jarada_lab/app/data/provider/board/notice_api.dart';
import 'package:meta/meta.dart';

class NoticeRepository {
  final NoticeApiClient? noticeApiClient;

  NoticeRepository({@required this.noticeApiClient});

  getNoticeList({int? num, String? searchKey}) {
    return noticeApiClient?.getNoticeList(num: num, searchKey: searchKey);
  }
}
