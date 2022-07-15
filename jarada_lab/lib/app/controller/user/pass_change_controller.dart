import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jarada_lab/app/controller/user/login_controller.dart';
import 'package:jarada_lab/app/data/repository/user/user_repository.dart';

class PassChangeController extends GetxController {
  final UserRepository? userRepository;

  PassChangeController({this.userRepository}) : assert(userRepository != null);

  late TextEditingController current_pass, new_pass, chk_pass;
  late RxBool isChk;

  @override
  void onInit() {
    super.onInit();

    current_pass = TextEditingController();
    new_pass = TextEditingController();
    chk_pass = TextEditingController();

    isChk = false.obs;
  }

  void chkInputData(
      {String? current_pass, String? new_pass, String? chk_pass}) {
    print(current_pass);

    if (!current_pass!.isEmpty && !new_pass!.isEmpty && !chk_pass!.isEmpty) {
      isChk.value = true;
    } else {
      isChk.value = false;
    }

    print(isChk.value);
  }

  Future<void> goActPassChg(
      {context, required String user_pw, required String new_pw}) async {
    String user_id = Get.find<LoginController>().loginData.get("id").toString();

    userRepository
        ?.userPwChange(user_id: user_id, user_pw: user_pw, new_pw: new_pw)
        .then((result) {
      if (result['success'] == "0000") {
        _showSnackBar(context, result['msg']);
        Get.back();
      } else {
        _showSnackBar(context, result['msg']);
      }
    });
  }

  void _showSnackBar(context, String text) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: const Color.fromRGBO(26, 28, 28, 1),
        content: Text(
          text,
          style: const TextStyle(
            color: Colors.yellow,
            fontWeight: FontWeight.bold,
          ),
        ),
        duration: const Duration(seconds: 2),
      ),
    );
  }
}
