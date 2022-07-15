import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jarada_lab/app/data/repository/user/myhome_repository.dart';
import 'package:jarada_lab/app/data/model/board/notice_model.dart';

class MyHomeController extends GetxController {
  final MyHomeRepository? myHomeRepository;

  MyHomeController({@required this.myHomeRepository})
      : assert(myHomeRepository != null);

  @override
  void onInit() {
    super.onInit();

    getNoticeList();
  }

  @override
  void onClose() {
    super.onClose();
  }

  final _noticeList = <NoticeModel>[].obs;
  get noticeList => this._noticeList.value;
  set noticeList(value) => this._noticeList.value = value;

  void getNoticeList() async {
    myHomeRepository?.getNoticeList().then((data) {
      _noticeList.addAll(data);
    });
  }
}
