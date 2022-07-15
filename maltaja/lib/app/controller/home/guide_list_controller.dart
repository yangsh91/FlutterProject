import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:maltaja/app/ui/widget/custom_animation.dart';

class GuideListController extends GetxController {
  //final GuideListController controller = Get.find().obs;
  bool isLoading = true;

  final List<dynamic> list = [
    {
      "title": "승마상식",
      "data": [
        {"id": "1", "subject": "승마 상식1"},
        {"id": "2", "subject": "승마 상식2"},
        {"id": "3", "subject": "승마 상식3"},
        {"id": "4", "subject": "승마 상식4"},
        {"id": "5", "subject": "승마 상식5"},
        {"id": "6", "subject": "승마 상식6"},
        {"id": "7", "subject": "승마 상식7"},
        {"id": "8", "subject": "승마 상식8"},
        {"id": "9", "subject": "승마 상식9"},
        {"id": "10", "subject": "승마 상식10"},
        {"id": "11", "subject": "승마 상식11"}
      ]
    },
    {
      "title": "승마 즐기기",
      "data": [
        {"id": "1", "subject": "승마 즐기기1"},
        {"id": "2", "subject": "승마 즐기기2"},
        {"id": "3", "subject": "승마 즐기기3"},
        {"id": "4", "subject": "승마 즐기기4"},
        {"id": "5", "subject": "승마 즐기기5"},
        {"id": "6", "subject": "승마 즐기기6"},
        {"id": "7", "subject": "승마 즐기기7"},
        {"id": "8", "subject": "승마 즐기기8"},
        {"id": "9", "subject": "승마 즐기기9"},
        {"id": "10", "subject": "승마 즐기기10"},
        {"id": "11", "subject": "승마 즐기기11"}
      ]
    },
    {
      "title": "기승법 기초",
      "data": [
        {"id": "1", "subject": "승마 기초1"},
        {"id": "2", "subject": "승마 기초2"},
        {"id": "3", "subject": "승마 기초3"},
        {"id": "4", "subject": "승마 기초4"},
        {"id": "5", "subject": "승마 기초5"},
        {"id": "6", "subject": "승마 기초6"},
        {"id": "7", "subject": "승마 기초7"},
        {"id": "8", "subject": "승마 기초8"},
        {"id": "9", "subject": "승마 기초9"},
        {"id": "10", "subject": "승마 기초10"},
        {"id": "11", "subject": "승마 기초11"}
      ]
    },
    {
      "title": "말과 친해지기",
      "data": [
        {"id": "1", "subject": "말과 친해지기1"},
        {"id": "2", "subject": "말과 친해지기2"},
        {"id": "3", "subject": "말과 친해지기3"},
        {"id": "4", "subject": "말과 친해지기4"},
        {"id": "5", "subject": "말과 친해지기5"},
        {"id": "6", "subject": "말과 친해지기6"},
        {"id": "7", "subject": "말과 친해지기7"},
        {"id": "8", "subject": "말과 친해지기8"},
        {"id": "9", "subject": "말과 친해지기9"},
        {"id": "10", "subject": "말과 친해지기10"},
        {"id": "11", "subject": "말과 친해지기11"}
      ]
    },
    {
      "title": "승마장비",
      "data": [
        {"id": "1", "subject": "승마장비1"},
        {"id": "2", "subject": "승마장비2"},
        {"id": "3", "subject": "승마장비3"},
        {"id": "4", "subject": "승마장비4"},
        {"id": "5", "subject": "승마장비5"},
        {"id": "6", "subject": "승마장비6"},
        {"id": "7", "subject": "승마장비7"},
        {"id": "8", "subject": "승마장비8"},
        {"id": "9", "subject": "승마장비9"},
        {"id": "10", "subject": "승마장비10"},
        {"id": "11", "subject": "승마장비11"}
      ]
    },
    {
      "title": "고급 승마상식",
      "data": [
        {"id": "1", "subject": "고급승마 상식1"},
        {"id": "2", "subject": "고급승마 상식2"},
        {"id": "3", "subject": "고급승마 상식3"},
        {"id": "4", "subject": "고급승마 상식4"},
        {"id": "5", "subject": "고급승마 상식5"},
        {"id": "6", "subject": "고급승마 상식6"},
        {"id": "7", "subject": "고급승마 상식7"},
        {"id": "8", "subject": "고급승마 상식8"},
        {"id": "9", "subject": "고급승마 상식9"},
        {"id": "10", "subject": "고급승마 상식10"},
        {"id": "11", "subject": "고급승마 상식11"}
      ]
    }
  ].obs;

  int no = Get.arguments['id'];
  String title = '';
  List<Map<String, dynamic>> guideList = [];

  @override
  void onInit() async {
    configLoading();

    print(isLoading);
    listOn();
    await Future.delayed(const Duration(seconds: 1));
    isLoading = false;

    print(isLoading);
    EasyLoading.showSuccess('');
    EasyLoading.addStatusCallback(statusCallback);
    super.onInit();
  }

  @override
  void onClose() {
    EasyLoading.dismiss();
    EasyLoading.removeCallback(statusCallback);
    super.onClose();
  }

  void configLoading() {
    EasyLoading.instance
      ..displayDuration = const Duration(milliseconds: 2000)
      ..indicatorType = EasyLoadingIndicatorType.wave
      ..loadingStyle = EasyLoadingStyle.dark
      ..indicatorSize = 45.0
      ..radius = 15.0
      // ..progressColor = Colors.yellow
      // ..backgroundColor = Colors.green
      // ..indicatorColor = Colors.yellow
      // ..textColor = Colors.yellow
      ..maskColor = Colors.black.withOpacity(0.5)
      ..userInteractions = true
      ..customAnimation = CustomAnimation();
  }

  void statusCallback(EasyLoadingStatus status) {
    print('Test EasyLoading Status $status');
  }

  void listOn() async {
    title = list[no]['title'].toString();
    guideList = list[no]['data'];
  }
}
