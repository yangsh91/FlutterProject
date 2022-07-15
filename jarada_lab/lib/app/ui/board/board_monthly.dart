import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jarada_lab/app/controller/board/board_monthly_controller.dart';
import 'package:jarada_lab/app/routes/app_pages.dart';
import 'package:jarada_lab/app/ui/home/home.dart';
import 'package:jarada_lab/app/ui/widget/side_menu.dart';

class BoardMonthly extends GetView<BoardMonthlyController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(26, 28, 28, 1),
        iconTheme: IconThemeData(
          color: Colors.yellow,
        ),
        toolbarHeight: 50.0,
        leading: GestureDetector(
          onTap: () => Get.back(),
          child: const Icon(
            Icons.arrow_back_ios_new_outlined,
            color: Colors.yellow,
          ),
        ),
        centerTitle: false,
        title: GestureDetector(
          //onTap: () => Get.offAll(Home()),
          child: Container(
            alignment: Alignment.center,
            width: 100.0,
            child: Image.asset(
              'assets/images/logo.png',
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
      endDrawer: SideMenu(),
      body: Obx(
        () => Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    width: double.infinity,
                    height: 50.0,
                    alignment: Alignment.centerLeft,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          '이달의 연구작',
                          style: TextStyle(
                            fontSize: 28.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Container(
                          width: 80.0,
                          height: 30.0,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade300,
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: const Text(
                            '슬라이드쇼',
                            style: TextStyle(
                              fontSize: 13.0,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
                  child: Container(
                    width: double.infinity,
                    height: 100.0,
                    child: Image.network(
                      '${baseUri}/upload/banner/paka-tube.png',
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                GridView.builder(
                  controller: controller.monthlyScrollController.value,
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisExtent: 150,
                  ),
                  itemCount: controller.monthlyList.length,
                  itemBuilder: (BuildContext context, int index) {
                    String uri =
                        '${baseUri}${controller.monthlyList[index].b_img}';

                    if (controller.monthlyList[index].b_img == null) {
                      return Card(
                        child: Container(
                          color: Colors.grey,
                          child: Image.network(
                            'http://yangsh.site/upload/no-image.jpeg',
                            fit: BoxFit.fill,
                          ),
                        ),
                      );
                    } else {
                      return Card(
                        child: Container(
                          color: Colors.grey,
                          child: Image.network(
                            '${baseUri}${controller.monthlyList[index].b_img}',
                            fit: BoxFit.fill,
                          ),
                        ),
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
