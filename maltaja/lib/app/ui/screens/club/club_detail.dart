import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:maltaja/app/controller/club/club_detail_controller.dart';
import 'package:maltaja/app/routes/app_pages.dart';

class ClubDetail extends GetView<ClubDetailController> {
  final CarouselController _controller = CarouselController();

  @override
  final ClubDetailController controller = Get.put(ClubDetailController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        title: Text(
          '클럽',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        toolbarHeight: 40.0,
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              height: 240.0,
              child: CarouselSlider(
                carouselController: _controller,
                options: CarouselOptions(
                    height: 240.0,
                    enableInfiniteScroll: false,
                    enlargeCenterPage: false,
                    aspectRatio: 2.0,
                    viewportFraction: 1,
                    onPageChanged: (index, reason) {
                      //print("$index :: $reason");
                    }),
                items: controller.imgList.map((e) {
                  return Container(
                    child: ClipRRect(
                      //borderRadius: BorderRadius.all(Radius.circular(15.0)),
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
            Container(
              width: double.infinity,
              height: 75.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 55.0,
                    height: 55.0,
                    margin: EdgeInsets.only(left: 12.0, top: 12.0),
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/images/horses.png')),
                        borderRadius: BorderRadius.circular(50.0),
                        border: Border.all(
                          width: 1.0,
                          color: Colors.grey,
                        )),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 10.0, top: 12.0),
                          child: Text(
                            '베르아델 승마클럽',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 22.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 10.0),
                          child: Text(
                            '평가내역 없음 >',
                            style: TextStyle(
                              fontSize: 12.0,
                              color: Colors.grey.shade600,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 10.0),
                          child: Text(
                            '38.9km | 경기도 안산시 단원구 대부동 부흥로 376',
                            style: TextStyle(
                              fontSize: 12.0,
                              color: Colors.grey.shade600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              //color: Colors.grey,
              height: 66.0,
              padding: EdgeInsets.only(top: 5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () => Get.toNamed(Routes.TEACHER_LIST),
                    child: Container(
                      width: 45.0,
                      height: 60.0,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            child: Container(
                              padding: EdgeInsets.all(8.0),
                              width: 40.0,
                              height: 40.0,
                              child: Image.asset('assets/images/people.png',
                                  fit: BoxFit.cover),
                            ),
                          ),
                          SizedBox(
                            height: 2.0,
                          ),
                          Container(
                            child: Text(
                              '강사진',
                              style: TextStyle(
                                fontSize: 11.0,
                                color: Colors.black87,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                  GestureDetector(
                    onTap: () => Get.toNamed(Routes.HORSE_LIST),
                    child: Container(
                      width: 45.0,
                      height: 60.0,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.amber,
                            child: Container(
                              padding: EdgeInsets.all(8.0),
                              width: 40.0,
                              height: 40.0,
                              child: Image.asset('assets/images/horses.png',
                                  fit: BoxFit.cover),
                            ),
                          ),
                          SizedBox(
                            height: 2.0,
                          ),
                          Container(
                            child: Text(
                              '보유마필',
                              style: TextStyle(
                                fontSize: 11.0,
                                color: Colors.black87,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                  GestureDetector(
                    onTap: () {
                      print(controller.phoneNumber);
                      FlutterPhoneDirectCaller.callNumber(
                          controller.phoneNumber);
                    },
                    child: Container(
                      width: 45.0,
                      height: 60.0,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.green.shade400,
                            child: Container(
                              padding: EdgeInsets.all(8.0),
                              width: 40.0,
                              height: 40.0,
                              child: Image.asset('assets/images/call.png',
                                  fit: BoxFit.cover),
                            ),
                          ),
                          SizedBox(
                            height: 2.0,
                          ),
                          Container(
                            child: Text(
                              '문의하기',
                              style: TextStyle(
                                fontSize: 11.0,
                                color: Colors.black87,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                  Container(
                    width: 45.0,
                    height: 60.0,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.pink.shade200,
                          child: Container(
                            padding: EdgeInsets.all(8.0),
                            width: 40.0,
                            height: 40.0,
                            child: Image.asset('assets/images/option.png',
                                fit: BoxFit.cover),
                          ),
                        ),
                        SizedBox(
                          height: 2.0,
                        ),
                        Container(
                          child: Text(
                            '상세정보',
                            style: TextStyle(
                              fontSize: 11.0,
                              color: Colors.black87,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () => Get.toNamed(Routes.RESERVE),
              child: Container(
                height: 120.0,
                margin: EdgeInsets.only(
                    top: 12.0, bottom: 6.0, right: 12.0, left: 12.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                  color: Colors.white,
                ),
                child: Row(
                  children: [
                    Container(
                      width: 80.0,
                      height: 100.0,
                      margin: EdgeInsets.only(left: 10.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15.0),
                        child: Image.asset(
                          'assets/images/horseRiding1.png',
                          fit: BoxFit.cover,
                          width: 80.0,
                          height: 100.0,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: 100.0,
                        margin: EdgeInsets.only(left: 10.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: 6.0),
                              child: Text(
                                '일반 기승',
                                style: TextStyle(
                                  fontSize: 18.0,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 3.0,
                            ),
                            Container(
                              child: Text(
                                '40분',
                                style: TextStyle(
                                  fontSize: 12.0,
                                  color: Colors.grey.shade400,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(right: 15.0),
                        height: 100.0,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: 6.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    '주중',
                                    style: TextStyle(
                                      color: Colors.blue,
                                    ),
                                  ),
                                  SizedBox(width: 3.0),
                                  Text(
                                    '50,000원',
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 3.0,
                            ),
                            Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    '주말',
                                    style: TextStyle(
                                      color: Colors.red,
                                    ),
                                  ),
                                  SizedBox(width: 3.0),
                                  Text(
                                    '60,000원',
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: 120.0,
              margin: EdgeInsets.only(
                  top: 12.0, bottom: 6.0, right: 12.0, left: 12.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                color: Colors.white,
              ),
              child: Row(
                children: [
                  Container(
                    width: 80.0,
                    height: 100.0,
                    margin: EdgeInsets.only(left: 10.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15.0),
                      child: Image.asset(
                        'assets/images/nezuko.jpeg',
                        fit: BoxFit.cover,
                        width: 80.0,
                        height: 100.0,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 100.0,
                      margin: EdgeInsets.only(left: 10.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 6.0),
                            child: Text(
                              '어린이 기승',
                              style: TextStyle(
                                fontSize: 18.0,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 3.0,
                          ),
                          Container(
                            child: Text(
                              '30분',
                              style: TextStyle(
                                fontSize: 12.0,
                                color: Colors.grey.shade400,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(right: 15.0),
                      height: 100.0,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 6.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  '주중',
                                  style: TextStyle(
                                    color: Colors.blue,
                                  ),
                                ),
                                SizedBox(width: 3.0),
                                Text(
                                  '40,000원',
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 3.0,
                          ),
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  '주말',
                                  style: TextStyle(
                                    color: Colors.red,
                                  ),
                                ),
                                SizedBox(width: 3.0),
                                Text(
                                  '40,000원',
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 120.0,
              margin: EdgeInsets.only(
                  top: 12.0, bottom: 6.0, right: 12.0, left: 12.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                color: Colors.white,
              ),
              child: Row(
                children: [
                  Container(
                    width: 80.0,
                    height: 100.0,
                    margin: EdgeInsets.only(left: 10.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15.0),
                      child: Image.asset(
                        'assets/images/horseRiding2.png',
                        fit: BoxFit.cover,
                        width: 80.0,
                        height: 100.0,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 100.0,
                      margin: EdgeInsets.only(left: 10.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 6.0),
                            child: Text(
                              '고급 기승',
                              style: TextStyle(
                                fontSize: 18.0,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 3.0,
                          ),
                          Container(
                            child: Text(
                              '40분',
                              style: TextStyle(
                                fontSize: 12.0,
                                color: Colors.grey.shade400,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(right: 15.0),
                      height: 100.0,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 6.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  '주중',
                                  style: TextStyle(
                                    color: Colors.blue,
                                  ),
                                ),
                                SizedBox(width: 3.0),
                                Text(
                                  '60,000원',
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 3.0,
                          ),
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  '주말',
                                  style: TextStyle(
                                    color: Colors.red,
                                  ),
                                ),
                                SizedBox(width: 3.0),
                                Text(
                                  '70,000원',
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 120.0,
              margin: EdgeInsets.only(top: 12.0, right: 12.0, left: 12.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                color: Colors.white,
              ),
              child: Row(
                children: [
                  Container(
                    width: 80.0,
                    height: 100.0,
                    margin: EdgeInsets.only(left: 10.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15.0),
                      child: Image.asset(
                        'assets/images/horseRiding3.png',
                        fit: BoxFit.cover,
                        width: 80.0,
                        height: 100.0,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 100.0,
                      margin: EdgeInsets.only(left: 10.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 6.0),
                            child: Text(
                              '일반 쿠폰(10장)',
                              style: TextStyle(
                                fontSize: 18.0,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 3.0,
                          ),
                          Container(
                            child: Text(
                              '40분',
                              style: TextStyle(
                                fontSize: 12.0,
                                color: Colors.grey.shade400,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(right: 15.0),
                      height: 100.0,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 6.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  '주중',
                                  style: TextStyle(
                                    color: Colors.blue,
                                  ),
                                ),
                                SizedBox(width: 3.0),
                                Text(
                                  '500,000원',
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 3.0,
                          ),
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  '주말',
                                  style: TextStyle(
                                    color: Colors.red,
                                  ),
                                ),
                                SizedBox(width: 3.0),
                                Text(
                                  '600,000원',
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
          ],
        ),
      ),
    );
  }
}
