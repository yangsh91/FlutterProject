import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:lms/app/controller/attendance/attendace_controller.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class AtdDetail extends GetView<AttendanceController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('등하원 타임라인'),
        actions: [
          TextButton(
            onPressed: () {},
            child: Icon(Icons.stop),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: GetX<AttendanceController>(
            initState: (state) {
              Get.find<AttendanceController>().getDetail();
            },
            builder: (_) {
              return StdSchCalendar(_.detailPost);
            },
          ),
        ),
      ),
    );
  }

  Widget StdSchCalendar(List<dynamic> post) {
    return SfCalendar(
      view: CalendarView.day,
      initialDisplayDate: DateTime.parse(Get.parameters['dt'].toString()),
      showDatePickerButton: true,
      timeSlotViewSettings: TimeSlotViewSettings(
        startHour: 6,
        endHour: 24,
      ),
      dataSource: MeetingDataSource(_getDataSource(post)),
      onTap: (CalendarTapDetails details) {
        dynamic appointment = details.appointments;
        DateTime date = details.date!;
        CalendarElement element = details.targetElement;
        //print(details);
      },
      onViewChanged: (ViewChangedDetails details) {
        List<DateTime> dates = details.visibleDates;
        print(dates);
      },
    );
  }
}

List<Meeting> _getDataSource(List<dynamic> post) {
  final List<Meeting> detail = <Meeting>[];
  final DateTime today = DateTime.now();

  for (var i = 0; i < post.length; i++) {
    String? atd_dtl = post[i].atd_dtl.toString();
    DateTime inDt = DateTime.parse(post[i].atd_dttm.toString());
    DateTime endTime = inDt.add(const Duration(hours: 1));
    Color? bg;

    switch (post[i].atd_gubun) {
      case "00":
      case "51":
        bg = Colors.green;
        break;
      case "12":
        bg = Colors.orange;
        break;
      case "01":
        bg = Colors.black;
        break;
    }

    detail.add(Meeting(atd_dtl, inDt, endTime, bg!, false));
  }

  return detail;
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
