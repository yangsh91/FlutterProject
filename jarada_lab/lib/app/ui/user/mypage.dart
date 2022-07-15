import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jarada_lab/app/binding/home/home_binding.dart';
import 'package:jarada_lab/app/controller/user/mypage_controller.dart';
import 'package:jarada_lab/app/ui/user/mypage/bookmark.dart';
import 'package:jarada_lab/app/ui/board/notice.dart';
import 'package:jarada_lab/app/ui/home/home.dart';
import 'package:jarada_lab/app/ui/user/mypage/class_mng.dart';
import 'package:jarada_lab/app/ui/user/mypage/lesson_book.dart';
import 'package:jarada_lab/app/ui/user/mypage/observe.dart';
import 'package:jarada_lab/app/ui/user/mypage/reply_mng.dart';
import 'package:jarada_lab/app/ui/user/mypage/student_mng.dart';
import 'package:jarada_lab/app/ui/user/mypage/subscribe.dart';
import 'package:jarada_lab/app/ui/widget/side_menu.dart';
import 'package:jarada_lab/app/ui/user/mypage/myhome.dart';

class MyPage extends GetView<MyPageController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(26, 28, 28, 1),
        iconTheme: IconThemeData(
          color: Colors.yellow,
        ),
        toolbarHeight: 50.0,
        leading: GestureDetector(
          onTap: () => Get.back(),
          child: const Icon(
            Icons.arrow_back_ios_new_outlined,
            color: Colors.yellow,
          ),
        ),
        centerTitle: false,
        title: GestureDetector(
          onTap: () => Get.offAll(
            () => Home(),
            binding: HomeBinding(),
          ),
          child: Container(
            alignment: Alignment.center,
            width: 100.0,
            child: Image.asset(
              'assets/images/logo.png',
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
      endDrawer: SideMenu(),
      body: Obx(
        () => Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                width: double.infinity,
                height: 50.0,
                alignment: Alignment.centerLeft,
                child: const Text(
                  '마이 페이지',
                  style: TextStyle(
                    fontSize: 28.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10.0, 0, 10.0, 10.0),
              child: Container(
                height: 140.0,
                child: Column(
                  children: [
                    Expanded(
                      child: Container(
                        child: Row(
                          children: [
                            Expanded(
                              child: GestureDetector(
                                onTap: () => controller.widgetChanged(0),
                                child: Container(
                                  color: Colors.transparent,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        'assets/images/home.png',
                                        width: 30.0,
                                        height: 30.0,
                                        fit: BoxFit.cover,
                                        color:
                                            (controller.widgetIndex.value == 0
                                                ? Colors.black
                                                : Colors.grey),
                                      ),
                                      const SizedBox(height: 5.0),
                                      const Text(
                                        '마이홈',
                                        style: TextStyle(
                                          fontSize: 12.0,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: GestureDetector(
                                onTap: () => controller.widgetChanged(1),
                                child: Container(
                                  color: Colors.transparent,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        'assets/images/clipboard.png',
                                        width: 30.0,
                                        height: 30.0,
                                        fit: BoxFit.cover,
                                        color:
                                            (controller.widgetIndex.value == 1
                                                ? Colors.black
                                                : Colors.grey),
                                      ),
                                      const SizedBox(height: 5.0),
                                      Text(
                                        '공지사항',
                                        style: TextStyle(
                                          fontSize: 12.0,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: GestureDetector(
                                onTap: () => controller.widgetChanged(2),
                                child: Container(
                                  color: Colors.transparent,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        'assets/images/star.png',
                                        width: 30.0,
                                        height: 30.0,
                                        fit: BoxFit.cover,
                                        color:
                                            (controller.widgetIndex.value == 2
                                                ? Colors.black
                                                : Colors.grey),
                                      ),
                                      const SizedBox(height: 5.0),
                                      Text(
                                        '즐겨찾기',
                                        style: TextStyle(
                                          fontSize: 12.0,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: GestureDetector(
                                onTap: () => controller.widgetChanged(3),
                                child: Container(
                                  color: Colors.transparent,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        'assets/images/love.png',
                                        width: 30.0,
                                        height: 30.0,
                                        fit: BoxFit.cover,
                                        color:
                                            (controller.widgetIndex.value == 3
                                                ? Colors.black
                                                : Colors.grey),
                                      ),
                                      const SizedBox(height: 5.0),
                                      Text(
                                        '구독하기',
                                        style: TextStyle(
                                          fontSize: 12.0,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: GestureDetector(
                                onTap: () => controller.widgetChanged(4),
                                child: Container(
                                  color: Colors.transparent,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        'assets/images/picture.png',
                                        width: 30.0,
                                        height: 30.0,
                                        fit: BoxFit.cover,
                                        color:
                                            (controller.widgetIndex.value == 4
                                                ? Colors.black
                                                : Colors.grey),
                                      ),
                                      const SizedBox(height: 5.0),
                                      Text(
                                        '내 교안 관리',
                                        style: TextStyle(
                                          fontSize: 12.0,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () => controller.widgetChanged(5),
                        child: Container(
                          child: Row(
                            children: [
                              Expanded(
                                child: Container(
                                  color: Colors.transparent,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        'assets/images/chat.png',
                                        width: 30.0,
                                        height: 30.0,
                                        fit: BoxFit.cover,
                                        color:
                                            (controller.widgetIndex.value == 5
                                                ? Colors.black
                                                : Colors.grey),
                                      ),
                                      const SizedBox(height: 5.0),
                                      Text(
                                        '댓글관리',
                                        style: TextStyle(
                                          fontSize: 12.0,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                child: GestureDetector(
                                  onTap: () => controller.widgetChanged(6),
                                  child: Container(
                                    color: Colors.transparent,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Image.asset(
                                          'assets/images/group.png',
                                          width: 30.0,
                                          height: 30.0,
                                          fit: BoxFit.cover,
                                          color:
                                              (controller.widgetIndex.value == 6
                                                  ? Colors.black
                                                  : Colors.grey),
                                        ),
                                        const SizedBox(height: 5.0),
                                        Text(
                                          '원생관리',
                                          style: TextStyle(
                                            fontSize: 12.0,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: GestureDetector(
                                  onTap: () => controller.widgetChanged(7),
                                  child: Container(
                                    color: Colors.transparent,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Image.asset(
                                          'assets/images/chat.png',
                                          width: 30.0,
                                          height: 30.0,
                                          fit: BoxFit.cover,
                                          color:
                                              (controller.widgetIndex.value == 7
                                                  ? Colors.black
                                                  : Colors.grey),
                                        ),
                                        const SizedBox(height: 5.0),
                                        Text(
                                          '반관리',
                                          style: TextStyle(
                                            fontSize: 12.0,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: GestureDetector(
                                  onTap: () => controller.widgetChanged(8),
                                  child: Container(
                                    color: Colors.transparent,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Image.asset(
                                          'assets/images/phonebook.png',
                                          width: 30.0,
                                          height: 30.0,
                                          fit: BoxFit.cover,
                                          color:
                                              (controller.widgetIndex.value == 8
                                                  ? Colors.black
                                                  : Colors.grey),
                                        ),
                                        const SizedBox(height: 5.0),
                                        Text(
                                          '관찰일지',
                                          style: TextStyle(
                                            fontSize: 12.0,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SingleChildScrollView(
              child: SizedBox(
                height: 490.0,
                child: PageView(
                  controller: controller.pageController,
                  scrollDirection: Axis.horizontal,
                  children: [
                    MyHome(),
                    Notice(),
                    BookMark(),
                    Subscribe(),
                    LessonBook(),
                    ReplyMng(),
                    StudentMng(),
                    ClassMng(),
                    Observe(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
