import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maltaja/app/controller/club/horse_detail_controller.dart';

class HorseDetail extends GetView<HorseDetailController> {
  @override
  HorseDetailController controller = Get.put(HorseDetailController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'detail',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: 70.0,
                  height: 70.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    image: DecorationImage(
                      image: AssetImage('${controller.info['picture']}'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  height: 70.0,
                  padding: EdgeInsets.only(left: 10.0, top: 5.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: Text('${controller.info['name']}'),
                      ),
                      Container(
                        child: Text(
                            '${controller.info['sex']} | ${controller.info['type']}'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Container(
            alignment: Alignment.center,
            child: const Text(
              '말 기본정보',
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          Divider(
            color: Colors.grey,
          ),
          Container(
            padding: EdgeInsets.fromLTRB(12.0, 0, 0, 0),
            child: Text('이름'),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(12.0, 0, 0, 0),
            child: Text(
              '${controller.info['name']}',
              style: TextStyle(
                color: Colors.black,
                fontSize: 22.0,
              ),
            ),
          ),
          Divider(
            color: Colors.grey,
          ),
          Container(
            padding: EdgeInsets.fromLTRB(12.0, 0, 0, 0),
            child: Text('성별'),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(12.0, 0, 0, 0),
            child: Text(
              '${controller.info['sex']}',
              style: TextStyle(
                color: Colors.black,
                fontSize: 22.0,
              ),
            ),
          ),
          Divider(
            color: Colors.grey,
          ),
          Container(
            padding: EdgeInsets.fromLTRB(12.0, 0, 0, 0),
            child: Text('품종'),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(12.0, 0, 0, 0),
            child: Text(
              '${controller.info['type']}',
              style: TextStyle(
                color: Colors.black,
                fontSize: 22.0,
              ),
            ),
          ),
          Divider(
            color: Colors.grey,
          ),
          Container(
            padding: EdgeInsets.fromLTRB(12.0, 0, 0, 0),
            child: Text('국적'),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(12.0, 0, 0, 0),
            child: Text(
              '${controller.info['nation']}',
              style: TextStyle(
                color: Colors.black,
                fontSize: 22.0,
              ),
            ),
          ),
          Divider(
            color: Colors.grey,
          ),
          Container(
            padding: EdgeInsets.fromLTRB(12.0, 0, 0, 0),
            child: Text('사용용도'),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(12.0, 0, 0, 0),
            child: Text(
              '${controller.info['use']}',
              style: TextStyle(
                color: Colors.black,
                fontSize: 22.0,
              ),
            ),
          ),
          Divider(
            color: Colors.grey,
          ),
          Container(
            padding: EdgeInsets.fromLTRB(12.0, 0, 0, 0),
            child: Text('출생연도'),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(12.0, 0, 0, 0),
            child: Text(
              '${controller.info['birth']}',
              style: TextStyle(
                color: Colors.black,
                fontSize: 22.0,
              ),
            ),
          ),
          Divider(
            color: Colors.grey,
          ),
        ],
      ),
    );
  }
}
