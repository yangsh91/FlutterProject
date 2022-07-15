import 'dart:convert';
import 'package:http/http.dart' as http;

const baseUri = 'http://yangsh.site';

class HomeApiClient {
  final http.Client? httpClient;

  HomeApiClient({required this.httpClient});
}
