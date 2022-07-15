import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:maltaja/app/controller/club/reserve_schedule_controller.dart';

class ReserveSchedule extends GetView<ReserveScheduleController> {
  @override
  final ReserveScheduleController controller =
      Get.put(ReserveScheduleController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(12.0, 18.0, 0, 0),
            child: Container(
              height: 20.0,
              child: const Text(
                '예약날짜',
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: ElevatedButton(
              onPressed: () => _showModalBottomSheet(context),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                  Colors.pinkAccent,
                ),
              ),
              child: const Text(
                '예약 일시 선택',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(12.0, 0, 20.0, 0),
            child: Container(
              height: 50.0,
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        '예약인원',
                        style: TextStyle(
                          fontSize: 16.0,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 35.0,
                    alignment: Alignment.topCenter,
                    width: 50.0,
                    child: Column(
                      children: [
                        const Text(
                          '본인 포함',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 10.0,
                          ),
                        ),
                        Container(
                          height: 20.0,
                          child: Switch(
                            value: true,
                            onChanged: (value) {},
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Container(
              height: 20.0,
              child: const Text(
                '1. (본인)',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18.0,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                  Colors.black,
                ),
              ),
              child: const Text(
                '+ 동행인 추가',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(12.0, 0, 0, 0),
            child: Container(
              child: Text(
                '* 85kg 이상은 기승에 제한이 있을 수 있습니다.',
                style: TextStyle(
                  color: Colors.redAccent,
                  fontSize: 12.0,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(12.0, 12.0, 12.0, 0),
            child: Container(
              height: 30.0,
              child: const TextField(
                textAlign: TextAlign.left,
                decoration: InputDecoration(
                  hintText: '요청사항을 입력해 주세요.',
                  hintStyle: TextStyle(
                    fontSize: 12.0,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 2.0,
                      color: Colors.blueAccent,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 2.0,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        height: 120.0,
        decoration: BoxDecoration(
          border: const Border(
            top: BorderSide(width: 5.0, color: Colors.white),
            //bottom: BorderSide(width: 16.0, color: Colors.lightBlue.shade900),
          ),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.8),
              spreadRadius: 4,
              blurRadius: 5,
              offset: Offset(0, 1),
            )
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: EdgeInsets.only(right: 15.0),
              alignment: Alignment.bottomRight,
              child: Text(
                '가격 : 0원',
                style: TextStyle(
                  color: Colors.redAccent,
                  fontSize: 25.0,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(12.0, 0, 12.0, 22.0),
              child: ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                    Colors.black45,
                  ),
                ),
                child: Text(
                  '예약 신청',
                  style: TextStyle(color: Color.fromARGB(255, 27, 26, 26)),
                ),
              ),
            ),
          ],
        ),
      ),

      /*
      Center(
        child: ElevatedButton(
          onPressed: () => _showModalBottomSheet(context),
          child: const Text('예약하기'),
        ),
      ),
      */
    );
  }

  void _showModalBottomSheet(BuildContext context) {
    showModalBottomSheet<void>(
      constraints: BoxConstraints.loose(
        Size(MediaQuery.of(context).size.width,
            MediaQuery.of(context).size.height * 0.9),
      ),
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) {
        return _BottomSheetContent();
      },
    );
  }

  Widget _BottomSheetContent() {
    return Obx(
      () => Container(
        height: double.infinity,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 70.0,
                child: Center(
                  child: Text(
                    '예약 일자를 선택해 주세요',
                    style: TextStyle(fontSize: 20.0),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Container(
                height: 360.0,
                child: TableCalendar(
                  firstDay: kFirstDay,
                  lastDay: kLastDay,
                  focusedDay: controller.focusedDay.value,
                  calendarFormat: controller.calendarFormat,
                  headerStyle: const HeaderStyle(
                    headerMargin: EdgeInsets.fromLTRB(40.0, 10.0, 40.0, 10.0),
                    titleCentered: true,
                    formatButtonVisible: false,
                    leftChevronIcon: Icon(Icons.arrow_left),
                    rightChevronIcon: Icon(Icons.arrow_right),
                    titleTextStyle: TextStyle(fontSize: 17.0),
                  ),
                  calendarStyle: const CalendarStyle(
                    todayDecoration: BoxDecoration(
                      color: Colors.blueAccent,
                      borderRadius: BorderRadius.all(
                        Radius.circular(20.0),
                      ),
                    ),
                    outsideDaysVisible: true,
                    weekendTextStyle: TextStyle(
                      color: Colors.blueAccent,
                    ),
                    holidayTextStyle: TextStyle(
                      color: Colors.redAccent,
                    ),
                  ),
                  selectedDayPredicate: (day) {
                    return isSameDay(controller.selectedDay, day);
                  },
                  onDaySelected: (selectedDay, focusedDay) {
                    if (!isSameDay(controller.selectedDay, selectedDay)) {
                      // controller.selectedDay = selectedDay;
                      // controller.focusedDay = focusedDay;

                      controller.focusChanged(focusedDay);
                    }
                  },
                  onPageChanged: (focusedDay) {
                    //controller.focusedDay = focusedDay;
                    //controller.focusChanged(focusedDay);
                  },
                  locale: 'ko-KR',
                ),
              ),
              const Divider(
                height: 5.0,
                color: Colors.grey,
              ),
              Container(
                height: 25.0,
                padding: EdgeInsets.only(
                  left: 18.0,
                  top: 8.0,
                ),
                alignment: Alignment.centerLeft,
                child: Text(
                  '시간 선택',
                ),
              ),
              Container(
                height: 70.0,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          width: 50.0,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Text('00:00'),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          width: 50.0,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Text('01:00'),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          width: 50.0,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Text('02:00'),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          width: 50.0,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Text('03:00'),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          width: 50.0,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Text('04:00'),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          width: 50.0,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Text('05:00'),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          width: 50.0,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Text('06:00'),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          width: 50.0,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Text('07:00'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 50.0,
              ),
              Container(
                alignment: Alignment.bottomCenter,
                decoration: BoxDecoration(
                  border: const Border(
                    top: BorderSide(width: 5.0, color: Colors.white),
                    //bottom: BorderSide(width: 16.0, color: Colors.lightBlue.shade900),
                  ),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.8),
                      spreadRadius: 4,
                      blurRadius: 2,
                      offset: Offset(0, 1),
                    )
                  ],
                ),
                child: Column(
                  children: [
                    Container(
                      height: 20.0,
                      child: Text(
                        '2022년',
                        style: TextStyle(
                          fontSize: 13.0,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey.shade500,
                        ),
                      ),
                    ),
                    Container(
                      height: 25.0,
                      child: Text(
                        '3월 4일 (금) 00:00',
                        style: TextStyle(
                          fontSize: 22.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Container(
                      height: 50.0,
                      child: Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Container(
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: Colors.redAccent,
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: const Text(
                                  '취소',
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Container(
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: Colors.blueAccent,
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                child: const Text(
                                  '확인',
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/*
class _BottomSheetContent extends StatelessWidget {
  // @override
  // final ReserveScheduleController controller =
  //     Get.put(ReserveScheduleController());
  final ReserveScheduleController controller = Get.find();

  // CalendarFormat _calendarFormat = CalendarFormat.month;
  // DateTime _focusedDay = DateTime.now();
  // DateTime? _selectedDay;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
      ),
      child: Column(
        children: [
          const SizedBox(
            height: 70.0,
            child: Center(
              child: Text(
                '예약 일자를 선택해 주세요',
                style: TextStyle(fontSize: 20.0),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    child: TableCalendar(
                      firstDay: kFirstDay,
                      lastDay: kLastDay,
                      focusedDay: controller.focusedDay,
                      calendarFormat: controller.calendarFormat,
                      headerStyle: const HeaderStyle(
                        headerMargin:
                            EdgeInsets.fromLTRB(40.0, 10.0, 40.0, 10.0),
                        titleCentered: true,
                        formatButtonVisible: false,
                        leftChevronIcon: Icon(Icons.arrow_left),
                        rightChevronIcon: Icon(Icons.arrow_right),
                        titleTextStyle: const TextStyle(fontSize: 17.0),
                      ),
                      calendarStyle: const CalendarStyle(
                        todayDecoration: BoxDecoration(
                          color: Colors.blueAccent,
                          borderRadius: BorderRadius.all(
                            Radius.circular(20.0),
                          ),
                        ),
                        outsideDaysVisible: true,
                        weekendTextStyle: TextStyle(
                          color: Colors.blueAccent,
                        ),
                        holidayTextStyle: TextStyle(
                          color: Colors.redAccent,
                        ),
                      ),
                      selectedDayPredicate: (day) {
                        return isSameDay(controller.selectedDay, day);
                      },
                      onDaySelected: (selectedDay, focusedDay) {
                        if (!isSameDay(controller.selectedDay, selectedDay)) {
                          controller.selectedDay = selectedDay;
                          controller.focusedDay = focusedDay;

                          //print("$selectedDay ::: $focusedDay");
                          controller.focusChanged(focusedDay);
                        }
                      },
                      onPageChanged: (focusedDay) {
                        controller.focusedDay = focusedDay;
                        //controller.focusChanged(focusedDay);
                      },
                      locale: 'ko-KR',
                    ),
                  ),
                  Divider(
                    height: 5.0,
                    color: Colors.grey,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
*/
