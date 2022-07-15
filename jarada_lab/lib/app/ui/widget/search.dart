import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jarada_lab/app/controller/board/notice_controller.dart';
import 'package:jarada_lab/app/controller/user/mypage_controller.dart';
import 'package:jarada_lab/app/controller/widget/search_controller.dart';
import 'package:jarada_lab/app/routes/app_pages.dart';

class Search extends GetView<SearchController> {
  const Search({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: Colors.grey.shade200,
        appBar: AppBar(
          backgroundColor: const Color.fromRGBO(26, 28, 28, 1),
          iconTheme: const IconThemeData(
            color: Colors.yellow,
          ),
          //toolbarHeight: 50.0,
          centerTitle: false,
          title: TextField(
            onSubmitted: (key) {
              //controller.submitSearch(key);
              Get.find<NoticeController>().getNoticeList(searchKey: key);
              Get.find<MyPageController>().widgetChanged(1);
              Get.back();
              // Get.toNamed(Routes.mypage, arguments: 1);
            },
            style: const TextStyle(
              color: Colors.white,
            ),
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.grey.withOpacity(0.2),
            ),
            textInputAction: TextInputAction.search,
          ),
        ),
      ),
    );
  }
}
