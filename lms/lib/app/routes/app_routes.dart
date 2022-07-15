part of './app_pages.dart';

abstract class Routes {
  static const INITIAL = '/';

  static const LOGIN = '/login';
  static const MAIN = '/main';

  // 유저
  static const INFO = '/info';
  static const PASS_CHG = '/pass_chg';

  // 알림 : 알림장&공지사항
  static const NOTIFY = '/notify';
  static const NOTICE_LIST = '/notice_list';
  static const NOTICE_DETAIL = '/notice_detail';

  // 출석현황
  static const ATD_LIST = '/atd_list';
  static const ATD_DETAIL = '/atd_detail';

  // 학습관리
  static const STUDY = '/study';
  static const STD_SCHEDULE = '/std_schedule';

  // 성적조회
  static const TEST_RSLT_LIST = '/test_rslt_list';
  static const TEST_RSLT_DETAIL = '/test_rslt_detail';

  // 청구서관리
  static const INVOICE_LIST = '/invoice_list';
  static const PAYMENT = '/payment';
}
