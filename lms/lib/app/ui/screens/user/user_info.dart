import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lms/app/controller/user/user_controller.dart';
import 'package:lms/app/routes/app_pages.dart';

class UserInfo extends GetView<UserController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('내 정보 수정'),
        //leading: GestureDetector(onTap: () {}, child: Icon(Icons.cancel_sharp)),
        actions: [
          TextButton(
            onPressed: () {},
            child: Text('완료'),
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: EdgeInsets.only(top: 30.0),
            alignment: Alignment.topCenter,
            child: SizedBox(
              height: 115,
              width: 115,
              child: Stack(
                clipBehavior: Clip.none,
                fit: StackFit.expand,
                children: <Widget>[
                  CircleAvatar(
                    backgroundImage: AssetImage('assets/images/sohee.jpeg'),
                    child: Stack(
                      children: [
                        Align(
                          alignment: Alignment.bottomRight,
                          child: CupertinoButton(
                            padding: EdgeInsets.only(left: 15.0),
                            onPressed: () {
                              showCupertinoModalPopup(
                                context: context,
                                builder: (BuildContext context) =>
                                    CupertinoActionSheet(
                                  //title: const Text('title'),
                                  //message: const Text('message'),
                                  actions: <CupertinoActionSheetAction>[
                                    CupertinoActionSheetAction(
                                        onPressed: () {},
                                        child: const Text('카메라')),
                                    CupertinoActionSheetAction(
                                        onPressed: () {},
                                        child: const Text('사진 앨범')),
                                  ],
                                  cancelButton: CupertinoActionSheetAction(
                                      onPressed: () {
                                        print("cancel...");
                                        Get.back();
                                      },
                                      child: const Text('취소')),
                                ),
                              );
                            },
                            child: CircleAvatar(
                              radius: 18,
                              backgroundColor: Colors.blue.shade300,
                              child: const Icon(
                                CupertinoIcons.camera,
                                color: Colors.white70,
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
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              padding: EdgeInsets.all(10.0),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Text(
                '${controller.user_id}',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              padding: EdgeInsets.all(10.0),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Text(
                '${controller.user_id}',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              padding: EdgeInsets.all(10.0),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Text(
                'test@owra.net',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Get.toNamed(Routes.PASS_CHG);
            },
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                padding: EdgeInsets.all(10.0),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.lock,
                      color: Colors.white,
                    ),
                    Text(
                      "비밀번호 변경",
                      style: TextStyle(
                        color: Colors.white,
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
    );
  }
}
