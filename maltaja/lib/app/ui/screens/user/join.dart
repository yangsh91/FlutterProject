import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maltaja/app/controller/user/auth_controller.dart';

import 'package:maltaja/app/routes/app_pages.dart';
import 'package:maltaja/app/ui/screens/user/login.dart';

void goToLogin() {
  Get.offAll(() => Login());
}

class Join extends GetView<AuthController> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final TextEditingController passChkController = TextEditingController();

  Future<void> onSignUp(String email, pass, passChk) async {
    if (pass != passChk) {
      print("password not same");
      return;
    }

    AuthController.instance.register(email, pass);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade600,
        title: Text('회원가입'),
        leading: IconButton(
          onPressed: () => Get.offAll(() => Login()),
          icon: Icon(Icons.close),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomRight,
            stops: [
              0.1,
              0.4,
              0.6,
              0.9,
            ],
            colors: [
              Colors.lightBlueAccent,
              Colors.lightBlueAccent.shade700,
              Colors.lightBlue.shade100,
              Colors.lightBlue.shade50,
            ],
          ),
        ),
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(20.0),
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 50.0,
                    child: TextField(
                      controller: emailController,
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        border: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.white, width: 1.5),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.white, width: 1.5),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red, width: 2.5),
                        ),
                        hintText: '이메일',
                        hintStyle: TextStyle(
                          color: Colors.brown,
                          fontSize: 13.0,
                        ),
                      ),
                      textInputAction: TextInputAction.next,
                    ),
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  SizedBox(
                    height: 50.0,
                    child: TextField(
                      controller: passController,
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        border: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.white, width: 1.5),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.white, width: 1.5),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red, width: 2.5),
                        ),
                        hintText: '비밀번호',
                        hintStyle: TextStyle(
                          color: Colors.brown,
                          fontSize: 13.0,
                        ),
                      ),
                      obscureText: true,
                      textInputAction: TextInputAction.done,
                    ),
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  SizedBox(
                    height: 50.0,
                    child: TextField(
                      controller: passChkController,
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        border: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.white, width: 1.5),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.white, width: 1.5),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red, width: 2.5),
                        ),
                        hintText: '비밀번호 확인',
                        hintStyle: TextStyle(
                          color: Colors.brown,
                          fontSize: 13.0,
                        ),
                      ),
                      obscureText: true,
                      textInputAction: TextInputAction.done,
                    ),
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  Container(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        String email = emailController.text;
                        String pass = passController.text;
                        String passChk = passChkController.text;

                        onSignUp(email, pass, passChk);
                      },
                      child: Text(
                        '회원가입',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.amber.shade900,
                        onPrimary: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        color: Colors.lightBlue.shade50,
        height: 50.0,
        alignment: Alignment.center,
        child: Text(
          'copyright \u00a9 hun\'s maltaja.',
          style: TextStyle(
            color: Colors.grey,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
