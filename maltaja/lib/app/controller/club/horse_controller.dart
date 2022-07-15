import 'package:get/get.dart';

class HorseController extends GetxController {
  final List<dynamic> list = [
    {
      "type": "list",
      "title": "뉴스피드",
      "data": [
        {
          "id": "1",
          "name": "골드쉽",
          "sex": "male",
          "type": "더러브렛",
          "use": "승용",
          "birth": "2009-03-06",
          "nation": "일본",
          "picture": "assets/images/goldship.png",
        },
        {
          "id": "2",
          "name": "골드쉽",
          "sex": "male",
          "type": "더러브렛",
          "use": "승용",
          "birth": "2009-03-06",
          "nation": "일본",
          "picture": "assets/images/goldship.png",
        },
        {
          "id": "3",
          "name": "골드쉽",
          "sex": "male",
          "type": "더러브렛",
          "use": "승용",
          "birth": "2009-03-06",
          "nation": "일본",
          "picture": "assets/images/goldship.png",
        },
        {
          "id": "4",
          "name": "골드쉽",
          "sex": "male",
          "type": "더러브렛",
          "use": "승용",
          "birth": "2009-03-06",
          "nation": "일본",
          "picture": "assets/images/goldship.png",
        },
        {
          "id": "5",
          "name": "골드쉽",
          "sex": "male",
          "type": "더러브렛",
          "use": "승용",
          "birth": "2009-03-06",
          "nation": "일본",
          "picture": "assets/images/goldship.png",
        },
        {
          "id": "6",
          "name": "골드쉽",
          "sex": "male",
          "type": "더러브렛",
          "use": "승용",
          "birth": "2009-03-06",
          "nation": "일본",
          "picture": "assets/images/goldship.png",
        },
        {
          "id": "7",
          "name": "골드쉽",
          "sex": "male",
          "type": "더러브렛",
          "use": "승용",
          "birth": "2009-03-06",
          "nation": "일본",
          "picture": "assets/images/goldship.png",
        },
        {
          "id": "8",
          "name": "골드쉽",
          "sex": "male",
          "type": "더러브렛",
          "use": "승용",
          "birth": "2009-03-06",
          "nation": "일본",
          "picture": "assets/images/goldship.png",
        },
        {
          "id": "9",
          "name": "골드쉽",
          "sex": "male",
          "type": "더러브렛",
          "use": "승용",
          "birth": "2009-03-06",
          "nation": "일본",
          "picture": "assets/images/goldship.png",
        },
        {
          "id": "10",
          "name": "골드쉽",
          "sex": "male",
          "type": "더러브렛",
          "use": "승용",
          "birth": "2009-03-06",
          "nation": "일본",
          "picture": "assets/images/goldship.png",
        },
      ],
    }
  ].obs;

  var horseTotal;
  List<Map<String, dynamic>> horseList = [];

  @override
  void onInit() {
    getList();
    super.onInit();
  }

  getList() {
    horseTotal = list[0]['data'].length;
    horseList = list[0]['data'];
  }
}
