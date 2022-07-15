import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maltaja/app/controller/root_controller.dart';
import 'package:maltaja/app/routes/app_pages.dart';
import 'package:maltaja/app/ui/screens/home/home.dart';
import 'package:maltaja/app/ui/screens/club/club.dart';
import 'package:maltaja/app/ui/screens/news/news_list.dart';
import 'package:maltaja/app/ui/screens/user/info.dart';

class Root extends GetView<RootController> {
  const Root({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: controller.onWillPop,
      child: Obx(
        () => Scaffold(
          body: IndexedStack(
            index: controller.rootPageIndex.value,
            children: [
              Home(),
              Club(),
              NewsList(),
              Info(),
            ],
          ),
          bottomNavigationBar: Container(
            decoration: BoxDecoration(
              //color: Colors.white,
              border: Border(
                top: BorderSide(color: Colors.blueGrey.shade100, width: 1.0),
              ),
            ),
            child: BottomNavigationBar(
              currentIndex: controller.rootPageIndex.value,
              type: BottomNavigationBarType.fixed,
              showSelectedLabels: true,
              showUnselectedLabels: true,
              onTap: controller.changeRootPageIndex,
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home,
                    color: Colors.grey,
                  ),
                  label: '홈',
                  activeIcon: Icon(
                    Icons.home,
                    color: Colors.blue,
                  ),
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.search,
                    color: Colors.grey,
                  ),
                  label: '클럽찾기',
                  activeIcon: Icon(
                    Icons.search,
                    color: Colors.blue,
                  ),
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.notifications,
                    color: Colors.grey,
                  ),
                  label: '소식',
                  activeIcon: Icon(
                    Icons.notifications,
                    color: Colors.blue,
                  ),
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.person,
                    color: Colors.grey,
                  ),
                  label: '내정보',
                  activeIcon: Icon(
                    Icons.person,
                    color: Colors.blue,
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
