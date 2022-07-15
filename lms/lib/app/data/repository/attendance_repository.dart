import 'package:meta/meta.dart';
import 'package:lms/app/data/provider/attendance/attendance_api.dart';

class AttendanceRepository {
  final AttendanceApiClient? attendanceApiClient;

  AttendanceRepository({@required this.attendanceApiClient})
      : assert(attendanceApiClient != null);

  getList({String? user_id}) {
    return attendanceApiClient?.getList(user_id: user_id);
  }

  getDetail({String? user_id, String? atd_dt}) {
    return attendanceApiClient?.getDetail(user_id: user_id, atd_dt: atd_dt);
  }
}
