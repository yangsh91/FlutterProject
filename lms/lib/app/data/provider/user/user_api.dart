import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';

class UserApiClient {
  final http.Client? httpClient;

  UserApiClient({@required this.httpClient});

  goActUserPass({@required String? no, @required String? new_pass}) async {}
}
