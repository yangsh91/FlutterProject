import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:jarada_lab/app/controller/board/notice_controller.dart';
import 'package:jarada_lab/app/controller/board/notice_detail_controller.dart';
import 'package:jarada_lab/app/ui/widget/side_menu.dart';

class NoticeDetail extends GetView<NoticeDetailController> {
  const NoticeDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(26, 28, 28, 1),
        iconTheme: const IconThemeData(
          color: Colors.yellow,
        ),
        toolbarHeight: 50.0,
        centerTitle: true,
        leading: GestureDetector(
          onTap: () => Get.back(),
          child: const Icon(
            Icons.arrow_back_ios_new_outlined,
            color: Colors.yellow,
          ),
        ),
        title: Container(
          alignment: Alignment.center,
          width: 100.0,
          child: Image.asset(
            'assets/images/logo.png',
            fit: BoxFit.contain,
          ),
        ),
      ),
      endDrawer: SideMenu(),
      body: SingleChildScrollView(
        child: GetX<NoticeDetailController>(
          builder: (_) {
            _.post = Get.find<NoticeController>().post;
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 0),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 70,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      border: Border.all(
                        width: 1.5,
                        color: Colors.grey.shade400,
                      ),
                      borderRadius: BorderRadius.circular(
                        5.0,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            '${_.post.subject}',
                            style: const TextStyle(
                              fontSize: 22.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                '${_.post.nickname} | ${_.post.insert_dt}',
                                style: const TextStyle(
                                  fontSize: 12.0,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15.0,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 0),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.65,
                    child: Text('${_.post.contents}'),
                  ),
                ),
              ],
            );
          },
        ),
      ),
      bottomNavigationBar: GestureDetector(
        onTap: () => Get.back(),
        child: Container(
          height: 60.0,
          color: const Color.fromRGBO(26, 28, 28, 1),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.menu_rounded,
                color: Colors.yellow,
              ),
              Text(
                '목록으로',
                style: TextStyle(
                  color: Colors.yellow,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
