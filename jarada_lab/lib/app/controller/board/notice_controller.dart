import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jarada_lab/app/data/repository/board/notice_repositry.dart';
import 'package:jarada_lab/app/data/model/board/notice_model.dart';
import 'package:jarada_lab/app/routes/app_pages.dart';

class NoticeController extends GetxController {
  final NoticeRepository? noticeRepository;

  var isLoading = false.obs;
  var hasMore = false.obs;
  var noticeScrollController = ScrollController().obs;
  //String? searchKey;

  NoticeController({@required this.noticeRepository})
      : assert(noticeRepository != null);

  @override
  void onInit() {
    super.onInit();

    getNoticeList();
    _scrollEvent();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();

    _noticeList.clear();
    noticeScrollController.close();
  }

  final _noticeList = <NoticeModel>[].obs;
  get noticeList => this._noticeList.value;
  set noticeList(value) => this._noticeList.value = value;

  final _post = NoticeModel().obs;
  get post => this._post.value;
  set post(value) => this._post.value = value;

  void _scrollEvent() {
    /*
    this.noticeScrollController.value.addListener(() {
      if (this.noticeScrollController.value.position.pixels ==
          this.noticeScrollController.value.position.maxScrollExtent) {
        print(noticeScrollController);
      }
    });
    */

    noticeScrollController.value.addListener(() {
      if (noticeScrollController.value.position.pixels ==
              noticeScrollController.value.position.maxScrollExtent &&
          this.hasMore.value) {
        int pageNum = _noticeList.length + 1;
        getNoticeList(num: pageNum);
      }
    });
  }

  void getNoticeList({int? num, String? searchKey}) async {
    if (searchKey != null) {
      _noticeList.clear();
    }

    isLoading.value = true;

    noticeRepository
        ?.getNoticeList(num: num, searchKey: searchKey)
        .then((data) {
      if (data.length == 0) hasMore.value = false;
      _noticeList.addAll(data);
    });

    isLoading.value = false;

    print("??? ${_noticeList.length} ???");
    // if (noticeList.length < 9) {
    //   hasMore.value = false;
    // } else {
    hasMore.value = this.noticeList.length < this.noticeList.length + 1;
    // }

    //print("----${isLoading.value}----");
    print("----${hasMore.value}----");
  }

  void getPost(post) {
    this.post = post;

    Get.toNamed(Routes.notice_detail);
  }
}
