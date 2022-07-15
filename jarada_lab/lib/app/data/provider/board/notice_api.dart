import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:jarada_lab/app/data/model/board/notice_model.dart';

const baseUri = 'http://yangsh.site';

class NoticeApiClient {
  final http.Client? httpClient;

  NoticeApiClient({@required this.httpClient});

  getNoticeList({int? num, String? searchKey}) async {
    try {
      if (num == null) num = 0;
      if (searchKey == null) searchKey = "";

      var data = {
        'type': 'board',
        'mode': 'noticeList',
        'num': num.toString(),
        'searchKey': searchKey,
      };

      print(data);

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
