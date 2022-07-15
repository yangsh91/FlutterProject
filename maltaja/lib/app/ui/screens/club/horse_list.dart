import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:maltaja/app/controller/club/horse_controller.dart';
import 'package:maltaja/app/routes/app_pages.dart';

class HorseList extends GetView<HorseController> {
  @override
  HorseController controller = Get.put(HorseController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '보유 마필 (${controller.horseTotal.toString()}두)',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        toolbarHeight: 40.0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(5.0),
        child: ListView.separated(
            itemBuilder: (BuildContext context, int item) {
              return GestureDetector(
                onTap: () => Get.toNamed(Routes.HORSE_DETAIL),
                child: ListTile(
                  title: Row(
                    children: [
                      Container(
                        width: 70.0,
                        height: 70.0,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(15.0),
                          image: DecorationImage(
                            image: AssetImage(
                                '${controller.horseList[item]['picture']}'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(left: 7.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[
                              Container(
                                child: Text(
                                    '${controller.horseList[item]['name']}'),
                              ),
                              Container(
                                child: Text(
                                    '${controller.horseList[item]['sex']} | ${controller.horseList[item]['type']}'),
                              ),
                              Container(
                                child: Text(
                                    '출생일 : ${controller.horseList[item]['birth']}'),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        alignment: Alignment.centerRight,
                        child: Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
            separatorBuilder: (BuildContext context, int item) => const Divider(
                  color: Colors.black45,
                ),
            itemCount: controller.horseList.length),
      ),
    );
  }
}
