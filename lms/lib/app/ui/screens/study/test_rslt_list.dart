import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lms/app/controller/study/study_controller.dart';
import 'package:lms/app/data/repository/study_repository.dart';

class TestRsltList extends GetView<StudyController> {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        children: <Widget>[
          Container(
            height: 30.0,
            color: Colors.greenAccent,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    alignment: Alignment.center,
                    child: Text('시험명'),
                  ),
                ),
                Expanded(
                  child: Container(
                    alignment: Alignment.center,
                    child: Text('시험일자'),
                  ),
                ),
                Expanded(
                  child: Container(
                    alignment: Alignment.center,
                    child: Text('응시'),
                  ),
                ),
              ],
            ),
          ),
          Container(
            child: Obx(
              () => Container(
                margin: EdgeInsets.only(top: 10.0),
                child: ListView.builder(
                  //physics: const NeverScrollableScrollPhysics(),
                  //shrinkWrap: true,
                  //controller: controller.scrollController.value,
                  itemBuilder: (_, index) {
                    //print(controller.postList);
                    if (index < controller.testList.length) {
                      return Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            border: Border.all(
                              color: Colors.grey,
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(5.0),
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[
                              Container(
                                child: Text("..."),
                              ),
                              Container(
                                child: Text(
                                    '작성자 : ${controller.testList[index].exam_no} | ${controller.testList[index].exam_nm}'),
                              ),
                              Container(
                                child: Text("..."),
                              ),
                            ],
                          ),
                        ),
                      );
                    }

                    return Container(
                      child: Center(
                        child: Text('데이터의 마지막 입니다.'),
                      ),
                    );
                  },
                  //separatorBuilder: (_, index) => Divider(),
                  itemCount: controller.testList.length + 1,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget getDataLists() {
    return Obx(
      () => Container(
          child: ListView.builder(
              itemCount: controller.testList.length + 1,
              itemBuilder: (_, index) {
                return Container();
              })),
    );
  }
}
