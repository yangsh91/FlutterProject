import 'package:get/get.dart';

// 메인화면 홈
import 'package:jarada_lab/app/ui/home/home.dart';
import 'package:jarada_lab/app/binding/home/home_binding.dart';
import 'package:jarada_lab/app/binding/user/myhome_binding.dart';

// 로그인
import 'package:jarada_lab/app/ui/user/login.dart';
import 'package:jarada_lab/app/binding/user/login_binding.dart';

// 마이페이지
import 'package:jarada_lab/app/ui/user/mypage.dart';
import 'package:jarada_lab/app/binding/user/mypage_binding.dart';
import 'package:jarada_lab/app/binding/board/notice_binding.dart';

// 비밀번호 변경
import 'package:jarada_lab/app/ui/user/mypage/pass_change.dart';
import 'package:jarada_lab/app/binding/user/pass_change_binding.dart';

// 교안 업로드
import 'package:jarada_lab/app/ui/board/board_write.dart';
import 'package:jarada_lab/app/binding/board/board_write_binding.dart';

// 이달의 연구작
import 'package:jarada_lab/app/ui/board/board_monthly.dart';
import 'package:jarada_lab/app/binding/board/board_monthly_binding.dart';

// 리스트 검색
import 'package:jarada_lab/app/ui/widget/search.dart';
import 'package:jarada_lab/app/binding/widget/search_binding.dart';

// 공지사항 상세
import 'package:jarada_lab/app/binding/board/notice_detail_binding.dart';
import 'package:jarada_lab/app/ui/board/notice_detail.dart';

part './app_routes.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
      name: Routes.initial,
      page: () => Home(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.home,
      page: () => Home(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.login,
      page: () => Login(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: Routes.mypage,
      page: () => MyPage(),
      bindings: [MyPageBinding(), MyHomeBinding(), NoticeBinding()],
    ),
    GetPage(
      name: Routes.pass_chg,
      page: () => PassChange(),
      binding: PassChangeBinding(),
    ),
    GetPage(
      name: Routes.board_write,
      page: () => BoardWrite(),
      binding: BoardWriteBinding(),
    ),
    GetPage(
      name: Routes.board_monthly,
      page: () => BoardMonthly(),
      binding: BoardMonthlyBinding(),
    ),
    GetPage(
      name: Routes.notice_detail,
      page: () => NoticeDetail(),
      binding: NoticeDetailBinding(),
    ),
    GetPage(
      name: Routes.search,
      page: () => Search(),
      binding: SearchBinding(),
    ),
  ];
}
