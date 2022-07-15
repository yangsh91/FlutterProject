import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jarada_lab/app/controller/home/home_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:jarada_lab/app/ui/widget/side_menu.dart';

class Home extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    void _showDialog() {
      showCupertinoDialog(
          context: context,
          builder: (context) {
            return CupertinoAlertDialog(
              title: Text('접근불가'),
              content: Text('현재 준비중 입니다.'),
              actions: [
                CupertinoDialogAction(
                    onPressed: () => Navigator.pop(context),
                    isDefaultAction: true,
                    child: Text('확인')),
              ],
            );
          });
    }

    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
        // FocusScope.of(context).unfocus();
      },
      child: WillPopScope(
        onWillPop: () async {
          return false;
        },
        child: Scaffold(
          backgroundColor: Colors.grey.shade200,
          appBar: AppBar(
            backgroundColor: const Color.fromRGBO(26, 28, 28, 1),
            iconTheme: IconThemeData(
              color: Colors.yellow,
            ),
            toolbarHeight: 50.0,
            centerTitle: false,
            title: Container(
              alignment: Alignment.center,
              width: 100.0,
              child: Image.asset(
                'assets/images/logo.png',
                fit: BoxFit.contain,
              ),
            ),
          ),
          endDrawer: SideMenu(),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0),
                  child: Row(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.8,
                        height: 50.0,
                        child: TextField(
                          autocorrect: true,
                          decoration: const InputDecoration(
                            fillColor: Colors.yellow,
                            border: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.black, width: 5.0),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.yellow,
                                width: 5.0,
                              ),
                            ),
                            hintText: '아이디를 검색해보자',
                            hintStyle: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () => _showDialog(),
                          child: Container(
                            height: 50.0,
                            color: Colors.yellow.shade400,
                            alignment: Alignment.center,
                            child: const Text(
                              '검색',
                              style: TextStyle(
                                fontSize: 15.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Container(
                  padding: EdgeInsets.only(
                    right: 10.0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        child: Icon(Icons.image_sharp),
                      ),
                      GestureDetector(
                        onTap: () => _showDialog(),
                        child: Container(
                          child: Text('슬라이드 쇼 재생'),
                        ),
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      Container(
                        child: Icon(Icons.search_sharp),
                      ),
                      GestureDetector(
                        onTap: () => _showDialog(),
                        child: Container(
                          child: Text('상세검색 바로가기'),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Container(
                  height: 180.0,
                  margin: const EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 3.5,
                      color: Colors.lightGreenAccent.shade400,
                    ),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Container(
                        height: 30.0,
                        padding: EdgeInsets.fromLTRB(10.0, 0, 0, 0),
                        alignment: Alignment.centerLeft,
                        child: Text(
                          '이번 달에는 이걸 준비했지',
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 10.0),
                            width: 140.0,
                            height: 140.0,
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Container(
                                  width: 120.0,
                                  height: 120.0,
                                  child: Image.network(
                                    'https://lab.jarada.co.kr/data/plan/1645684430_plan.jpg',
                                    fit: BoxFit.cover,
                                  )),
                            ),
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          Container(
                            width: 180.0,
                            height: 140.0,
                            //color: Colors.purple,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    GestureDetector(
                                      onTap: () => _showDialog(),
                                      child: Container(
                                        width: 75.0,
                                        height: 23.0,
                                        color: Colors.yellow,
                                        child: Image.asset(
                                          'assets/images/month_icon1_act.png',
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10.0,
                                    ),
                                    GestureDetector(
                                      onTap: () => _showDialog(),
                                      child: Container(
                                        width: 75.0,
                                        height: 23.0,
                                        color: Colors.yellow,
                                        child: Image.asset(
                                          'assets/images/month_icon2_act.png',
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 10.0,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    GestureDetector(
                                      onTap: () => _showDialog(),
                                      child: Container(
                                        width: 75.0,
                                        height: 23.0,
                                        color: Colors.yellow,
                                        child: Image.asset(
                                          'assets/images/month_icon3_act.png',
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10.0,
                                    ),
                                    GestureDetector(
                                      onTap: () => _showDialog(),
                                      child: Container(
                                        width: 75.0,
                                        height: 23.0,
                                        color: Colors.yellow,
                                        child: Image.asset(
                                          'assets/images/month_icon4_act.png',
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Container(
                  height: 170.0,
                  margin: const EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 3.5,
                      color: Colors.lightGreenAccent.shade400,
                    ),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: Column(
                    children: [
                      Container(
                        height: 30.0,
                        padding: EdgeInsets.fromLTRB(10.0, 0, 0, 0),
                        alignment: Alignment.centerLeft,
                        child: Text(
                          '지금까지 작품중 베스트를 보여주겠다',
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                        //color: Colors.grey,
                        width: MediaQuery.of(context).size.width,
                        height: 120.0,
                        child: CarouselSlider(
                          carouselController: controller.carouseController,
                          options: CarouselOptions(
                              autoPlay: false,
                              enableInfiniteScroll: true,
                              //enlargeCenterPage: true,
                              aspectRatio: 2.0,
                              viewportFraction: 0.33,
                              onPageChanged: (index, reason) {
                                controller.imgChanging(index);
                              }),
                          items: controller.imgList.map((e) {
                            return Image(
                              image: AssetImage(e),
                              fit: BoxFit.cover,
                            );
                          }).toList(),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
                  child: Container(
                    height: 520.0,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade400,
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: Column(
                      children: [
                        Container(
                          height: 30.0,
                          margin: const EdgeInsets.only(top: 10.0),
                          child: Row(children: [
                            Container(
                              width: MediaQuery.of(context).size.width * 0.7,
                              padding: const EdgeInsets.fromLTRB(10.0, 0, 0, 0),
                              alignment: Alignment.centerLeft,
                              child: const Text(
                                '다른 친구들이 만든 것을 참고해볼까?',
                                style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Container(
                              alignment: Alignment.centerRight,
                              child: ElevatedButton(
                                onPressed: () {},
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      Colors.grey.shade600),
                                ),
                                child: const Text(
                                  '더보기',
                                  style: TextStyle(
                                    fontSize: 13.0,
                                  ),
                                ),
                              ),
                            ),
                          ]),
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          padding: const EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
                          height: 470.0,
                          child: GridView.builder(
                            shrinkWrap: true,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              mainAxisExtent: 115,
                            ),
                            itemCount: controller.gridViewList.length,
                            itemBuilder: (BuildContext context, int index) =>
                                Card(
                              child: Image.asset(
                                '${controller.gridViewList[index]}',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
                  child: Container(
                    height: 520.0,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade400,
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: Column(
                      children: [
                        Container(
                          height: 30.0,
                          margin: const EdgeInsets.only(top: 10.0),
                          child: Row(children: [
                            Container(
                              width: MediaQuery.of(context).size.width * 0.5,
                              padding: const EdgeInsets.fromLTRB(10.0, 0, 0, 0),
                              alignment: Alignment.centerLeft,
                              child: const Text(
                                '자라다 연구작',
                                style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.4,
                              alignment: Alignment.centerRight,
                              child: ElevatedButton(
                                onPressed: () {},
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      Colors.grey.shade600),
                                ),
                                child: const Text(
                                  '더보기',
                                  style: TextStyle(
                                    fontSize: 13.0,
                                  ),
                                ),
                              ),
                            ),
                          ]),
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          padding: const EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
                          height: 470.0,
                          child: GridView.builder(
                            shrinkWrap: true,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              mainAxisExtent: 115,
                            ),
                            itemCount: controller.gridViewList.length,
                            itemBuilder: (BuildContext context, int index) =>
                                Card(
                              child: Image.asset(
                                '${controller.gridViewList[index]}',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 70,
                ),
                Container(
                  width: double.infinity,
                  height: 150.0,
                  padding: const EdgeInsets.only(top: 10.0),
                  color: Colors.grey.shade300,
                  child: Column(
                    //mainAxisAlignment: MainAxisAlignment.start,
                    //crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        child: Text(
                          '㈜자라다교육 | 대표 : 최민준주소 | 경기도 고양시 일산동구 정발산로24',
                          style: TextStyle(
                            fontSize: 12.0,
                          ),
                        ),
                      ),
                      Container(
                        child: Text(
                          '웨스턴돔 A동 909호 자라다교육 | 사업자등록번호 : 897-88-00305',
                          style: TextStyle(
                            fontSize: 12.0,
                          ),
                        ),
                      ),
                      Container(
                        child: Text(
                          '자라다교육 대표전화 1544-1883 (월-금 9:00~18:00 / 토 10:00~18:00) |',
                          style: TextStyle(
                            fontSize: 12.0,
                          ),
                        ),
                      ),
                      Container(
                        child: Text(
                          '이메일 : jaradaboys@naver.com | FAX : 031-906-3334',
                          style: TextStyle(
                            fontSize: 12.0,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 15.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 100.0,
                            child: Image.asset('assets/images/footer1.png',
                                fit: BoxFit.cover),
                          ),
                          const SizedBox(
                            width: 20.0,
                          ),
                          Container(
                            width: 100.0,
                            child: Image.asset('assets/images/footer2.png',
                                fit: BoxFit.cover),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
