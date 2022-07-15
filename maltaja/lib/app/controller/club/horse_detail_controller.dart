import 'package:get/get.dart';

class HorseDetailController extends GetxController {
  final Map<String, dynamic> info = {
    "id": "1",
    "name": "골드쉽",
    "sex": "male",
    "type": "더러브렛",
    "use": "승용",
    "birth": "2009-03-06",
    "nation": "일본",
    "picture": "assets/images/goldship.png",
  };

  @override
  void onInit() {
    super.onInit();
  }
}
