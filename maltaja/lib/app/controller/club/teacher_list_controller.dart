import 'package:get/get.dart';

class TeacherListController extends GetxController {
  final List<dynamic> list = [
    {
      "type": "list",
      "title": "뉴스피드",
      "data": [
        {
          "id": "1",
          "name": "김영일",
          "position": "대표",
        },
        {
          "id": "2",
          "name": "한지유",
          "position": "코치",
        },
        {
          "id": "3",
          "name": "이재성",
          "position": "코치",
        },
        {
          "id": "4",
          "name": "한왕호",
          "position": "마필관리사",
        }
      ],
    }
  ].obs;

  var total;
  List<Map<String, dynamic>> teacherList = [];

  @override
  void onInit() {
    getList();
    super.onInit();
  }

  getList() {
    total = list[0]['data'].length;
    teacherList = list[0]['data'];

    print(".... $total");
  }
}
