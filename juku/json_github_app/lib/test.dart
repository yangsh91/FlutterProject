import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Test extends StatefulWidget {
  const Test({Key? key}) : super(key: key);

  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
  late List list;
  //final uri =
  //    'https://raw.githubusercontent.com/zeushahn/Test/main/movies.json';

  final uri = 'http://localhost:80/info.php';

  void initState() {
    list = [];
    _getJsonData();
    super.initState();
  }

  Future<void> _getJsonData() async {
    var url = Uri.parse(uri);
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var responseData = json.decode(response.body);
      print("==================");
      print("::::: $responseData :::::");
      print("==================");
      //list = responseData['results'];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('JSON Movie'),
      ),
      body: const Center(
        child: Text('server test'),
      ),
    );
  }
}
