import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lms/app/controller/user/login_controller.dart';

class UserLogin extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/login_bg.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 150.0,
                ),
                Container(
                  height: 100.0,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/lms_logo.png'),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(20.0),
                  child: Column(
                    children: <Widget>[
                      TextField(
                        controller: controller.userid_controller,
                        decoration: const InputDecoration(
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(25.0)),
                            borderSide: BorderSide(width: 1.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(25.0)),
                            borderSide:
                                BorderSide(color: Colors.white, width: 2.0),
                          ),
                          hintText: '아이디',
                          labelStyle: TextStyle(
                            color: Colors.white,
                          ),
                          hintStyle: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        style: TextStyle(
                          color: Colors.white,
                        ),
                        textInputAction: TextInputAction.next,
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      TextField(
                        controller: controller.pass_controller,
                        decoration: const InputDecoration(
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(25.0)),
                            borderSide: BorderSide(width: 10.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(25.0)),
                            borderSide:
                                BorderSide(color: Colors.white, width: 2.0),
                          ),
                          hintText: '비밀번호',
                          labelStyle: TextStyle(
                            color: Colors.white,
                          ),
                          hintStyle: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        style: TextStyle(
                          color: Colors.white,
                        ),
                        obscureText: true,
                        textInputAction: TextInputAction.done,
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Container(
                        //padding: EdgeInsets.all(10.0),
                        width: MediaQuery.of(context).size.width,
                        child: ElevatedButton(
                          onPressed: () {
                            controller.goActLogin();
                          },
                          child: Text(
                            '로그인',
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            primary: Colors.orange, // background
                            onPrimary: Colors.white, // foreground
                          ),
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.only(left: 15.0),
                            child: Text(
                              '*학원에서 등록하신 아이디와 비밀번호로 로그인 해주세요.',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 13.0,
                              ),
                            ),
                            alignment: Alignment.centerLeft,
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 15.0),
                            child: Text(
                              '*회원가입 및 탈퇴는 학원에 문의해 주세요.',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 13.0,
                              ),
                            ),
                            alignment: Alignment.centerLeft,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 30.0,
        color: Colors.white,
        alignment: Alignment.center,
        child: Text(
          '고객센터 02-8888-1234 | 운영시간 10:00 ~ 19:00 (주말, 공휴일 휴무)',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 10.0,
          ),
        ),
      ),
    );
  }
}
