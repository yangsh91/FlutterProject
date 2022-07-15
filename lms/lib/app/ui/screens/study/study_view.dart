import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:lms/app/controller/study/study_controller.dart';
import 'package:lms/app/ui/screens/study/test_rslt_list.dart';
import 'package:lms/app/ui/screens/common/sidebar.dart';

class StudyView extends GetView<StudyController> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('학습관리'),
          bottom: const TabBar(
            tabs: [
              Tab(text: '수강시간표'),
              Tab(text: '성적조회'),
            ],
          ),
        ),
        endDrawer: Container(
          width: 215.0,
          child: Drawer(
            backgroundColor: Colors.grey,
            child: SideBar(),
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            Center(
              child: std_schedule(),
            ),
            Center(
              child: TestRsltList(),
            ),
          ],
        ),
      ),
    );
  }
}

class std_schedule extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Column(
          children: <Widget>[
            Container(
              height: 45.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.all(5.0),
                    //decoration: _selectWeek,
                    child: TextButton(
                      onPressed: () {
                        // setState(() {
                        //   _onChangeWidget(1);
                        // });
                      },
                      child: Text(
                        '주',
                        //style: _textWeek,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(5.0),
                    //decoration: _selectMonth,
                    child: TextButton(
                      onPressed: () {
                        // setState(() {
                        //   _onChangeWidget(2);
                        // });
                      },
                      child: Text(
                        '월',
                        //style: _textMonth,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.75,
              child: Text('contents box'),
            ),
          ],
        ),
      ],
    );
  }
}
