import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';
import 'package:maltaja/app/data/model/home/home_model.dart';

class HomeController extends GetxController {
  RxInt _current = 0.obs;

  final CarouselController carouseController = CarouselController();

  final List<String> imgList = [
    //'assets/images/nezuko.jpeg',
    'assets/images/horsehouse2.jpg',
    'assets/images/horsehouse2.jpg',
    'assets/images/horsehouse2.jpg',
    'assets/images/horsehouse2.jpg',
  ].obs;

  final List<dynamic> noticeList = [
    {
      "data": [
        {"id": "1", "subject": "승마장 안전수칙1", "date": "2022-01-01 19:56:55"},
        {"id": "2", "subject": "승마장 \b오시는 길1", "date": "2022-01-02 19:56:55"},
        {"id": "3", "subject": "승마장 영업시간1", "date": "2022-01-03 19:56:55"},
        {"id": "4", "subject": "승마장 코로나 수칙1", "date": "2022-01-04 19:56:55"}
      ]
    },
    {
      "data": [
        {"id": "5", "subject": "승마장 안전수칙2", "date": "2022-01-01 19:56:55"},
        {"id": "6", "subject": "승마장 \b오시는 길2", "date": "2022-01-02 19:56:55"},
        {"id": "7", "subject": "승마장 영업시간2", "date": "2022-01-03 19:56:55"},
        {"id": "8", "subject": "승마장 코로나 수칙2", "date": "2022-01-04 19:56:55"}
      ]
    },
    {
      "data": [
        {"id": "9", "subject": "승마장 안전수칙3", "date": "2022-01-01 19:56:55"},
        {"id": "10", "subject": "승마장 \b오시는 길3", "date": "2022-01-02 19:56:55"},
        {"id": "11", "subject": "승마장 영업시간3", "date": "2022-01-03 19:56:55"},
      ]
    },
    {
      "data": [
        {"id": "13", "subject": "승마장 안전수칙4", "date": "2022-01-01 19:56:55"},
        {"id": "14", "subject": "승마장 \b오시는 길4", "date": "2022-01-02 19:56:55"},
        {"id": "15", "subject": "승마장 영업시간4", "date": "2022-01-03 19:56:55"},
        {"id": "16", "subject": "승마장 코로나 수칙4", "date": "2022-01-04 19:56:55"}
      ]
    },
  ].obs;

  List<Map<String, dynamic>> guideList = [];
  var paging = 0.obs;

  @override
  void onInit() {
    noticeChanged(paging.toInt());
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  void noticeChanged(int no) {
    paging.value = no;
    guideList = noticeList[paging.toInt()]['data'];
  }
}
