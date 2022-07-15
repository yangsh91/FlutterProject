import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:maltaja/app/controller/home/guide_list_controller.dart';
import 'package:maltaja/app/routes/app_pages.dart';

class GuideList extends GetView<GuideListController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '가이드',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        toolbarHeight: 40.0,
      ),
      body: ListView.separated(
        shrinkWrap: true,
        itemCount: controller.guideList.length,
        itemBuilder: (_, index) {
          if (controller.isLoading == true) {
            EasyLoading.show(
                status: '로딩중...', maskType: EasyLoadingMaskType.custom);
          }

          if (index < controller.guideList.length) {
            return ListTile(
              onTap: () => Get.toNamed(Routes.GUIDE_DETAIL),
              title: Text(controller.guideList[index]['subject']),
            );
          }

          return const Center(
            child: Text('마지막 데이터 입니다.'),
          );
        },
        separatorBuilder: (_, index) => Divider(),
      ),
    );
  }
}
