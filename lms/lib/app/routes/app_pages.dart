import 'package:get/get.dart';

import 'package:lms/app/ui/screens/user/user_info.dart';
import 'package:lms/app/ui/screens/user/user_pass_chg.dart';
import 'package:lms/app/binding/user/user_binding.dart';

import 'package:lms/app/ui/screens/notice/notice_list.dart';
import 'package:lms/app/binding/notice/list_binding.dart';

import 'package:lms/app/ui/screens/attendance/atd_list.dart';
import 'package:lms/app/ui/screens/attendance/atd_detail.dart';
import 'package:lms/app/binding/attendance/attendance_binding.dart';

import 'package:lms/app/ui/screens/study/study_view.dart';

import 'package:lms/app/ui/screens/user/user_login.dart';
import 'package:lms/app/binding/user/login_binding.dart';

part './app_routes.dart';

abstract class AppPages {
  static final pages = [
    //GetPage(name: Routes.INITIAL, page: page)
    // 로그인
    GetPage(
        name: Routes.LOGIN, page: () => UserLogin(), binding: LoginBinding()),

    // 회원정보
    GetPage(name: Routes.INFO, page: () => UserInfo(), binding: UserBinding()),

    // 비밀번호 수정
    GetPage(
        name: Routes.PASS_CHG,
        page: () => UserPassChg(),
        binding: UserBinding()),

    // 공지사항
    GetPage(
        name: Routes.NOTICE_LIST,
        page: () => NoticeList(),
        binding: ListBinding()),

    // 출석현황 : 월별 리스트
    GetPage(
        name: Routes.ATD_LIST,
        page: () => AtdList(),
        binding: AttendanceBinding()),
    GetPage(
        name: Routes.ATD_DETAIL,
        page: () => AtdDetail(),
        binding: AttendanceBinding()),

    // 학습관리
    GetPage(
      name: Routes.STUDY,
      page: () => StudyView(),
    ),
  ];
}
