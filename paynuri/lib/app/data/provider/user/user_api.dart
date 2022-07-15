import 'dart:convert';

import 'package:http/http.dart' as http;

const baseUri = 'http://yangsh.site';

class UserApiClient {
  final http.Client? httpClient;

  UserApiClient({required this.httpClient});

  getLogin({required String user_id, required String user_pw}) async {
    try {
      var data = {
        'type': 'member',
        'mode': 'login',
        'user_id': user_id,
        'user_pw': user_pw,
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
      print(_.toString());
    }
  }
}
