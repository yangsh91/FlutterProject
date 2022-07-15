import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:jarada_lab/app/controller/board/notice_controller.dart';
import 'package:jarada_lab/app/controller/user/login_controller.dart';
import 'package:jarada_lab/app/controller/user/myhome_controller.dart';
import 'package:jarada_lab/app/controller/user/mypage_controller.dart';
import 'package:jarada_lab/app/data/provider/user/user_api.dart';
import 'package:jarada_lab/app/data/repository/user/user_repository.dart';
import 'package:jarada_lab/app/routes/app_pages.dart';

class MyHome extends GetView<MyHomeController> {
  @override
  LoginController _controller = Get.put(LoginController(
      userRepository: UserRepository(
          userApiClient: UserApiClient(httpClient: http.Client()))));

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Obx(
        () => Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
              child: Container(
                width: double.infinity,
                height: 240.0,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        height: 20.0,
                        child: const Text(
                          '내 정보',
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10.0, 0, 5.0, 0),
                      child: Container(
                        height: 200.0,
                        color: Colors.transparent,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 60.0,
                              height: 80.0,
                              child: Image.asset(
                                '${_controller.loginData.getString('pic')}',
                                fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(
                              width: 5.0,
                            ),
                            Expanded(
                              child: Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(5.0, 0, 10.0, 0),
                                child: Container(
                                  height: 151.0,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        'JARADA JARVIS LICENSE',
                                        style: TextStyle(
                                          fontSize: 18.0,
                                          color: Colors.grey,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            0, 10.0, 0, 10.0),
                                        child: const Divider(
                                          height: 3.0,
                                          color: Colors.grey,
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            '아이디',
                                            style: TextStyle(
                                              fontSize: 13.0,
                                              color: Colors.grey,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 15.0,
                                          ),
                                          Text(
                                            '${_controller.loginData.getString('id')}',
                                            style: TextStyle(
                                              fontSize: 16.0,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 10.0,
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            '강사명',
                                            style: TextStyle(
                                              fontSize: 13.0,
                                              color: Colors.grey,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 15.0,
                                          ),
                                          Text(
                                            '${_controller.loginData.getString('user_nm')}',
                                            style: TextStyle(
                                              fontSize: 16.0,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 10.0,
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            '지역원',
                                            style: TextStyle(
                                              fontSize: 13.0,
                                              color: Colors.grey,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 15.0,
                                          ),
                                          Text(
                                            '직영',
                                            style: TextStyle(
                                              fontSize: 16.0,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 10.0,
                                      ),
                                      Row(
                                        children: [
                                          const Text(
                                            '비밀번호',
                                            style: TextStyle(
                                              fontSize: 13.0,
                                              color: Colors.grey,
                                            ),
                                          ),
                                          GestureDetector(
                                            onTap: () =>
                                                Get.toNamed(Routes.pass_chg),
                                            child: Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.4,
                                              height: 20.0,
                                              margin:
                                                  EdgeInsets.only(left: 5.0),
                                              padding:
                                                  EdgeInsets.only(left: 5.0),
                                              alignment: Alignment.centerLeft,
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                border: Border.all(
                                                  width: 1.0,
                                                  color: Colors.grey.shade400,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(5.0),
                                              ),
                                              child: const Text(
                                                '비밀번호 변경하기',
                                                style: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 12.0,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
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
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
              child: Container(
                height: 250.0,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        height: 20.0,
                        child: Row(
                          children: [
                            Container(
                              child: const Text(
                                '공지사항',
                                style: TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                child: Container(
                                  width: 70.0,
                                  alignment: Alignment.centerRight,
                                  child: ElevatedButton(
                                    onPressed: () =>
                                        Get.find<MyPageController>()
                                            .widgetChanged(1),
                                    style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                Colors.grey)),
                                    child: const Text('더보기'),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
                      child: Container(
                        height: 200.0,
                        child: ListView.separated(
                          itemCount: controller.noticeList.length,
                          itemBuilder: (BuildContext context, int index) {
                            return GestureDetector(
                              onTap: () => Get.find<NoticeController>()
                                  .getPost(controller.noticeList[index]),
                              child: Container(
                                height: 25.0,
                                alignment: Alignment.centerLeft,
                                padding:
                                    const EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
                                child: Text(
                                  '${controller.noticeList[index].subject}',
                                ),
                              ),
                            );
                          },
                          separatorBuilder: (BuildContext context, int item) =>
                              const Divider(
                            color: Colors.black45,
                          ),
                        ),
                      ),
                    ),
                    /*
                ListView.builder(
                  itemCount: controller.noticeList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      height: 30.0,
                      padding: const EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
                      color: Colors.redAccent,
                    );
                  },
                ),
                */
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
              child: Container(
                height: 150.0,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        height: 20.0,
                        child: Row(
                          children: [
                            Container(
                              child: const Text(
                                '즐겨찾기',
                                style: TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                child: Container(
                                  width: 70.0,
                                  alignment: Alignment.centerRight,
                                  child: ElevatedButton(
                                    onPressed: () {},
                                    style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                Colors.grey)),
                                    child: const Text('더보기'),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
                        child: Center(
                          child: Image.asset(
                            'assets/images/lab_jarada.png',
                            width: 150.0,
                            fit: BoxFit.cover,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
              child: Container(
                height: 150.0,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        height: 20.0,
                        child: Row(
                          children: [
                            Container(
                              child: const Text(
                                '구독하기',
                                style: TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                child: Container(
                                  width: 70.0,
                                  alignment: Alignment.centerRight,
                                  child: ElevatedButton(
                                    onPressed: () {},
                                    style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                Colors.grey)),
                                    child: const Text('더보기'),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
                        child: Center(
                          child: Image.asset(
                            'assets/images/lab_jarada.png',
                            width: 150.0,
                            fit: BoxFit.cover,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
              child: Container(
                height: 150.0,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        height: 20.0,
                        child: Row(
                          children: [
                            Container(
                              child: const Text(
                                '내 교안 관리',
                                style: TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                child: Container(
                                  width: 70.0,
                                  alignment: Alignment.centerRight,
                                  child: ElevatedButton(
                                    onPressed: () {},
                                    style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                Colors.grey)),
                                    child: const Text('더보기'),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
                        child: Center(
                          child: Image.asset(
                            'assets/images/lab_jarada.png',
                            width: 150.0,
                            fit: BoxFit.cover,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
              child: Container(
                height: 250.0,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        height: 20.0,
                        child: Row(
                          children: [
                            Container(
                              child: const Text(
                                '댓글관리',
                                style: TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                child: Container(
                                  width: 70.0,
                                  alignment: Alignment.centerRight,
                                  child: ElevatedButton(
                                    onPressed: () {},
                                    style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                Colors.grey)),
                                    child: const Text('더보기'),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
                        child: Center(
                          child: Image.asset(
                            'assets/images/lab_jarada.png',
                            width: 150.0,
                            fit: BoxFit.cover,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ),
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
