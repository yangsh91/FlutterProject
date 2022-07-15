import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jarada_lab/app/controller/board/notice_controller.dart';
import 'package:jarada_lab/app/routes/app_pages.dart';

class Notice extends GetView<NoticeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.55,
              child: Container(
                child: Obx(
                  () => ListView.builder(
                    controller: controller.noticeScrollController.value,
                    itemCount: controller.noticeList.length + 1,
                    itemBuilder: (BuildContext context, int index) {
                      if (index < controller.noticeList.length) {
                        return GestureDetector(
                          onTap: () =>
                              controller.getPost(controller.noticeList[index]),
                          child: Container(
                            height: 45.0,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Container(
                                  child: Text(
                                    '${controller.noticeList[index].subject}',
                                    style: TextStyle(
                                      fontSize: 16.0,
                                    ),
                                  ),
                                ),
                                Container(
                                  child: Row(
                                    children: [
                                      Text(
                                        '${controller.noticeList[index].nickname}',
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 12.0,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 5.0,
                                      ),
                                      const Text(
                                        '|',
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 12.0,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 5.0,
                                      ),
                                      Text(
                                        '${controller.noticeList[index].insert_dt}',
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 12.0,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 5.0,
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  margin:
                                      const EdgeInsets.fromLTRB(0, 5.0, 5.0, 0),
                                  height: 1.0,
                                  color: Colors.grey.withOpacity(0.6),
                                ),
                              ],
                            ),
                          ),
                        );
                      }

                      if (controller.hasMore.value ||
                          controller.isLoading.value) {
                        return Center(child: RefreshProgressIndicator());
                      }

                      return Container(
                        child: Center(
                          child: Text('데이터의 마지막 입니다.'),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.toNamed(Routes.search),
        backgroundColor: const Color.fromRGBO(26, 28, 28, 1),
        child: const Icon(
          CupertinoIcons.search,
          color: Colors.yellow,
        ),
      ),
    );
  }
}
