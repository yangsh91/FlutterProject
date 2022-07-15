import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jarada_lab/app/controller/user/pass_change_controller.dart';
import 'package:jarada_lab/app/ui/widget/side_menu.dart';

class PassChange extends GetView<PassChangeController> {
  const PassChange({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void _showSnackBar(String text) {
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

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: Colors.grey.shade200,
        appBar: AppBar(
          backgroundColor: const Color.fromRGBO(26, 28, 28, 1),
          iconTheme: IconThemeData(
            color: Color.fromARGB(255, 189, 187, 168),
          ),
          toolbarHeight: 50.0,
          centerTitle: false,
          leading: GestureDetector(
            onTap: () => Get.back(),
            child: const Icon(
              Icons.arrow_back_ios_new_outlined,
              color: Colors.yellow,
            ),
          ),
          title: Container(
            alignment: Alignment.center,
            width: 100.0,
            child: Image.asset(
              'assets/images/logo.png',
              fit: BoxFit.contain,
            ),
          ),
        ),
        endDrawer: SideMenu(),
        body: Obx(
          () => Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
                child: Container(
                  child: TextField(
                    controller: controller.current_pass,
                    decoration: const InputDecoration(
                      fillColor: Colors.grey,
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
                          color: Colors.grey,
                          width: 2.0,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.blueAccent,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.0),
                        ),
                      ),
                      hintText: '현재 비밀번호를 입력해 주세요',
                      hintStyle: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    obscureText: true,
                    textInputAction: TextInputAction.next,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 10.0),
                child: Container(
                  child: TextField(
                    controller: controller.new_pass,
                    decoration: const InputDecoration(
                      fillColor: Colors.grey,
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
                          color: Colors.grey,
                          width: 2.0,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.blueAccent,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.0),
                        ),
                      ),
                      hintText: '변경할 비밀번호를 입력해 주세요',
                      hintStyle: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    obscureText: true,
                    textInputAction: TextInputAction.next,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 10.0),
                child: Container(
                  child: TextField(
                    controller: controller.chk_pass,
                    decoration: const InputDecoration(
                      fillColor: Colors.grey,
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
                          color: Colors.grey,
                          width: 2.0,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.blueAccent,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.0),
                        ),
                      ),
                      hintText: '변경할 비밀번호를 확인해 주세요',
                      hintStyle: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    obscureText: true,
                    onChanged: (key) {
                      var current_pass = controller.current_pass.text;
                      var new_pass = controller.new_pass.text;
                      var chk_pass = controller.chk_pass.text;

                      controller.chkInputData(
                          current_pass: current_pass,
                          new_pass: new_pass,
                          chk_pass: chk_pass);
                    },
                    onSubmitted: (key) {
                      var current_pass = controller.current_pass.text;
                      var new_pass = controller.new_pass.text;
                      var chk_pass = controller.chk_pass.text;

                      if (current_pass.isEmpty) {
                        _showSnackBar('현재 비밀번호를 입력해 주세요.');
                        return;
                      }

                      if (new_pass.isEmpty) {
                        _showSnackBar('변경할 비밀번호를 입력해 주세요.');
                        return;
                      }

                      if (chk_pass.isEmpty) {
                        _showSnackBar('변경할 비밀번호를 확인해 주세요.');
                        return;
                      }

                      if (new_pass != chk_pass) {
                        _showSnackBar('비밀번호가 일치하지 않습니다.');
                        return;
                      }

                      controller.goActPassChg(
                          context: context,
                          user_pw: current_pass,
                          new_pw: new_pass);
                    },
                  ),
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 0),
                child: GestureDetector(
                  onTap: () {
                    var current_pass = controller.current_pass.text;
                    var new_pass = controller.new_pass.text;
                    var chk_pass = controller.chk_pass.text;

                    if (current_pass.isEmpty) {
                      _showSnackBar('현재 비밀번호를 입력해 주세요.');
                      return;
                    }

                    if (new_pass.isEmpty) {
                      _showSnackBar('변경할 비밀번호를 입력해 주세요.');
                      return;
                    }

                    if (chk_pass.isEmpty) {
                      _showSnackBar('변경할 비밀번호를 확인해 주세요.');
                      return;
                    }

                    if (new_pass != chk_pass) {
                      _showSnackBar('비밀번호가 일치하지 않습니다.');
                      return;
                    }

                    controller.goActPassChg(
                        context: context,
                        user_pw: current_pass,
                        new_pw: new_pass);
                  },
                  child: Container(
                    width: double.infinity,
                    height: 50.0,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: controller.isChk.value
                          ? Colors.blueAccent
                          : Colors.grey.shade400,
                      border: Border.all(
                        width: 1.0,
                        color: Colors.grey.shade400,
                      ),
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: Text(
                      '비밀번호 변경',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
