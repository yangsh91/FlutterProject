import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:paynuri/app/data/repository/user/user_repository.dart';

class JoinController extends GetxController {
  final UserRepository? userRepository;

  var selectBizImagePath = ''.obs;
  var selectIdImagePath = ''.obs;

  late TextEditingController store_nm, master, biz_num, address_dtl;

  late RxString postCode, address; // 우편번호, 주소
  late RxDouble isHeight;
  late RxBool isCheck;
  late RxBool isVisible;
  late RxString addrStr;

  JoinController({required this.userRepository})
      : assert(userRepository != null);

  @override
  void onInit() {
    super.onInit();

    // pickedImgs = RxList();

    store_nm = TextEditingController();
    master = TextEditingController();
    biz_num = TextEditingController();
    address_dtl = TextEditingController();

    postCode = ''.obs;
    address = ''.obs;

    isHeight = 50.0.obs;
    isCheck = false.obs;
    isVisible = false.obs;
    addrStr = '사업장주소'.obs;
  }

  @override
  void onClose() {
    super.onClose();

    selectBizImagePath.value = '';
    selectIdImagePath.value = '';
  }

  Future<void> shotImageFromGallery({required type}) async {
    final pickedFile =
        await ImagePicker.platform.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      print(pickedFile.path);
      if (type == 'biz') {
        selectBizImagePath.value = pickedFile.path;
      } else if (type == 'id') {
        selectIdImagePath.value = pickedFile.path;
      }
    }
  }

  Future<void> shotImageFromCamera({required type}) async {
    final pickedFile =
        await ImagePicker.platform.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      if (type == 'biz') {
        selectBizImagePath.value = pickedFile.path;
      } else if (type == 'id') {
        selectIdImagePath.value = pickedFile.path;
      }
    }
  }
}
