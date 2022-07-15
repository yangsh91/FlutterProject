import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lms/app/controller/notice/notice_controller.dart';
import 'package:lms/app/ui/screens/common/sidebar.dart';

class NoticeList extends GetView<NoticeController> {
  Future<void> _onRefresh() async {
    await Future.delayed(Duration(milliseconds: 1000));
    controller.getClear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('공지사항'),
      ),
      endDrawer: Container(
        width: 215.0,
        child: Drawer(
          backgroundColor: Colors.grey,
          child: SideBar(),
        ),
      ),
      body: RefreshIndicator(
        onRefresh: _onRefresh,
        child: Obx(
          () => Container(
            margin: EdgeInsets.only(top: 10.0),
            child: ListView.builder(
              //physics: const NeverScrollableScrollPhysics(),
              //shrinkWrap: true,
              controller: controller.scrollController.value,
              itemBuilder: (_, index) {
                //print(controller.postList);
                if (index < controller.postList.length) {
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
                            child: Text(controller.postList[index].subject),
                          ),
                          Container(
                            child: Text(
                                '작성자 : ${controller.postList[index].nickname} | ${controller.postList[index].insert_dt}'),
                          ),
                          Container(
                            child: Text(controller.postList[index].contents),
                          ),
                        ],
                      ),
                    ),
                  );
                }

                if (controller.hasMore.value || controller.isLoading.value) {
                  return Center(child: RefreshProgressIndicator());
                }

                return Container(
                  child: Center(
                    child: Text('데이터의 마지막 입니다.'),
                  ),
                );
              },
              //separatorBuilder: (_, index) => Divider(),
              itemCount: controller.postList.length + 1,
            ),
          ),
        ),
      ),
    );
  }
}
