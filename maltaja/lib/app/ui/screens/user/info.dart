import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maltaja/app/controller/user/auth_controller.dart';

class Info extends GetView<AuthController> {
  @override
  final AuthController controller = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        title: Text(
          '내 정보',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        toolbarHeight: 40.0,
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15.0),
            ),
            height: 160.0,
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  height: 80.0,
                  child: Row(
                    children: [
                      Container(
                        width: 60.0,
                        height: 60.0,
                        margin: EdgeInsets.only(left: 20.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                            image: const DecorationImage(
                              image:
                                  AssetImage('assets/images/specialweek.png'),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Container(
                          padding: EdgeInsets.only(left: 8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                child: Text(
                                  controller.email,
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Container(
                                child: Text('[이메일 로그인]'),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          padding: EdgeInsets.only(top: 13.0, right: 13.0),
                          alignment: Alignment.topRight,
                          child: Text(
                            '내정보 수정 >',
                            style: TextStyle(
                              fontSize: 10.0,
                              fontWeight: FontWeight.w200,
                              color: Colors.grey.shade700,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 80.0,
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(Icons.home_outlined),
                            Text('내클럽'),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(Icons.receipt_outlined),
                            Text('쿠폰관리'),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(Icons.credit_card_outlined),
                            Text('결제관리'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.all(10.0),
            height: 250.0,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Container(
                            child: Icon(Icons.location_on_outlined),
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Container(
                            child: Text('지역설정'),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            child: Icon(Icons.arrow_forward_ios_rounded),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Container(
                            child: Icon(Icons.question_answer_outlined),
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Container(
                            child: Text('클럽 문의내역'),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            child: Icon(Icons.arrow_forward_ios_rounded),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Container(
                            child: Icon(Icons.mail_outlined),
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Container(
                            child: Text('말타자 문의하기'),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            child: Icon(Icons.arrow_forward_ios_rounded),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Container(
                            child: Icon(Icons.menu_book_outlined),
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Container(
                            child: Text('서비스 약관'),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            child: Icon(Icons.arrow_forward_ios_rounded),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Container(
                            child: Icon(Icons.info_outline),
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Container(
                            child: Text('버전정보'),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            child: Text('v0.0.1'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            child: Center(
              child: TextButton(
                onPressed: () {
                  AuthController.instance.logOut();
                },
                child: Text(
                  '로그아웃',
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
/*
Center(
        child: TextButton(
          onPressed: () {
            AuthController.instance.logOut();
          },
          child: Text('로그아웃..'),
        ),
      ),
 */