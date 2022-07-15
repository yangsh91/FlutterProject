import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maltaja/app/controller/home/home_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:maltaja/app/routes/app_pages.dart';

class Home extends GetView<HomeController> {
  @override
  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        title: Text(
          '말타자',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        toolbarHeight: 40.0,
        backgroundColor: Colors.white,
        actions: [
          GestureDetector(
            onTap: () => Get.toNamed(Routes.NOTI_LIST),
            child: Container(
              margin: EdgeInsets.only(right: 10.0),
              child: const Icon(CupertinoIcons.bell_solid),
            ),
          ),
        ],
      ),
      body: Obx(
        () => SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(5.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(15.0)),
                ),
                child: CarouselSlider(
                  carouselController: controller.carouseController,
                  options: CarouselOptions(
                      height: 200.0,
                      enableInfiniteScroll: false,
                      enlargeCenterPage: false,
                      aspectRatio: 2.0,
                      onPageChanged: (index, reason) {
                        controller.noticeChanged(index);
                      }),
                  items: controller.imgList.map((e) {
                    return GestureDetector(
                      onTap: () => Get.toNamed(Routes.CLUB_DETAIL),
                      child: Container(
                        margin: EdgeInsets.all(5.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(15.0),
                          ),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(15.0)),
                          child: Stack(
                            children: [
                              Image(
                                image: AssetImage(e),
                                fit: BoxFit.cover,
                              ),
                              Positioned(
                                bottom: 0,
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  height: 40.0,
                                  decoration: BoxDecoration(
                                    color: Colors.white70,
                                  ),
                                  child: Row(
                                    children: [
                                      Container(
                                        width: 30.0,
                                        height: 30.0,
                                        margin:
                                            EdgeInsets.fromLTRB(10.0, 0, 0, 0),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(100.0),
                                          border: Border.all(
                                            width: 1.0,
                                            color: Colors.grey.shade600,
                                          ),
                                        ),
                                        child: CircleAvatar(
                                          backgroundColor: Colors.white,
                                          backgroundImage: AssetImage(
                                              'assets/images/horses.png'),
                                          radius: 50.0,
                                        ),
                                      ),
                                      Expanded(
                                          child: Container(
                                        margin: EdgeInsets.only(left: 5.0),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.stretch,
                                          children: [
                                            Container(
                                              child: Text('베르아델 승마클럽'),
                                            ),
                                            Container(
                                              child: Text(
                                                '38.9km | 경기도 안산시 단원구 대부동 부흥로 376',
                                                style: TextStyle(
                                                  fontSize: 9.0,
                                                  color: Colors.grey,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ))
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
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
                height: 20.0,
                margin: EdgeInsets.only(left: 15.0),
                alignment: Alignment.centerLeft,
                child: Text('공지사항'),
              ),
              Container(
                //height: double.minPositive,
                //color: Colors.greenAccent,
                padding: EdgeInsets.all(4.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: controller.guideList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: () => Get.toNamed(
                            Routes.NOTICE_DETAIL,
                            arguments: {
                              "id": controller.guideList[index]['id']
                            },
                          ),
                          child: Container(
                            margin: EdgeInsets.all(6.0),
                            height: 40.0,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(left: 5.0, top: 5.0),
                                  child: Text(
                                    controller.guideList[index]['date']
                                        .toString(),
                                    style: TextStyle(
                                      fontSize: 11.0,
                                      color: Colors.grey.shade400,
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 5.0),
                                  child: Text(
                                      controller.guideList[index]['subject']),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Container(
                height: 20.0,
                margin: EdgeInsets.only(left: 15.0),
                alignment: Alignment.centerLeft,
                child: Text('가이드'),
              ),
              Container(
                padding: EdgeInsets.all(10.0),
                height: 450.0,
                child: Column(
                  children: <Widget>[
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: () => Get.toNamed(Routes.GUIDE_LIST,
                                  arguments: {"id": 0}),
                              child: Container(
                                margin: EdgeInsets.all(6.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15.0),
                                  image: DecorationImage(
                                      image: AssetImage(
                                        'assets/images/snow_bg.png',
                                      ),
                                      fit: BoxFit.cover),
                                ),
                                alignment: Alignment.topLeft,
                                child: Column(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(
                                          left: 15.0, top: 15.0),
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        '기승 전 알아두면 좋은',
                                        style: TextStyle(
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin:
                                          EdgeInsets.only(left: 15.0, top: 5.0),
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        '승마상식',
                                        style: TextStyle(
                                          fontSize: 28.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      alignment: Alignment.bottomRight,
                                      child: Container(
                                        width: 50.0,
                                        height: 50.0,
                                        margin: EdgeInsets.only(right: 15.0),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                          image: DecorationImage(
                                              image: AssetImage(
                                                'assets/images/open-book.png',
                                              ),
                                              fit: BoxFit.cover),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: GestureDetector(
                              onTap: () => Get.toNamed(Routes.GUIDE_LIST,
                                  arguments: {"id": 1}),
                              child: Container(
                                margin: EdgeInsets.all(6.0),
                                decoration: BoxDecoration(
                                  color: Colors.teal.shade900,
                                  borderRadius: BorderRadius.circular(15.0),
                                  image: DecorationImage(
                                    image: AssetImage(
                                      'assets/images/snow_bg.png',
                                    ),
                                    fit: BoxFit.cover,
                                    colorFilter: ColorFilter.mode(
                                        Colors.black.withOpacity(0.3),
                                        BlendMode.dstATop),
                                  ),
                                ),
                                alignment: Alignment.topLeft,
                                child: Column(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(
                                          left: 15.0, top: 15.0),
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        '즐겁고 안전한',
                                        style: TextStyle(
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin:
                                          EdgeInsets.only(left: 15.0, top: 5.0),
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        '승마 즐기기',
                                        style: TextStyle(
                                          fontSize: 28.0,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      alignment: Alignment.bottomRight,
                                      child: Container(
                                        width: 50.0,
                                        height: 50.0,
                                        margin: EdgeInsets.only(right: 15.0),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                          image: DecorationImage(
                                              image: AssetImage(
                                                'assets/images/helmet.png',
                                              ),
                                              fit: BoxFit.cover),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: () => Get.toNamed(Routes.GUIDE_LIST,
                                  arguments: {"id": 2}),
                              child: Container(
                                margin: EdgeInsets.all(6.0),
                                decoration: BoxDecoration(
                                  color: Colors.red.shade400,
                                  borderRadius: BorderRadius.circular(15.0),
                                  image: DecorationImage(
                                    image: AssetImage(
                                      'assets/images/snow_bg.png',
                                    ),
                                    fit: BoxFit.cover,
                                    colorFilter: ColorFilter.mode(
                                        Colors.black.withOpacity(0.3),
                                        BlendMode.dstATop),
                                  ),
                                ),
                                alignment: Alignment.topLeft,
                                child: Column(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(
                                          left: 15.0, top: 15.0),
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        '기승법 기초에 대한',
                                        style: TextStyle(
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin:
                                          EdgeInsets.only(left: 15.0, top: 5.0),
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        '모든 것',
                                        style: TextStyle(
                                          fontSize: 28.0,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      alignment: Alignment.bottomRight,
                                      child: Container(
                                        width: 50.0,
                                        height: 50.0,
                                        margin: EdgeInsets.only(right: 15.0),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                          image: DecorationImage(
                                              image: AssetImage(
                                                'assets/images/horseback_1.png',
                                              ),
                                              fit: BoxFit.cover),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: GestureDetector(
                              onTap: () => Get.toNamed(Routes.GUIDE_LIST,
                                  arguments: {"id": 3}),
                              child: Container(
                                margin: EdgeInsets.all(6.0),
                                decoration: BoxDecoration(
                                  color: Colors.orangeAccent,
                                  borderRadius: BorderRadius.circular(15.0),
                                  image: DecorationImage(
                                    image: AssetImage(
                                      'assets/images/snow_bg.png',
                                    ),
                                    fit: BoxFit.cover,
                                    colorFilter: ColorFilter.mode(
                                        Colors.black.withOpacity(0),
                                        BlendMode.dstATop),
                                  ),
                                ),
                                alignment: Alignment.topLeft,
                                child: Column(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(
                                          left: 15.0, top: 15.0),
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        '말과',
                                        style: TextStyle(
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin:
                                          EdgeInsets.only(left: 15.0, top: 5.0),
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        '더 친해지기',
                                        style: TextStyle(
                                          fontSize: 28.0,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      alignment: Alignment.bottomRight,
                                      child: Container(
                                        width: 50.0,
                                        height: 50.0,
                                        margin: EdgeInsets.only(right: 15.0),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                          image: DecorationImage(
                                              image: AssetImage(
                                                'assets/images/horse.png',
                                              ),
                                              fit: BoxFit.cover),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: () => Get.toNamed(Routes.GUIDE_LIST,
                                  arguments: {"id": 4}),
                              child: Container(
                                margin: EdgeInsets.all(6.0),
                                decoration: BoxDecoration(
                                  color: Colors.brown.shade400,
                                  borderRadius: BorderRadius.circular(15.0),
                                  image: DecorationImage(
                                    image: AssetImage(
                                      'assets/images/snow_bg.png',
                                    ),
                                    fit: BoxFit.cover,
                                    colorFilter: ColorFilter.mode(
                                        Colors.black.withOpacity(0.3),
                                        BlendMode.dstATop),
                                  ),
                                ),
                                alignment: Alignment.topLeft,
                                child: Column(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(
                                          left: 15.0, top: 15.0),
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        '승마에 필요한',
                                        style: TextStyle(
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin:
                                          EdgeInsets.only(left: 15.0, top: 5.0),
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        '승마장비',
                                        style: TextStyle(
                                          fontSize: 28.0,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      alignment: Alignment.bottomRight,
                                      child: Container(
                                        width: 50.0,
                                        height: 50.0,
                                        margin: EdgeInsets.only(right: 15.0),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                          image: DecorationImage(
                                              image: AssetImage(
                                                'assets/images/rain-boots.png',
                                              ),
                                              fit: BoxFit.cover),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: GestureDetector(
                              onTap: () => Get.toNamed(Routes.GUIDE_LIST,
                                  arguments: {"id": 5}),
                              child: Container(
                                margin: EdgeInsets.all(6.0),
                                decoration: BoxDecoration(
                                  color: Colors.green.shade900,
                                  borderRadius: BorderRadius.circular(15.0),
                                  image: DecorationImage(
                                    image: AssetImage(
                                      'assets/images/snow_bg.png',
                                    ),
                                    fit: BoxFit.cover,
                                    colorFilter: ColorFilter.mode(
                                        Colors.black.withOpacity(0.1),
                                        BlendMode.dstATop),
                                  ),
                                ),
                                alignment: Alignment.topLeft,
                                child: Column(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(
                                          left: 15.0, top: 15.0),
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        '상급자를 위한',
                                        style: TextStyle(
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin:
                                          EdgeInsets.only(left: 15.0, top: 5.0),
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        '승마상식',
                                        style: TextStyle(
                                          fontSize: 28.0,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      alignment: Alignment.bottomRight,
                                      child: Container(
                                        width: 50.0,
                                        height: 50.0,
                                        margin: EdgeInsets.only(right: 15.0),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                          image: DecorationImage(
                                              image: AssetImage(
                                                'assets/images/horseback_2.png',
                                              ),
                                              fit: BoxFit.cover),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
