import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:paynuri/app/routes/app_pages.dart';

class JoinProcess extends StatelessWidget {
  const JoinProcess({Key? key}) : super(key: key);

  Future<void> _showDialog(context) async {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('서비스 이용 불가 업종'),
            content: const Text(
                '상품권, 회원권, 다단계, 방문판매, 대부업, 사행성, 무형물품, 후원금, 정보제공서비스, 골동품, 충전, 순금, 의약품, 노래방, 마사지, 유흥주점, 단람주점 등'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('확인'),
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('가입절차'),
        centerTitle: true,
        backgroundColor: const Color.fromRGBO(22, 54, 105, 1),
        /*
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(23.0),
          child: Container(
            color: Colors.redAccent,
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: const [
                  Text(
                    '가입절차',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    width: 5.0,
                  ),
                  Text(
                    '>',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    width: 5.0,
                  ),
                  Text(
                    '정보입력',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        */
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 20.0),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 60.0,
                  alignment: Alignment.center,
                  child: const Text(
                    '페이누리 결제 서비스를 이용 신청해 주셔서 대단히 감사합니다.\n심사 기간은 영업일 기준 2~5일 소요되며 결과는\n문자 또는 직접 연락 드립니다.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 13.0,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15.0,
                ),
                Container(
                  child: Image.asset(
                    'assets/images/join_process.png',
                    fit: BoxFit.contain,
                  ),
                ),
                const SizedBox(
                  height: 50.0,
                ),
                GestureDetector(
                  onTap: () => _showDialog(context),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.6,
                    height: 50.0,
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(22, 54, 105, 1),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    alignment: Alignment.center,
                    child: const Text(
                      '서비스 이용불가 업종 안내',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 50.0,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
                  child: Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () => Get.back(),
                          child: Container(
                            height: 50.0,
                            color: Colors.grey,
                            alignment: Alignment.center,
                            child: const Text(
                              '취소',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10.0,
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () => Get.toNamed(Routes.join),
                          child: Container(
                            height: 50.0,
                            color: const Color.fromRGBO(22, 54, 105, 1),
                            alignment: Alignment.center,
                            child: const Text(
                              '다음',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
