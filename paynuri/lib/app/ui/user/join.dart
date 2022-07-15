import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kpostal/kpostal.dart';
import 'package:image_picker/image_picker.dart';
import 'package:paynuri/app/controller/user/join_controller.dart';

class Join extends GetView<JoinController> {
  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.red;
      }
      return Color.fromRGBO(22, 54, 105, 1);
    }

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('회원가입'),
          centerTitle: true,
          backgroundColor: const Color.fromRGBO(22, 54, 105, 1),
        ),
        body: Obx(
          () => SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 60.0,
                  alignment: Alignment.center,
                  child: const Text(
                    '페이누리 결제 서비스를 이용 신청해 주셔서 대단히 감사합니다.\n심사 기간은 영업일 기준 2~5일 소요되며 결과는\n문자 또는 직접 연락 드립니다.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 13.0,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15.0,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
                  child: Container(
                    color: Colors.transparent,
                    child: Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () => _showModalPopUp(context, 'biz'),
                            child: Container(
                              height: 45.0,
                              decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              alignment: Alignment.center,
                              child: const Text(
                                '사업자 등록증 촬영',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 20.0,
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: () => _showModalPopUp(context, 'id'),
                            child: Container(
                              height: 45.0,
                              decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              alignment: Alignment.center,
                              child: const Text(
                                '신분증 촬영',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
                  child: Row(
                    children: [
                      Expanded(
                        child: DottedBorder(
                          color: Colors.grey,
                          strokeWidth: 1,
                          child: Container(
                            height: 130.0,
                            child: controller.selectBizImagePath == ''
                                ? Container()
                                : Image.file(
                                    File(controller.selectBizImagePath.value),
                                    fit: BoxFit.contain,
                                  ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 20.0,
                      ),
                      Expanded(
                        child: DottedBorder(
                          color: Colors.grey,
                          strokeWidth: 1,
                          child: Container(
                            height: 130.0,
                            child: controller.selectIdImagePath == ''
                                ? Container()
                                : Image.file(
                                    File(controller.selectIdImagePath.value),
                                    fit: BoxFit.contain,
                                  ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
                  child: Container(
                    height: 40.0,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(115, 20, 11, 11),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.5,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: const Text(
                              '결제한도 100만원 이상',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: 30.0,
                          child: Checkbox(
                              side: BorderSide(
                                color: Colors.white,
                                width: 2.0,
                              ),
                              fillColor:
                                  MaterialStateProperty.resolveWith(getColor),
                              value: controller.isCheck.value,
                              onChanged: (bool? isBool) {
                                controller.isCheck.value = isBool!;
                              }),
                        ),
                        Expanded(
                          child: Container(
                            alignment: Alignment.centerRight,
                            child: Padding(
                              padding: const EdgeInsets.only(right: 10.0),
                              child: const Tooltip(
                                message: '결제 한도 100만원\n이상은 보증보험\n발행이 필요합니다.',
                                child: Icon(Icons.info_rounded),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
                  child: Container(
                    height: 50.0,
                    child: TextField(
                      autocorrect: false,
                      decoration: InputDecoration(
                        hintText: '상호명',
                        //prefixIcon: Image.asset(''),
                        hintStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 14.0,
                        ),
                        filled: true,
                        fillColor: Colors.white70,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12.0)),
                          borderSide: BorderSide(
                              color: Color.fromRGBO(22, 54, 105, 1), width: 2),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide: BorderSide(color: Colors.amber, width: 4),
                        ),
                        contentPadding: EdgeInsets.fromLTRB(10.0, 10.0, 0, 0),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
                  child: Container(
                    height: 50.0,
                    child: TextField(
                      autocorrect: false,
                      decoration: InputDecoration(
                        hintText: '대표자(담당자)',
                        //prefixIcon: Image.asset(''),
                        hintStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 14.0,
                        ),
                        filled: true,
                        fillColor: Colors.white70,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12.0)),
                          borderSide: BorderSide(
                              color: Color.fromRGBO(22, 54, 105, 1), width: 2),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide: BorderSide(color: Colors.amber, width: 4),
                        ),
                        contentPadding: EdgeInsets.fromLTRB(10.0, 10.0, 0, 0),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
                  child: Container(
                    height: 50.0,
                    child: TextField(
                      autocorrect: false,
                      decoration: InputDecoration(
                        hintText: '사업자번호',
                        //prefixIcon: Image.asset(''),
                        hintStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 14.0,
                        ),
                        filled: true,
                        fillColor: Colors.white70,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12.0)),
                          borderSide: BorderSide(
                              color: Color.fromRGBO(22, 54, 105, 1), width: 2),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide: BorderSide(color: Colors.amber, width: 4),
                        ),
                        contentPadding: EdgeInsets.fromLTRB(10.0, 10.0, 0, 0),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
                  child: Container(
                    width: double.infinity,
                    height: controller.isHeight.value,
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 2.0,
                        color: Color.fromRGBO(22, 54, 105, 1),
                      ),
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: () async {
                            await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => KpostalView(
                                  appBarColor: Color.fromRGBO(22, 54, 105, 1),
                                  titleColor: Colors.white,
                                  useLocalServer: true,
                                  localPort: 1024,
                                  //kakaoKey: '{Add your KAKAO DEVELOPERS JS KEY}',
                                  callback: (Kpostal result) {
                                    controller.postCode.value = result.postCode;
                                    controller.address.value = result.address;
                                    controller.addrStr.value =
                                        '${result.address}\n[${result.postCode}]';
                                    controller.isVisible.value = true;
                                    controller.isHeight.value = 100.0;
                                  },
                                ),
                              ),
                            );
                          },
                          child: Container(
                            child: Row(
                              children: [
                                controller.isVisible.value
                                    ? Padding(
                                        padding:
                                            const EdgeInsets.only(left: 10.0),
                                        child: Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.8,
                                          height: 46.0,
                                          alignment: Alignment.centerLeft,
                                          child: Text('${controller.addrStr}'),
                                        ),
                                      )
                                    : Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.8,
                                        height: 46.0,
                                        alignment: Alignment.centerLeft,
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(left: 10.0),
                                          child: Text(
                                            '${controller.addrStr.value}',
                                            style: const TextStyle(
                                              color: Colors.grey,
                                              fontSize: 14.0,
                                            ),
                                          ),
                                        ),
                                      ),
                                controller.isVisible.value
                                    ? Container()
                                    : Expanded(
                                        child: Container(
                                          height: 46.0,
                                          child: Icon(Icons.search_rounded),
                                        ),
                                      ),
                              ],
                            ),
                          ),
                        ),
                        Visibility(
                          visible: controller.isVisible.value,
                          maintainState: true,
                          maintainAnimation: true,
                          child: Container(
                            height: 46.0,
                            child: TextField(
                              autocorrect: false,
                              decoration: InputDecoration(
                                hintText: '상세주소',
                                //prefixIcon: Image.asset(''),
                                hintStyle: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 14.0,
                                ),
                                filled: true,
                                fillColor: Colors.white70,
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide.none),
                                focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.amber, width: 4),
                                ),
                                contentPadding:
                                    EdgeInsets.fromLTRB(10.0, 10.0, 0, 0),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
                  child: Container(
                    height: 50.0,
                    child: TextField(
                      autocorrect: false,
                      decoration: InputDecoration(
                        hintText: '사업장 전화번호',
                        //prefixIcon: Image.asset(''),
                        hintStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 14.0,
                        ),
                        filled: true,
                        fillColor: Colors.white70,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12.0)),
                          borderSide: BorderSide(
                              color: Color.fromRGBO(22, 54, 105, 1), width: 2),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide: BorderSide(color: Colors.amber, width: 4),
                        ),
                        contentPadding: EdgeInsets.fromLTRB(10.0, 10.0, 0, 0),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
                  child: Container(
                    height: 50.0,
                    child: TextField(
                      autocorrect: false,
                      decoration: InputDecoration(
                        hintText: '전화번호',
                        //prefixIcon: Image.asset(''),
                        hintStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 14.0,
                        ),
                        filled: true,
                        fillColor: Colors.white70,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12.0)),
                          borderSide: BorderSide(
                              color: Color.fromRGBO(22, 54, 105, 1), width: 2),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide: BorderSide(color: Colors.amber, width: 4),
                        ),
                        contentPadding: EdgeInsets.fromLTRB(10.0, 10.0, 0, 0),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
                  child: Container(
                    height: 50.0,
                    child: TextField(
                      autocorrect: false,
                      decoration: InputDecoration(
                        hintText: '이메일주소',
                        //prefixIcon: Image.asset(''),
                        hintStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 14.0,
                        ),
                        filled: true,
                        fillColor: Colors.white70,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12.0)),
                          borderSide: BorderSide(
                              color: Color.fromRGBO(22, 54, 105, 1), width: 2),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide: BorderSide(color: Colors.amber, width: 4),
                        ),
                        contentPadding: EdgeInsets.fromLTRB(10.0, 10.0, 0, 0),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
                  child: Container(
                    height: 50.0,
                    child: TextField(
                      autocorrect: false,
                      decoration: InputDecoration(
                        hintText: '업종',
                        //prefixIcon: Image.asset(''),
                        hintStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 14.0,
                        ),
                        filled: true,
                        fillColor: Colors.white70,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12.0)),
                          borderSide: BorderSide(
                              color: Color.fromRGBO(22, 54, 105, 1), width: 2),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide: BorderSide(color: Colors.amber, width: 4),
                        ),
                        contentPadding: EdgeInsets.fromLTRB(10.0, 10.0, 0, 0),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
                  child: Container(
                    height: 50.0,
                    child: TextField(
                      autocorrect: false,
                      decoration: InputDecoration(
                        hintText: '판매상품',
                        //prefixIcon: Image.asset(''),
                        hintStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 14.0,
                        ),
                        filled: true,
                        fillColor: Colors.white70,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12.0)),
                          borderSide: BorderSide(
                              color: Color.fromRGBO(22, 54, 105, 1), width: 2),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide: BorderSide(color: Colors.amber, width: 4),
                        ),
                        contentPadding: EdgeInsets.fromLTRB(10.0, 10.0, 0, 0),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Container(
                  child: CheckboxListTile(
                      controlAffinity: ListTileControlAffinity.leading,
                      value: false,
                      title: const Text('모두 동의합니다.'),
                      onChanged: (bool? val) {}),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
                  child: Container(
                    height: 140.0,
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 1.0,
                        color: Colors.black45,
                      ),
                    ),
                    child: Column(
                      children: [
                        Container(
                          child: CheckboxListTile(
                              controlAffinity: ListTileControlAffinity.leading,
                              contentPadding: EdgeInsets.zero,
                              value: false,
                              title: const Text(
                                '[필수] 결제서비스 이용약관 동의',
                                style: TextStyle(
                                  fontSize: 13.0,
                                ),
                              ),
                              secondary: Icon(Icons.arrow_forward_ios_rounded),
                              onChanged: (bool? val) {}),
                        ),
                        Container(
                          child: CheckboxListTile(
                              controlAffinity: ListTileControlAffinity.leading,
                              contentPadding: EdgeInsets.zero,
                              value: false,
                              title: const Text(
                                '[필수] 개인정보 수집 및 이용 동의',
                                style: TextStyle(
                                  fontSize: 13.0,
                                ),
                              ),
                              secondary: Icon(Icons.arrow_forward_ios_rounded),
                              onChanged: (bool? val) {}),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
                  child: Container(
                    height: 40.0,
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(22, 54, 105, 1),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: const Center(
                      child: Text(
                        '가입신청',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 50.0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showModalPopUp(context, type) {
    showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) => CupertinoActionSheet(
        //title: const Text(''),
        //message: const Text('message'),
        actions: [
          CupertinoActionSheetAction(
            onPressed: () {
              Get.back();
              controller.shotImageFromGallery(type: type);
            },
            child: const Text('사진보관함'),
          ),
          CupertinoActionSheetAction(
              onPressed: () {
                Get.back();
                controller.shotImageFromCamera(type: type);
              },
              child: const Text('사진촬영')),
        ],
        cancelButton: CupertinoActionSheetAction(
            onPressed: () {
              Get.back();
            },
            child: const Text('취소')),
      ),
    );
  }
}
