import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maltaja/app/controller/club/reserve_controller.dart';
import 'package:maltaja/app/ui/screens/club/reserve_info.dart';
import 'package:maltaja/app/ui/screens/club/reserve_schedule.dart';

class Reserve extends GetView<ReserveController> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            '클럽 리스트',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          toolbarHeight: 40.0,
          backgroundColor: Colors.white,
          bottom: const TabBar(
            tabs: [
              Tab(
                child: Text(
                  '기본정보',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
              Tab(
                child: Text(
                  '예약하기',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            ReserveInfo(),
            ReserveSchedule(),
          ],
        ),
      ),
    );
  }
}
