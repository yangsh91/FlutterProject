import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jarada_lab/app/controller/user/login_controller.dart';
import 'package:jarada_lab/app/data/repository/board/board_repository.dart';
import 'package:jarada_lab/app/ui/board/board_write.dart';
import 'package:textfield_tags/textfield_tags.dart';

class BoardWriteController extends GetxController {
  final BoardRepository? boardRepository;

  BoardWriteController({@required this.boardRepository})
      : assert(boardRepository != null);

  late final ImagePicker picker;
  late List<XFile> _pickedImgs;
  late RxList<XFile> pickedImgs;
  late List<dynamic> materialList;
  late TextfieldTagsController tags;
  var subject = ''.obs;
  var age = ''.obs;

  RxBool isVisible = false.obs;

  late TextEditingController explain1, explain2, explain3, explain4;

  @override
  void onInit() {
    super.onInit();
    picker = ImagePicker();
    _pickedImgs = [];
    pickedImgs = RxList();
    tags = TextfieldTagsController();
    materialList = [];
    explain1 = TextEditingController();
    explain2 = TextEditingController();
    explain3 = TextEditingController();
    explain4 = TextEditingController();
  }

  @override
  void onClose() {
    super.onClose();
    print("close close..");
    pickedImgs.clear();
    materialList.clear();
  }

  @override
  void onReady() {
    super.onReady();
  }

  // 이미지 선택
  Future<void> pickImg(context) async {
    final List<XFile>? images = await picker.pickMultiImage();
    if (images != null) {
      if (images.length > 4) {
        _showSnackBar(context, '이미지는 4장이상 등록할 수 없습니다');
        return;
      } else {
        _pickedImgs = images;
        pickedImgs.addAll(images);
      }
    }
  }

  void showWidget() {
    if (isVisible == true) {
      isVisible.value = false;
    } else {
      isVisible.value = true;
    }
  }

  Future<void> goActBoardWrite(context) async {
    try {
      var explain = [
        {'explain1': explain1.text},
        {'explain2': explain2.text},
        {'explain3': explain3.text},
        {'explain4': explain4.text}
      ];

      String user_id =
          Get.find<LoginController>().loginData.get('id').toString();

      if (user_id.isEmpty) {
        _showSnackBar(context, '유저 정보가 존재하지 않습니다');
        return;
      }

      if (subject.value.isEmpty) {
        _showSnackBar(context, '주제를 선택해 주세요.');
        return;
      }

      var material = [];

      materialList.map((e) => material.add(e.id)).toList();

      boardRepository
          ?.goActBoardWrite(
        user_id: user_id,
        subject: subject.value,
        age: age.value,
        materialList: material,
        imageList: _pickedImgs,
        explain: explain,
      )
          .then((data) {
        if (data['success'] == '0000') {
          Get.back();
        }
      });
    } catch (_) {
      _.toString();
    }
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
