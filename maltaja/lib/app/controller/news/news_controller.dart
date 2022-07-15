import 'package:get/get.dart';
import 'package:maltaja/app/ui/screens/news/news_list.dart';

class NewsController extends GetxController {
  //final NewsController controller = Get.put(NewsController());
  //static NewsController get to => Get.find();
  //static NewsController controller = Get.find().obs;

  String con = 'fafafa';

  final List<dynamic> list = [
    {
      "type": "list",
      "title": "뉴스피드",
      "data": [
        {
          "id": "1",
          "subject": "승마소식1",
          "img": "assets/images/specialweek.png",
          "date": "2022-01-01 19:56:55"
        },
        {
          "id": "2",
          "subject": "승마소식2",
          "img": "assets/images/specialweek.png",
          "date": "2022-01-02 19:56:55"
        },
        {
          "id": "3",
          "subject": "승마소식3",
          "img": "assets/images/specialweek.png",
          "date": "2022-01-03 19:56:55"
        },
        {
          "id": "4",
          "subject": "승마소식4",
          "img": "assets/images/specialweek.png",
          "date": "2022-01-04 19:56:55"
        },
        {
          "id": "5",
          "subject": "승마소식5",
          "img": "assets/images/specialweek.png",
          "date": "2022-01-05 19:56:55"
        },
        {
          "id": "6",
          "subject": "승마소식6",
          "img": "assets/images/specialweek.png",
          "date": "2022-01-06 19:56:55"
        },
        {
          "id": "7",
          "subject": "승마소식7",
          "img": "assets/images/specialweek.png",
          "date": "2022-01-07 19:56:55"
        },
        {
          "id": "8",
          "subject": "승마소식8",
          "img": "assets/images/specialweek.png",
          "date": "2022-01-08 19:56:55"
        },
        {
          "id": "9",
          "subject": "승마소식9",
          "img": "assets/images/specialweek.png",
          "date": "2022-01-09 19:56:55"
        },
        {
          "id": "10",
          "subject": "승마소식10",
          "img": "assets/images/specialweek.png",
          "date": "2022-01-10 19:56:55"
        },
        {
          "id": "11",
          "subject": "승마소식11",
          "img": "assets/images/specialweek.png",
          "date": "2022-01-11 19:56:55"
        }
      ]
    }
  ].obs;

  List<Map<String, dynamic>> newsList = [];

  @override
  void onInit() {
    getList();

    super.onInit();
  }

  void getList() {
    this.newsList = list[0]['data'];
    //print("...$newsList");
  }
}
