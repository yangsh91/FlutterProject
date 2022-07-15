import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:maltaja/app/controller/club/teacher_list_controller.dart';

class TeacherList extends GetView<TeacherListController> {
  @override
  TeacherListController controller = Get.put(TeacherListController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '코치 소개',
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
              return ListTile(
                title: Row(
                  children: [
                    Container(
                      width: 55.0,
                      height: 55.0,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(15.0),
                        image: DecorationImage(
                          image: AssetImage('assets/images/horseback_1.png'),
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
                                  '${controller.teacherList[item]['name']}'),
                            ),
                            Container(
                              child: Text(
                                  '${controller.teacherList[item]['position']}'),
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
              );
            },
            separatorBuilder: (BuildContext context, int item) => const Divider(
                  color: Colors.black45,
                ),
            itemCount: controller.teacherList.length),
      ),
    );
  }
}
