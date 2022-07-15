import 'package:get/get.dart';
import 'package:maltaja/app/ui/screens/club/club.dart';
import 'package:maltaja/app/ui/screens/home/guide_detail.dart';

//import 'package:maltaja/app.dart.txt';

// 유저화면 (로그인 / 회원가입 / 정보찾기)
import 'package:maltaja/app/ui/screens/user/login.dart';
import 'package:maltaja/app/ui/screens/user/join_terms.dart';
import 'package:maltaja/app/ui/screens/user/join.dart';

import 'package:maltaja/app/binding/root_binding.dart';
import 'package:maltaja/app/ui/root.dart';

// 홈
import 'package:maltaja/app/ui/screens/home/home.dart';
import 'package:maltaja/app/binding/home/home_binding.dart';

// FCM 알림 (목록)
import 'package:maltaja/app/ui/screens/home/notification.dart';

// 공지사항 (상세)
import 'package:maltaja/app/ui/screens/home/notice_detail.dart';
import 'package:maltaja/app/binding/home/notice_detail_binding.dart';

// 가이드 (리스트 / 상세)
import 'package:maltaja/app/ui/screens/home/guide_list.dart';
import 'package:maltaja/app/binding/home/guide_list_binding.dart';
import 'package:maltaja/app/ui/screens/home/guide_detail.dart';
import 'package:maltaja/app/binding/home/guide_detail_binding.dart';

// 클럽 (목록 / 상세 / 지도)
import 'package:maltaja/app/ui/screens/club/club_detail.dart';
import 'package:maltaja/app/binding/club/club_detail_binding.dart';

import 'package:maltaja/app/ui/screens/club/club_location.dart';
import 'package:maltaja/app/binding/club/club_location_binding.dart';

// 강사진 (목록)
import 'package:maltaja/app/ui/screens/club/teacher_list.dart';

// 보유 마필 (목록 / 상세)
import 'package:maltaja/app/ui/screens/club/horse_list.dart';
import 'package:maltaja/app/ui/screens/club/horse_detail.dart';

// 예약 (기본정보 / 예약하기)
import 'package:maltaja/app/ui/screens/club/reserve.dart';
import 'package:maltaja/app/binding/club/reserve_binding.dart';

// 소식 (목록 / 상세)
import 'package:maltaja/app/ui/screens/news/news_detail.dart';
import 'package:maltaja/app/binding/news/news_detail_binding.dart';

part './app_routes.dart';

abstract class AppPages {
  static final pages = [
    GetPage(name: Routes.INITIAL, page: () => Login()),
    GetPage(name: Routes.TERMS, page: () => JoinTerms()),
    GetPage(name: Routes.JOIN, page: () => Join()),
    GetPage(name: Routes.LOGIN, page: () => Login()),
    GetPage(name: Routes.HOME, page: () => Home(), binding: HomeBinding()),
    GetPage(name: Routes.NOTI_LIST, page: () => Notification()),
    GetPage(
        name: Routes.NOTICE_DETAIL,
        page: () => NoticeDetail(),
        binding: NoticeDetailBinding()),
    GetPage(
        name: Routes.ROOT, page: () => const Root(), binding: RootBinding()),
    GetPage(
        name: Routes.GUIDE_LIST,
        page: () => GuideList(),
        binding: GuideListBinding()),
    GetPage(
        name: Routes.GUIDE_DETAIL,
        page: () => GuideDetail(),
        binding: GuideDetailBinding()),
    GetPage(
        name: Routes.CLUB_DETAIL,
        page: () => ClubDetail(),
        binding: ClubDetailBinding()),
    GetPage(
        name: Routes.CLUB_LOCATION,
        page: () => ClubLocation(),
        binding: ClubLocationBinding()),
    GetPage(name: Routes.TEACHER_LIST, page: () => TeacherList()),
    GetPage(name: Routes.HORSE_LIST, page: () => HorseList()),
    GetPage(name: Routes.HORSE_DETAIL, page: () => HorseDetail()),
    GetPage(
        name: Routes.RESERVE, page: () => Reserve(), binding: ReserveBinding()),
    GetPage(
        name: Routes.NEWS_DETAIL,
        page: () => NewsDetail(),
        binding: NewsDetailBinding()),
  ];
}
