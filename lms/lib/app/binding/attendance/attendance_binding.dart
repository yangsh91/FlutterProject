import 'package:get/instance_manager.dart';
import 'package:http/http.dart' as http;
import 'package:lms/app/controller/attendance/attendace_controller.dart';
import 'package:lms/app/data/provider/attendance/attendance_api.dart';
import 'package:lms/app/data/repository/attendance_repository.dart';

class AttendanceBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AttendanceController>(() {
      return AttendanceController(
          repository: AttendanceRepository(
              attendanceApiClient:
                  AttendanceApiClient(httpClient: http.Client())));
    });
  }
}
