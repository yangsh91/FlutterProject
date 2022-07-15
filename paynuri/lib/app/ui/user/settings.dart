import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:paynuri/app/controller/user/login_controller.dart';
import 'package:paynuri/app/controller/user/settings_controller.dart';

class Settings extends GetView<SettingsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('설정'),
        centerTitle: true,
        backgroundColor: const Color.fromRGBO(22, 54, 105, 1),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 0),
        child: SingleChildScrollView(
          child: Obx(
            () => Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      width: 120.0,
                      height: 30.0,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        border: Border.all(
                          width: 2.0,
                          color: const Color.fromRGBO(22, 54, 105, 1),
                        ),
                      ),
                      alignment: Alignment.center,
                      child: const Text(
                        '결제모듈',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () =>
                              Get.find<LoginController>().logoutAct(),
                          child: const Text(
                            '로그아웃',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 16.0,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15.0,
                ),
                Container(
                  width: double.infinity,
                  height: 140.0,
                  decoration: BoxDecoration(),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 120.0,
                            height: 40.0,
                            alignment: Alignment.centerLeft,
                            child: const Text(
                              '사용여부',
                              style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              height: 40.0,
                              alignment: Alignment.centerLeft,
                              child: CupertinoSwitch(
                                value: controller.isPayment.value,
                                activeColor:
                                    const Color.fromRGBO(22, 54, 105, 1),
                                onChanged: (bool? isBool) {
                                  controller.isPayment.value = isBool!;
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Row(
                        children: [
                          Container(
                            width: 120.0,
                            height: 40.0,
                            alignment: Alignment.centerLeft,
                            child: const Text(
                              '상점ID',
                              style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              height: 40.0,
                              alignment: Alignment.centerLeft,
                              child: TextField(
                                // controller: controller.id_controller,
                                decoration: const InputDecoration(
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color.fromRGBO(22, 54, 105, 1),
                                        width: 2.0,
                                      ),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color.fromRGBO(22, 54, 105, 1),
                                        width: 2.0,
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.amber,
                                        width: 4.0,
                                      ),
                                    ),
                                    hintText: '상점ID',
                                    hintStyle: TextStyle(
                                      color: Colors.black45,
                                    ),
                                    contentPadding: const EdgeInsets.fromLTRB(
                                        10.0, 10.0, 0, 0)),
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                                textInputAction: TextInputAction.next,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Row(
                        children: [
                          Container(
                            width: 120.0,
                            height: 40.0,
                            alignment: Alignment.centerLeft,
                            child: const Text(
                              '상점KEY',
                              style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              height: 40.0,
                              alignment: Alignment.centerLeft,
                              child: TextField(
                                // controller: controller.id_controller,
                                decoration: const InputDecoration(
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color.fromRGBO(22, 54, 105, 1),
                                        width: 2.0,
                                      ),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color.fromRGBO(22, 54, 105, 1),
                                        width: 2.0,
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.amber,
                                        width: 4.0,
                                      ),
                                    ),
                                    hintText: '상점KEY',
                                    hintStyle: TextStyle(
                                      color: Colors.black45,
                                    ),
                                    contentPadding: const EdgeInsets.fromLTRB(
                                        10.0, 10.0, 0, 0)),
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                                textInputAction: TextInputAction.next,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Container(
                  width: 120.0,
                  height: 30.0,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    border: Border.all(
                      width: 2.0,
                      color: Color.fromRGBO(22, 54, 105, 1),
                    ),
                  ),
                  alignment: Alignment.center,
                  child: const Text(
                    'NFC',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15.0,
                ),
                Container(
                  width: double.infinity,
                  height: 90.0,
                  decoration: BoxDecoration(),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 120.0,
                            height: 40.0,
                            alignment: Alignment.centerLeft,
                            child: const Text(
                              '사용여부',
                              style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              height: 40.0,
                              alignment: Alignment.centerLeft,
                              child: CupertinoSwitch(
                                value: controller.isNfc.value,
                                activeColor:
                                    const Color.fromRGBO(22, 54, 105, 1),
                                onChanged: (bool? isBool) {
                                  controller.isNfc.value = isBool!;
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Row(
                        children: [
                          Container(
                            width: 120.0,
                            height: 40.0,
                            alignment: Alignment.centerLeft,
                            child: const Text(
                              '토큰ID',
                              style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              height: 40.0,
                              alignment: Alignment.centerLeft,
                              child: TextField(
                                // controller: controller.id_controller,
                                decoration: const InputDecoration(
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color.fromRGBO(22, 54, 105, 1),
                                        width: 2.0,
                                      ),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color.fromRGBO(22, 54, 105, 1),
                                        width: 2.0,
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.amber,
                                        width: 4.0,
                                      ),
                                    ),
                                    hintText: '토큰ID',
                                    hintStyle: TextStyle(
                                      color: Colors.black45,
                                    ),
                                    contentPadding: const EdgeInsets.fromLTRB(
                                        10.0, 10.0, 0, 0)),
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                                textInputAction: TextInputAction.next,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Container(
                  width: 120.0,
                  height: 30.0,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    border: Border.all(
                      width: 2.0,
                      color: Color.fromRGBO(22, 54, 105, 1),
                    ),
                  ),
                  alignment: Alignment.center,
                  child: const Text(
                    '스캔',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15.0,
                ),
                Container(
                  width: double.infinity,
                  height: 90.0,
                  decoration: BoxDecoration(),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 120.0,
                            height: 40.0,
                            alignment: Alignment.centerLeft,
                            child: const Text(
                              '사용여부',
                              style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              height: 40.0,
                              alignment: Alignment.centerLeft,
                              child: CupertinoSwitch(
                                value: controller.isScan.value,
                                activeColor:
                                    const Color.fromRGBO(22, 54, 105, 1),
                                onChanged: (bool? isBool) {
                                  controller.isScan.value = isBool!;
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Row(
                        children: [
                          Container(
                            width: 120.0,
                            height: 40.0,
                            alignment: Alignment.centerLeft,
                            child: const Text(
                              '토큰ID',
                              style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              height: 40.0,
                              alignment: Alignment.centerLeft,
                              child: TextField(
                                // controller: controller.id_controller,
                                decoration: const InputDecoration(
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color.fromRGBO(22, 54, 105, 1),
                                        width: 2.0,
                                      ),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color.fromRGBO(22, 54, 105, 1),
                                        width: 2.0,
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.amber,
                                        width: 4.0,
                                      ),
                                    ),
                                    hintText: '토큰ID',
                                    hintStyle: TextStyle(
                                      color: Colors.black45,
                                    ),
                                    contentPadding: const EdgeInsets.fromLTRB(
                                        10.0, 10.0, 0, 0)),
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                                textInputAction: TextInputAction.next,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Container(
                  width: 120.0,
                  height: 30.0,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    border: Border.all(
                      width: 2.0,
                      color: Color.fromRGBO(22, 54, 105, 1),
                    ),
                  ),
                  alignment: Alignment.center,
                  child: const Text(
                    'SMS',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15.0,
                ),
                Container(
                  width: double.infinity,
                  height: 90.0,
                  decoration: BoxDecoration(),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 120.0,
                            height: 40.0,
                            alignment: Alignment.centerLeft,
                            child: const Text(
                              '사용여부',
                              style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              height: 40.0,
                              alignment: Alignment.centerLeft,
                              child: CupertinoSwitch(
                                value: controller.isSms.value,
                                activeColor:
                                    const Color.fromRGBO(22, 54, 105, 1),
                                onChanged: (bool? isBool) {
                                  controller.isSms.value = isBool!;
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Row(
                        children: [
                          Container(
                            width: 120.0,
                            height: 40.0,
                            alignment: Alignment.centerLeft,
                            child: const Text(
                              '토큰ID',
                              style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              height: 40.0,
                              alignment: Alignment.centerLeft,
                              child: TextField(
                                // controller: controller.id_controller,
                                decoration: const InputDecoration(
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color.fromRGBO(22, 54, 105, 1),
                                        width: 2.0,
                                      ),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color.fromRGBO(22, 54, 105, 1),
                                        width: 2.0,
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.amber,
                                        width: 4.0,
                                      ),
                                    ),
                                    hintText: '토큰ID',
                                    hintStyle: TextStyle(
                                      color: Colors.black45,
                                    ),
                                    contentPadding: const EdgeInsets.fromLTRB(
                                        10.0, 10.0, 0, 0)),
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                                textInputAction: TextInputAction.next,
                              ),
                            ),
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
    );
  }
}
