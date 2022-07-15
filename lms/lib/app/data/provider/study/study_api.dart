import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';
import 'package:lms/app/data/model/study/study_model.dart';

const baseUri = 'https://yangsh-blog.com/json/';

class StudyApiClient {
  final http.Client? httpClient;

  StudyApiClient({@required this.httpClient});

  getTestList({String? user_id}) async {
    print("======= api =======");

    try {
      var data = {
        'type': 'test',
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

        print("===== studt =====");
        print(jsonResponse);
        print("===== studt =====");

        List<StudyModel> testList =
            jsonResponse.map((model) => StudyModel.fromJson(model)).toList();

        return testList;
      }
    } catch (_) {
      print("login error");
    }
  }
}
