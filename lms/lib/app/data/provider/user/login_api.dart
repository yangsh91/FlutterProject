import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';

const baseUri = 'https://yangsh-blog.com/json/';

class LoginApiClient {
  final http.Client? httpClient;

  LoginApiClient({@required this.httpClient});

  goActLogin({@required String? user_id, @required String? user_pw}) async {
    try {
      var data = {
        'type': 'member',
        'mode': 'login',
        'user_id': user_id.toString(),
        'user_pw': user_pw.toString(),
      };

      var response = await httpClient!.post(
        Uri.parse(baseUri),
        headers: {"Accept": "application/json"},
        body: data,
      );

      if (response.statusCode == 200) {
        var jsonResponse = json.decode(response.body);
        return jsonResponse;
      }
    } catch (_) {
      print("login error");
    }
  }
}
