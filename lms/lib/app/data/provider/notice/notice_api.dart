import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';
import 'package:lms/app/data/model/notice/notice_model.dart';

const baseUri = 'https://yangsh-blog.com/json/';

class NoticeApiClient {
  final http.Client? httpClient;

  NoticeApiClient({@required this.httpClient});

  getList({int? num}) async {
    try {
      if (num == null) num = 0;

      var data = {
        'type': 'board',
        'mode': 'notify',
        'page': num.toString(),
      };

      var response = await httpClient!.post(
        Uri.parse(baseUri),
        headers: {"Accept": "application/json"},
        body: data,
      );

      if (response.statusCode == 200) {
        Iterable jsonResponse = json.decode(response.body);

        List<NoticeModel> noticeList =
            jsonResponse.map((model) => NoticeModel.fromJson(model)).toList();

        return noticeList;
      }
    } catch (_) {
      print("getList error");
    }
  }
}
