import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:jarada_lab/app/data/model/board/notice_model.dart';

const baseUri = 'http://yangsh.site';

class MyHomeApiClient {
  final http.Client? httpClient;

  MyHomeApiClient({required this.httpClient});

  getNoticeList() async {
    try {
      var data = {
        'type': 'board',
        'mode': 'noticeSample',
      };

      var response = await httpClient!.post(
        Uri.parse(baseUri),
        headers: {"Accept": "application/json"},
        body: data,
      );

      if (response.statusCode == 200) {
        Iterable jsonResponse = json.decode(response.body);

        List<NoticeModel> noticeList =
            jsonResponse.map((e) => NoticeModel.fromJson(e)).toList();

        return noticeList;
      }
    } catch (_) {
      print(_.toString());
    }
  }
}
