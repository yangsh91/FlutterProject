import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lms/app/data/model/notice/notice_model.dart';
import 'package:meta/meta.dart';
import 'package:lms/app/data/repository/notice_repository.dart';

class NoticeController extends GetxController {
  var scrollController = ScrollController().obs;

  var isLoading = false.obs;
  var hasMore = false.obs;

  final NoticeRepository? repository;

  NoticeController({@required this.repository}) : assert(repository != null);

  @override
  void onInit() {
    getClear();
    getList();
    this.scrollController.value.addListener(() {
      if (this.scrollController.value.position.pixels ==
              this.scrollController.value.position.maxScrollExtent &&
          this.hasMore.value) {
        int pageNum = _postList.length + 1;
        getList(num: pageNum);
      }
    });

    super.onInit();
  }

  final _postList = <NoticeModel>[].obs;
  get postList => this._postList.value;
  set postList(value) => this._postList.value = value;

  getClear() async {
    //isLoading.value = true;
    //hasMore.value = false;
    _postList.clear();

    getList();

    //isLoading.value = false;
  }

  getList({int? num}) async {
    isLoading.value = true;

    repository?.getList(num: num).then((data) {
      if (data.length == 0) hasMore.value = false;
      print("******");
      print(data);
      print("******");
      _postList.addAll(data);
    });

    isLoading.value = false;
    hasMore.value = this.postList.length < this.postList.length + 1;
  }
}
