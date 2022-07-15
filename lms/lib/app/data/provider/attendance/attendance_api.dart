import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';
import 'package:lms/app/data/model/attendance/attendance_model.dart';

const baseUri = 'https://yangsh-blog.com/json/';

class AttendanceApiClient {
  final http.Client? httpClient;

  AttendanceApiClient({@required this.httpClient});

  getList({String? user_id}) async {
    try {
      var data = {
        'type': 'attendance',
        'mode': 'list',
        'user_id': user_id.toString(),
      };

      var response = await httpClient!.post(
        Uri.parse(baseUri),
        headers: {"Accept": "application/json"},
        body: data,
      );

      if (response.statusCode == 200) {
        Iterable jsonResponse = json.decode(response.body);
        List<AttendanceModel> atendanceList = jsonResponse
            .map((model) => AttendanceModel.fromJson(model))
            .toList();
        return atendanceList;
      }
    } catch (_) {
      print("getList error");
    }
  }

  getDetail({String? user_id, String? atd_dt}) async {
    try {
      var data = {
        'type': 'attendance',
        'mode': 'detail',
        'user_id': user_id.toString(),
        'atd_dt': atd_dt.toString()
      };

      var response = await httpClient!.post(
        Uri.parse(baseUri),
        headers: {"Accept": "application/json"},
        body: data,
      );

      if (response.statusCode == 200) {
        Iterable jsonResponse = json.decode(response.body);

        List<AttendanceModel> dtlList = jsonResponse
            .map((model) => AttendanceModel.fromDetailJson(model))
            .toList();

        return dtlList;
      }
    } catch (_) {
      print("getDetail error");
    }
  }
}
