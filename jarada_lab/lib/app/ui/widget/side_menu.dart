import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:jarada_lab/app/controller/user/login_controller.dart';
import 'package:jarada_lab/app/data/provider/user/user_api.dart';
import 'package:jarada_lab/app/data/repository/user/user_repository.dart';
import 'package:jarada_lab/app/routes/app_pages.dart';

class SideMenu extends StatelessWidget {
  @override
  LoginController _controller = Get.put(LoginController(
      userRepository: UserRepository(
          userApiClient: UserApiClient(httpClient: http.Client()))));

  @override
  Widget build(BuildContext context) {
    void _showDialog() {
      showCupertinoDialog(
          context: context,
          builder: (context) {
            return CupertinoAlertDialog(
              title: Text('접근불가'),
              content: Text('현재 준비중인 페이지입니다.'),
              actions: [
                CupertinoDialogAction(
                    onPressed: () => Navigator.pop(context),
                    isDefaultAction: true,
                    child: Text('확인')),
              ],
            );
          });
    }

    return Container(
      width: MediaQuery.of(context).size.width * 0.7,
      color: Colors.grey.shade200,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
            height: 170.0,
            child: DrawerHeader(
              margin: EdgeInsets.zero,
              decoration: BoxDecoration(
                color: Color.fromRGBO(245, 224, 57, 1),
              ),
              child: Row(
                children: [
                  Container(
                    child: CircleAvatar(
                      radius: 40.0,
                      backgroundColor: Colors.white,
                      child: ClipOval(
                        child: Image.asset(
                          '${_controller.loginData.getString('pic')}',
                          fit: BoxFit.cover,
                          width: 120.0,
                          height: 120.0,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10.0,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('${_controller.loginData.getString('id')}'),
                      Row(
                        children: [
                          Text('${_controller.loginData.getString('user_nm')}'),
                          const SizedBox(
                            width: 3.0,
                          ),
                          Image.asset(
                            'assets/images/edit.png',
                            width: 13.0,
                            height: 13.0,
                            fit: BoxFit.cover,
                          )
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 20.0),
            height: 80.0,
            color: Color.fromRGBO(245, 224, 57, 1),
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () => Get.toNamed(Routes.mypage, arguments: 0),
                    child: Container(
                      color: Color.fromARGB(255, 177, 164, 46),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/images/user.png',
                            width: 20.0,
                            height: 20.0,
                            fit: BoxFit.cover,
                          ),
                          const SizedBox(
                            height: 5.0,
                          ),
                          const Text(
                            '내정보',
                            style: TextStyle(
                              fontSize: 10.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 3.0,
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () => Get.toNamed(Routes.mypage, arguments: 1),
                    child: Container(
                      color: Color.fromARGB(255, 177, 164, 46),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/images/picture.png',
                            width: 20.0,
                            height: 20.0,
                            fit: BoxFit.cover,
                          ),
                          const SizedBox(
                            height: 3.0,
                          ),
                          const Text(
                            '내 교안 관리',
                            style: TextStyle(
                              fontSize: 10.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 3.0,
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () => Get.toNamed(Routes.mypage, arguments: 2),
                    child: Container(
                      color: Color.fromARGB(255, 177, 164, 46),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/images/star.png',
                            width: 20.0,
                            height: 20.0,
                            fit: BoxFit.cover,
                          ),
                          const SizedBox(
                            height: 3.0,
                          ),
                          const Text(
                            '즐겨찾기',
                            style: TextStyle(
                              fontSize: 10.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 3.0,
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () => _controller.logoutAct(),
                    child: Container(
                      color: Color.fromARGB(255, 177, 164, 46),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/images/logout.png',
                            width: 20.0,
                            height: 20.0,
                            fit: BoxFit.cover,
                          ),
                          const SizedBox(
                            height: 3.0,
                          ),
                          const Text(
                            '로그아웃',
                            style: TextStyle(
                              fontSize: 10.0,
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
          const Divider(
            height: 5.0,
          ),
          ListTile(
            onTap: () => Get.toNamed(Routes.board_monthly),
            title: Text(
              '이달의 연구작',
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
            ),
            trailing: Icon(Icons.arrow_forward_ios_outlined),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
            child: Container(
              //width: 1.0,
              height: 1.0,
              color: Colors.grey.shade400,
            ),
          ),
          ListTile(
            onTap: () => _showDialog(),
            title: Text(
              '재료 계획서',
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
            ),
            trailing: Icon(Icons.arrow_forward_ios_outlined),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
            child: Container(
              //width: 1.0,
              height: 1.0,
              color: Colors.grey.shade400,
            ),
          ),
          ListTile(
            onTap: () => _showDialog(),
            title: Text(
              '아이디어 검색',
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
            ),
            trailing: Icon(Icons.arrow_forward_ios_outlined),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
            child: Container(
              //width: 1.0,
              height: 1.0,
              color: Colors.grey.shade400,
            ),
          ),
          ListTile(
            onTap: () => _showDialog(),
            title: Text(
              '랭킹',
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
            ),
            trailing: Icon(Icons.arrow_forward_ios_outlined),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
            child: Container(
              //width: 1.0,
              height: 1.0,
              color: Colors.grey.shade400,
            ),
          ),
          ListTile(
            onTap: () => _showDialog(),
            title: Text(
              '관찰일지',
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
            ),
            trailing: Icon(Icons.arrow_forward_ios_outlined),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
            child: Container(
              //width: 1.0,
              height: 1.0,
              color: Colors.grey.shade400,
            ),
          ),
          const SizedBox(
            height: 30.0,
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Text(
                  '자라다 연구원의 파워가',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  width: 120.0,
                  height: 30.0,
                  alignment: Alignment.center,
                  margin: const EdgeInsets.fromLTRB(0, 5.0, 0, 5.0),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: Text(
                    '290,554개',
                    style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.yellow),
                  ),
                ),
                const Text(
                  '모아졌습니다!',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10.0, 0, 10.0, 15.0),
                  child: GestureDetector(
                    onTap: () => Get.toNamed(Routes.board_write),
                    child: Container(
                      height: 60.0,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(Icons.upload_file_outlined),
                          SizedBox(
                            width: 3.0,
                          ),
                          Text(
                            '작품 업로드',
                            style: TextStyle(
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
          ),
        ],
      ),
    );
  }
}
