part of './app_pages.dart';

abstract class Routes {
  static const INITIAL = '/';

  static const HOME = '/home';

  // 유저
  static const LOGIN = '/login';
  static const TERMS = '/terms';
  static const JOIN = '/join';

  // 루트 (bottomnavigation)
  static const ROOT = '/root';

  // FCM 알림 (목록)
  static const NOTI_LIST = '/noti_list';

  // 공지사항 (상세)
  static const NOTICE_DETAIL = '/notice_detail';

  // 가이드 (목록 / 상세)
  static const GUIDE_LIST = '/guide_list';
  static const GUIDE_DETAIL = '/guide_detail';

  // 클럽 (목록 / 상세 / 지도)
  static const CLUB_DETAIL = '/club_detail';
  static const CLUB_LOCATION = '/club_location';

  // 강사진
  static const TEACHER_LIST = '/teacher_list';

  // 보유 마필 (목록 / 상세)
  static const HORSE_LIST = '/horse_list';
  static const HORSE_DETAIL = '/horse_detail';

  // 예약 (기본정보 / 예약하기)
  static const RESERVE = '/reserve';
  static const RESERVE_INFO = '/reserve_info';
  static const RESERVE_SCHEDULE = '/reserve_schedule';

  // 소식 (목록 / 상세)
  static const NEWS_LIST = '/news_list';
  static const NEWS_DETAIL = '/news_detail';
}
