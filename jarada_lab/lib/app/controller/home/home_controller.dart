import 'package:get/get.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomeController extends GetxController {
  RxInt _current = 0.obs;

  final CarouselController carouseController = CarouselController();

  final List<String> imgList = [
    'assets/images/zootopia1.png',
    'assets/images/zootopia2.jpeg',
    'assets/images/zootopia3.jpeg',
    'assets/images/zootopia4.png',
    'assets/images/jolyne1.png',
    'assets/images/jolyne2.jpeg',
    'assets/images/jolyne3.jpeg',
    'assets/images/jolyne4.jpeg',
  ].obs;

  final List<String> gridViewList = [
    'assets/images/art1.jpeg',
    'assets/images/art2.jpeg',
    'assets/images/art3.jpeg',
    'assets/images/art4.jpeg',
    'assets/images/art5.jpeg',
    'assets/images/art6.jpeg',
    'assets/images/art7.jpeg',
    'assets/images/art8.jpeg',
    'assets/images/art9.jpeg',
    'assets/images/art10.jpeg',
    'assets/images/art11.jpeg',
    'assets/images/art12.jpeg',
  ];

  @override
  void onInit() {
    super.onInit();

    print("Home Controller");
  }

  var paging = 0.obs;

  void imgChanging(int no) {
    paging.value = no;
  }
}
