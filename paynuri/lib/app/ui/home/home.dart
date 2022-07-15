import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:paynuri/app/controller/user/login_controller.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:paynuri/app/routes/app_pages.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        backgroundColor: Colors.grey.shade100,
        appBar: AppBar(
          title: const Text('페이누리 결제테스트앱'),
          centerTitle: true,
          automaticallyImplyLeading: true,
          leading: Container(),
          backgroundColor: const Color.fromRGBO(22, 54, 105, 1),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 30.0),
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () => Get.toNamed(Routes.payment_credit),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.45,
                        height: 200.0,
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(22, 54, 105, 1),
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        alignment: Alignment.center,
                        // padding: const EdgeInsets.only(left: 5.0),
                        child: const Text(
                          '카드결제단말기\n불편하지\n않으세요?',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 25.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 15.0,
                    ),
                    GestureDetector(
                      onTap: () => Get.toNamed(Routes.payment_request),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.45,
                        height: 200.0,
                        decoration: BoxDecoration(
                          color: Colors.green.shade800,
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        alignment: Alignment.center,
                        // padding: const EdgeInsets.only(left: 10.0),
                        child: const Text(
                          '고객님이\n바빠서 직접\n못 오셨나요?',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 25.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            GestureDetector(
              onTap: () => Get.toNamed(Routes.tran_list),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
                child: Container(
                  height: 60.0,
                  decoration: BoxDecoration(
                    color: Colors.orange.shade900,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  alignment: Alignment.center,
                  child: const Text(
                    '거래내역',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () => Get.toNamed(Routes.manage),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.45,
                      height: 100.0,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: const Center(
                        child: Text(
                          '상품&고객\n관리를 한번에',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 25.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 15.0,
                  ),
                  GestureDetector(
                    onTap: () => Get.toNamed(Routes.settings),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.45,
                      height: 100.0,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.settings,
                            size: 40.0,
                          ),
                          Text(
                            '설정',
                            style: TextStyle(
                              fontSize: 25.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 40.0,
            ),
            Center(
              child: GestureDetector(
                onTap: () => Get.toNamed(Routes.guides),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.black54,
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(50.0, 20.0, 50.0, 20.0),
                    child: Text(
                      '이용 가이드',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 30.0,
            ),
            Center(
              child: GestureDetector(
                onTap: () => FlutterPhoneDirectCaller.callNumber('1644-1772'),
                child: Container(
                  width: 130,
                  height: 40.0,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(
                      25.0,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.phone_iphone_rounded),
                      const SizedBox(
                        width: 10.0,
                      ),
                      const Text(
                        '문의하기',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: Container(
          height: 50.0,
          color: const Color.fromRGBO(22, 54, 105, 1),
          alignment: Alignment.center,
          child: const Text(
            'Copyright Owrainfo Co.,Ltd All rights reserved.',
            style: TextStyle(
              color: Colors.white,
              fontSize: 12.5,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}

/*
GestureDetector(
          onTap: () => Get.find<LoginController>().logoutAct(),
          child: Center(
            child: const Text('로그아웃'),
          ),
        ),
*/
