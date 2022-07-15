import 'package:lms/app/data/provider/notice/notice_api.dart';
import 'package:meta/meta.dart';

class NoticeRepository {
  final NoticeApiClient? noticeApiClient;

  NoticeRepository({@required this.noticeApiClient})
      : assert(noticeApiClient != null);

  getList({int? num}) {
    return noticeApiClient?.getList(num: num);
  }
}
