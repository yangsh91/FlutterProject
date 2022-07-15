import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jarada_lab/app/controller/user/login_controller.dart';

class Login extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: WillPopScope(
        onWillPop: () async {
          return false;
        },
        child: Scaffold(
          backgroundColor: const Color.fromRGBO(26, 28, 28, 1),
          body: SafeArea(
            child: Obx(
              () => Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 50.0,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: Image.asset(
                      'assets/images/logo.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(
                    height: 25.0,
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
                    child: TextField(
                      controller: controller.id_controller,
                      decoration: const InputDecoration(
                        fillColor: Colors.white54,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10.0),
                          ),
                          borderSide: BorderSide(
                            color: Colors.yellow,
                            width: 1.0,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10.0),
                          ),
                          borderSide: BorderSide(
                            color: Colors.white54,
                            width: 2.0,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.yellow,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(10.0),
                          ),
                        ),
                        hintText: '아이디',
                        hintStyle: TextStyle(
                          color: Colors.white54,
                        ),
                      ),
                      style: TextStyle(
                        color: Colors.yellow,
                      ),
                      textInputAction: TextInputAction.next,
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
                    child: TextField(
                      controller: controller.pw_controller,
                      decoration: const InputDecoration(
                        fillColor: Colors.white54,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10.0),
                          ),
                          borderSide:
                              BorderSide(color: Colors.yellow, width: 1.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10.0),
                          ),
                          borderSide: BorderSide(
                            color: Colors.white54,
                            width: 2.0,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.yellow,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(10.0),
                          ),
                        ),
                        hintText: '비밀번호',
                        hintStyle: TextStyle(
                          color: Colors.white54,
                        ),
                      ),
                      style: TextStyle(
                        color: Colors.yellow,
                      ),
                      obscureText: true,
                      textInputAction: TextInputAction.done,
                    ),
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  Visibility(
                    visible: controller.isLoading.value == true,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.yellow,
                        borderRadius: BorderRadius.circular(
                          10.0,
                        ),
                      ),
                      child: Center(
                        child: RefreshProgressIndicator(),
                      ),
                    ),
                  ),
                  Visibility(
                    visible: controller.isLoading.value == false,
                    child: GestureDetector(
                      onTap: () => controller.loginAct(context),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
                        child: Container(
                          height: 50.0,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Colors.yellow,
                            borderRadius: BorderRadius.circular(
                              10.0,
                            ),
                          ),
                          child: const Text(
                            '로그인',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 17.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
