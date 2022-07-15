import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lms/app/controller/user/user_controller.dart';
import 'package:lms/app/routes/app_pages.dart';

class UserPassChg extends GetView<UserController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('비밀번호 관리'),
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 15.0),
              child: TextField(
                controller: controller.userpw_controller,
                decoration: InputDecoration(
                  fillColor: Colors.grey,
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 2.0),
                    borderRadius: BorderRadius.all(Radius.circular(15.0)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 2.0),
                    borderRadius: BorderRadius.all(Radius.circular(15.0)),
                  ),
                  hintText: '기존 비밀번호',
                ),
                obscureText: true,
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 15.0),
              child: TextField(
                controller: controller.new_pass_controller,
                decoration: InputDecoration(
                  fillColor: Colors.grey,
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 2.0),
                    borderRadius: BorderRadius.all(Radius.circular(15.0)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 2.0),
                    borderRadius: BorderRadius.all(Radius.circular(15.0)),
                  ),
                  hintText: '새 비밀번호',
                ),
                obscureText: true,
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 15.0),
              child: TextField(
                controller: controller.chk_pass_controller,
                decoration: InputDecoration(
                  fillColor: Colors.grey,
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 2.0),
                    borderRadius: BorderRadius.all(Radius.circular(15.0)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 2.0),
                    borderRadius: BorderRadius.all(Radius.circular(15.0)),
                  ),
                  hintText: '새 비밀번호 확인',
                ),
                obscureText: true,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 20.0, right: 20.0, top: 15.0, bottom: 5.0),
              child: Container(
                height: 15.0,
                child: Text(
                  '* 새로운 비밀번호를 입력해 주세요.',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 13.0,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0),
              child: Container(
                height: 15.0,
                child: Text(
                  '* 비밀번호는 영문, 숫자 조합 8자리 이상 입력해 주세요.',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 13.0,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                margin: EdgeInsets.only(top: 20.0),
                decoration: BoxDecoration(
                  color: Colors.orange,
                ),
                child: TextButton(
                    onPressed: () {
                      // String pass = _recentPass.text;
                      // String chgPass = _chgPass.text;
                      // String chgPassChk = _chgPassChk.text;
                      controller.goActUserPass();
                      // goAct(pass, chgPass, chgPassChk);
                    },
                    child: Text(
                      '수정',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                      ),
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
