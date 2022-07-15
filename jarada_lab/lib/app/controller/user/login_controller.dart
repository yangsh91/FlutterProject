import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jarada_lab/app/binding/home/home_binding.dart';
import 'dart:convert';
import 'package:jarada_lab/app/data/repository/user/user_repository.dart';
import 'package:jarada_lab/app/routes/app_pages.dart';
import 'package:jarada_lab/app/ui/home/home.dart';
import 'package:jarada_lab/app/ui/user/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  final UserRepository? userRepository;

  LoginController({required this.userRepository})
      : assert(userRepository != null);
  static LoginController get to => Get.find<LoginController>();

  late SharedPreferences loginData;
  late bool? userChk;

  var isLoading = false.obs;

  late TextEditingController id_controller, pw_controller;

  @override
  void onInit() {
    check_user_login();

    id_controller = TextEditingController();
    pw_controller = TextEditingController();

    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();

    id_controller.dispose();
    pw_controller.dispose();
  }

  void check_user_login() async {
    loginData = await SharedPreferences.getInstance();
    userChk = (loginData.getBool('login') ?? false);

    if (userChk == true) {
      Get.toNamed(Routes.initial);
      //Get.offAll(() => Home(), binding: HomeBinding());
    }
  }

  void loginAct(context) async {
    var user_id = id_controller.text;
    var user_pw = pw_controller.text;

    if (user_id.isEmpty) {
      _showSnackBar(context, '아이디를 입력해 주세요.');
      return;
    }

    if (user_pw.isEmpty) {
      _showSnackBar(context, '비밀번호를 입력해 주세요.');
      return;
    }

    isLoading.value = true;

    await Future.delayed(const Duration(seconds: 2));

    await userRepository
        ?.getLogin(user_id: user_id, user_pw: user_pw)
        .then((data) {
      if (data['success'] == '0000') {
        loginData.setBool('login', true);
        loginData.setString('no', data['data']['no']);
        loginData.setString('id', data['data']['id']);
        loginData.setString('user_nm', data['data']['user_nm']);
        loginData.setString('hp_no', data['data']['hp_no']);
        loginData.setString('pic', data['data']['logo_path']);
        loginData.setString('user_auth', data['data']['user_auth']);

        _showSnackBar(context, '${data['data']['user_nm']}님 환영합니다.');

        isLoading.value = false;

        Get.toNamed(Routes.initial);
      } else {
        _showSnackBar(context, data['msg']);
      }
    });
  }

  void logoutAct() async {
    print('logout bye');

    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.clear();

    Get.toNamed(Routes.login);
  }

  void _showSnackBar(context, String text) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.red,
        content: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 15.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        duration: const Duration(seconds: 2),
      ),
    );
  }
}
