import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maltaja/app/controller/club/club_controller.dart';
import 'package:maltaja/app/routes/app_pages.dart';

class ClubMise extends GetView<ClubController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(12.0),
            height: 60.0,
            child: const TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search_outlined),
                filled: true,
                //fillColor: Colors.white70,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12.0)),
                  borderSide: BorderSide(color: Colors.transparent, width: 2),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  borderSide: BorderSide(color: Colors.transparent, width: 2),
                ),
                contentPadding: EdgeInsets.symmetric(vertical: 30.0),
              ),
              textInputAction: TextInputAction.send,
              // onSubmitted: (value) async {
              //   await value;
              //   print("11");
              // },
            ),
          ),
          GestureDetector(
            onTap: () => Get.toNamed(Routes.CLUB_DETAIL),
            child: Container(
              width: double.infinity,
              height: 252.0,
              margin: EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                border: Border.all(
                  width: 1.0,
                  color: Colors.transparent,
                ),
              ),
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    height: 150.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(12.0),
                        topRight: Radius.circular(12.0),
                      ),
                      image: DecorationImage(
                        image: AssetImage('assets/images/horsehouse1.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                      width: double.infinity,
                      height: 100.0,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(12.0),
                          bottomRight: Radius.circular(12.0),
                        ),
                      ),
                      child: Column(
                        children: [
                          Container(
                            width: double.infinity,
                            height: 40.0,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Container(
                                  width: 35.0,
                                  height: 35.0,
                                  margin: EdgeInsets.only(left: 5.0, top: 5.0),
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage(
                                          'assets/images/horses.png'),
                                      fit: BoxFit.fill,
                                    ),
                                    borderRadius: BorderRadius.circular(100.0),
                                    border: Border.all(
                                      width: 1.0,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    margin:
                                        EdgeInsets.only(left: 8.0, top: 5.0),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      children: [
                                        Container(
                                          child: Text(
                                            '베르아델 승마클럽',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
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
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: double.infinity,
                            height: 50.0,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(left: 12.0),
                                        child: Text(
                                          '일일체험',
                                          style: TextStyle(
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(left: 12.0),
                                        child: Text(
                                          '정보 없음',
                                          style: TextStyle(
                                            color: Colors.blue,
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(left: 12.0),
                                        child: Text(
                                          '일일기승',
                                          style: TextStyle(
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(left: 12.0),
                                        child: Text(
                                          '45,000원~',
                                          style: TextStyle(
                                            color: Colors.blue,
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.bold,
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
                      )),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
