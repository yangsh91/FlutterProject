import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jarada_lab/app/data/model/board/board_model.dart';
import 'package:jarada_lab/app/data/repository/board/board_repository.dart';

const String baseUri = 'http://yangsh.site';

class BoardMonthlyController extends GetxController {
  final BoardRepository? boardRepository;

  BoardMonthlyController({this.boardRepository})
      : assert(boardRepository != null);

  var isLoading = false.obs;
  var hasMore = false.obs;
  var monthlyScrollController = ScrollController().obs;

  @override
  void onInit() {
    super.onInit();

    getBoardMonthlyList();
    _scrollEvent();
  }

  @override
  void onClose() {
    super.onClose();

    _monthlyList.clear();
    monthlyScrollController.close();
  }

  final _monthlyList = <BoardModel>[].obs;
  get monthlyList => this._monthlyList.value;
  set monthlyList(value) => this._monthlyList.value = value;

  void _scrollEvent() {
    monthlyScrollController.value.addListener(() {
      if (monthlyScrollController.value.position.pixels ==
              monthlyScrollController.value.position.maxScrollExtent &&
          this.hasMore.value) {
        int pageNum = _monthlyList.length + 1;
        getBoardMonthlyList(num: pageNum);
      }
    });
  }

  getBoardMonthlyList({int? num, String? searchKey}) async {
    isLoading.value = true;

    boardRepository
        ?.getBoardMonthlyList(num: num, searchKey: searchKey)
        .then((data) {
      if (data.length == 0) hasMore.value = false;
      print(data);
      _monthlyList.addAll(data);
    });

    isLoading.value = false;
    hasMore.value = this.monthlyList.length < this.monthlyList.length + 1;
  }
}
