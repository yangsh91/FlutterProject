import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maltaja/app/ui/screens/club/club_mise.dart';
import 'package:maltaja/app/ui/screens/club/club_all.dart';
import 'package:maltaja/app/routes/app_pages.dart';

class Club extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            '클럽 리스트',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          toolbarHeight: 40.0,
          backgroundColor: Colors.white,
          actions: [
            GestureDetector(
              onTap: () => Get.toNamed(Routes.CLUB_LOCATION),
              child: Container(
                margin: EdgeInsets.only(right: 10.0),
                child: Icon(Icons.location_on_outlined, color: Colors.black),
              ),
            ),
          ],
          bottom: TabBar(
            tabs: [
              Tab(
                child: Text(
                  '협약 승마장',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
              Tab(
                child: Text(
                  '전체 승마장',
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
            ClubMise(),
            ClubAll(),
          ],
        ),
      ),
    );
  }
}
