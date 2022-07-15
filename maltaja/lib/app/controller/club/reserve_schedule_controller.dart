import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';

class ReserveScheduleController extends GetxController {
  CalendarFormat calendarFormat = CalendarFormat.month;
  late Rx<DateTime> focusedDay;
  DateTime? selectedDay;

  @override
  void onInit() {
    // calendarFormat = CalendarFormat.month;
    focusedDay = DateTime.now().obs;

    print(" ----${focusedDay.value}----");

    super.onInit();
  }

  void focusChanged(DateTime focusingDay) {
    print("[[[ ${focusingDay.year} ]]]");
    selectedDay = focusingDay;
    focusedDay.value = focusingDay;
  }
}

final kToday = DateTime.now();
final kFirstDay = DateTime(kToday.year, kToday.month - 3, kToday.day);
final kLastDay = DateTime(kToday.year, kToday.month + 3, kToday.day);
