import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:lms/app/data/repository/login_repository.dart';
import 'package:lms/app/ui/screens/notice/notice_list.dart';
import 'package:lms/app/routes/app_pages.dart';

class LoginController extends GetxController {
  final LoginRepository? repository;

  LoginController({@required this.repository}) : assert(repository != null);

  SharedPreferences? logindata;
  bool? userChk;

  late TextEditingController userid_controller, pass_controller;

  @override
  void onInit() {
    check_user_login();

    userid_controller = TextEditingController();
    pass_controller = TextEditingController();

    super.onInit();
  }

  @override
  void onClose() {
    userid_controller.dispose();
    pass_controller.dispose();
  }

  void check_user_login() async {
    logindata = await SharedPreferences.getInstance();
    userChk = (logindata!.getBool('login') ?? false);

    if (userChk == true) {
      Get.toNamed(Routes.NOTICE_LIST);
    }
  }

  goActLogin() async {
    var user_id = userid_controller.text;
    var user_pw = pass_controller.text;

    repository?.goActLogin(user_id: user_id, user_pw: user_pw).then((data) {
      if (data['result'] == "0000") {
        logindata!.setBool('login', true);
        logindata!.setString('no', data['data']['no']);
        logindata!.setString('user_id', data['data']['id']);

        //Get.offAll(() => Routes.NOTICE_LIST);
        Get.toNamed(Routes.NOTICE_LIST);
      }
    });
  }
}
