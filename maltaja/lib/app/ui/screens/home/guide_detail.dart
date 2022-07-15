import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:html/dom.dart' as dom;
import 'package:maltaja/app/controller/home/guide_detail_controller.dart';

class GuideDetail extends GetView<GuideDetailController> {
  final CarouselController _controller = CarouselController();

  @override
  final GuideDetailController controller = Get.put(GuideDetailController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        title: Text(
          '가이드 상세',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        toolbarHeight: 40.0,
        backgroundColor: Colors.white,
      ),
      body: Obx(
        () => SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                height: 400.0,
                child: CarouselSlider(
                  carouselController: _controller,
                  options: CarouselOptions(
                      height: 400.0,
                      enableInfiniteScroll: false,
                      enlargeCenterPage: false,
                      aspectRatio: 2.0,
                      viewportFraction: 1,
                      onPageChanged: (index, reason) {
                        controller.imgChanged(index);
                      }),
                  items: controller.imgList.map((e) {
                    return Container(
                      child: ClipRRect(
                        child: Stack(
                          children: [
                            Image(
                              image: AssetImage(e),
                              fit: BoxFit.cover,
                              width: 1000.0,
                              height: MediaQuery.of(context).size.height,
                            ),
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
              SizedBox(
                height: 3.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: controller.imgList.asMap().entries.map((e) {
                  return Container(
                    width: 10.0,
                    height: 10.0,
                    margin:
                        EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: (Theme.of(context).brightness == Brightness.dark
                              ? Colors.white
                              : Colors.blue)
                          .withOpacity(controller.paging == e.key ? 1 : 0.2),
                    ),
                  );
                }).toList(),
              ),
              SizedBox(
                height: 10.0,
              ),
              Container(
                padding: EdgeInsets.all(12.0),
                child: Html(
                  data: "${controller.contents}",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
