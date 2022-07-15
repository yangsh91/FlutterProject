import 'package:http/http.dart' as http;

const baseUri = 'http://yangsh.site';

class ManageApiClient {
  final http.Client? httpClient;

  ManageApiClient({required this.httpClient});
}
