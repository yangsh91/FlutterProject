import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:lms/app/data/repository/user_repository.dart';
import 'package:lms/app/routes/app_pages.dart';

class UserController extends GetxController {
  final UserRepository? repository;

  UserController({@required this.repository}) : assert(repository != null);

  SharedPreferences? logindata;
  bool? userChk;
  String? no, user_id;

  late TextEditingController userpw_controller,
      new_pass_controller,
      chk_pass_controller;

  @override
  void onInit() async {
    logindata = await SharedPreferences.getInstance();
    this.no = logindata!.getString('no');
    this.user_id = logindata!.getString('user_id');

    userpw_controller = TextEditingController();
    new_pass_controller = TextEditingController();
    chk_pass_controller = TextEditingController();

    print("$user_id;;;");

    super.onInit();
  }

  @override
  void onClose() {
    userpw_controller.dispose();
    new_pass_controller.dispose();
    chk_pass_controller.dispose();
  }

  // 비밀번호 변경
  goActUserPass() async {
    print(new_pass_controller.text);
    var new_password = new_pass_controller.text;

    // repository?.goActUserPass(no: no, new_pass: new_password).then((data) {
    //   if (data['result'] == "0000") {
    //   } else {}
    // });
  }
}
