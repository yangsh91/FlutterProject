import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:lms/app/controller/attendance/attendace_controller.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:lms/app/ui/screens/common/sidebar.dart';
import 'package:lms/app/routes/app_pages.dart';

class AtdList extends GetView<AttendanceController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('출석현황'),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios)),
      ),
      endDrawer: Container(
        width: 215.0,
        child: Drawer(
          backgroundColor: Colors.grey,
          child: SideBar(),
        ),
      ),
      body: ListView(
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height,
                child: GetX<AttendanceController>(
                  initState: (state) {
                    Get.find<AttendanceController>().getList();
                  },
                  builder: (_) {
                    return StdSchCalendar(_.postList);
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget StdSchCalendar(List<dynamic> map) {
    return SfCalendar(
        view: CalendarView.month,
        showDatePickerButton: true,
        showNavigationArrow: true,
        dataSource: MeetingDataSource(_getDataSource(map)),
        monthViewSettings: MonthViewSettings(
          appointmentDisplayMode: MonthAppointmentDisplayMode.appointment,
        ),
        headerStyle: CalendarHeaderStyle(
          textStyle: TextStyle(color: Colors.black, fontSize: 20),
          textAlign: TextAlign.center,
          //backgroundColor: Colors.blue,
        ),
        blackoutDates: <DateTime>[
          DateTime(2021, 10, 3),
          DateTime(2021, 10, 10),
          DateTime(2021, 10, 17),
          DateTime(2021, 10, 24),
          DateTime(2021, 10, 31),
        ],
        blackoutDatesTextStyle: TextStyle(color: Colors.red),
        onTap: (CalendarTapDetails details) {
          dynamic appointment = details.appointments;
          DateTime date = details.date!;
          CalendarElement element = details.targetElement;

          if (!appointment.isEmpty) {
            //Navigator.of(context).push(_createRoute());
            controller.atd_dt = date.toString();
            Get.toNamed('/atd_detail?dt=$date');
          }
        });
  }
}

List<Meeting> _getDataSource(List<dynamic> map) {
  final List<Meeting> meetings = <Meeting>[];
  final DateTime today = DateTime.now();
  final DateTime startTime =
      DateTime(today.year, today.month, today.day, 9, 0, 0);

  print(map.length);
  for (var i = 0; i < map.length; i++) {
    DateTime inDt = DateTime.parse(map[i].in_chk_dt.toString());
    //DateTime endTime = startTime.add(const Duration(hours: 2));

    print(":::list:::");
    print(inDt);
    print(":::list:::");

    meetings.add(Meeting('등원', inDt, inDt, Colors.green, false));

    if (map[i].out_chk_dt != null) {
      DateTime outDt = DateTime.parse(map[i].out_chk_dt.toString());

      meetings.add(Meeting('하원', outDt, outDt, Colors.black, false));
    }
  }

  return meetings;
}

class MeetingDataSource extends CalendarDataSource {
  MeetingDataSource(List<Meeting> source) {
    appointments = source;
  }

  @override
  DateTime getStartTime(int index) {
    return appointments![index].from;
  }

  @override
  DateTime getEndTime(int index) {
    return appointments![index].to;
  }

  @override
  String getSubject(int index) {
    return appointments![index].eventName;
  }

  @override
  Color getColor(int index) {
    return appointments![index].background;
  }

  @override
  bool isAllDay(int index) {
    return appointments![index].isAllDay;
  }
}

class Meeting {
  Meeting(this.eventName, this.from, this.to, this.background, this.isAllDay);

  String eventName;
  DateTime from;
  DateTime to;
  Color background;
  bool isAllDay;
}
