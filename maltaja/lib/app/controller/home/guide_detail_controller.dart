import 'package:get/get.dart';

class GuideDetailController extends GetxController {
  List<dynamic> detailList = [
    {
      "title": "가이드",
      "contents":
          "<div><h2>What is Lorem Ipsum?</h2><p><strong>Lorem Ipsum</strong> is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p></div><div><h2>What is Lorem Ipsum?</h2><p><strong>Lorem Ipsum</strong> is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p></div>",
      "image": [
        'assets/images/horsehouse2.jpg',
        'assets/images/horsehouse2.jpg',
        'assets/images/horsehouse2.jpg',
      ]
    },
    {
      "title": "가이드",
      "contents":
          "<div><h2>What is Lorem Ipsum?</h2><p><strong>Lorem Ipsum</strong> is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p></div>",
      "image": [
        'assets/images/horsehouse2.jpg',
        'assets/images/horsehouse2.jpg',
        'assets/images/horsehouse2.jpg',
      ]
    },
    {
      "title": "가이드",
      "contents":
          "<div><h2>What is Lorem Ipsum?</h2><p><strong>Lorem Ipsum</strong> is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p></div>",
      "image": [
        {'assets/images/horsehouse2.jpg'},
        {'assets/images/horsehouse2.jpg'},
        {'assets/images/horsehouse2.jpg'},
      ]
    },
    {
      "title": "가이드",
      "contents":
          "<div><h2>What is Lorem Ipsum?</h2><p><strong>Lorem Ipsum</strong> is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p></div>",
      "image": [
        'assets/images/horsehouse2.jpg',
        'assets/images/horsehouse2.jpg',
        'assets/images/horsehouse2.jpg',
      ]
    },
    {
      "title": "가이드",
      "contents":
          "<div><h2>What is Lorem Ipsum?</h2><p><strong>Lorem Ipsum</strong> is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p></div>",
      "image": [
        'assets/images/horsehouse2.jpg',
        'assets/images/horsehouse2.jpg',
        'assets/images/horsehouse2.jpg',
      ]
    },
  ].obs;

  List<String> imgList = [];
  String contents = '';
  var paging = 0.obs;

  @override
  void onInit() {
    contents = detailList[0]['contents'].toString();
    imgList = detailList[0]['image'];

    super.onInit();
  }

  void imgChanged(int no) {
    paging.value = no;

    print("paging : $paging");
  }
}
