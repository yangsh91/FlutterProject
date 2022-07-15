import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late List data;
  final String uri =
      'https://raw.githubusercontent.com/zeushahn/Test/main/student2.json';

  @override
  void initState() {
    data = [];
    _getJsonList();
    super.initState();
  }

  Future<bool> _getJsonList() async {
    var url = Uri.parse(uri);
    var response = await http.get(url);
    if (response.statusCode == 200) {
      //Iterable jsonResponse = json.decode(response.body);
      setState(() {
        var dataConvertedJson = json.decode(utf8.decode(response.bodyBytes));
        List result = dataConvertedJson['results'];
        data = result;
      });
    }

    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GET JSON'),
      ),
      body: data.isEmpty
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemBuilder: (BuildContext context, int item) {
                return Card(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            const Text(
                              'Code : ',
                              style: TextStyle(
                                fontSize: 22.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              '${data[item]['code'].toString()}',
                              style: TextStyle(
                                fontSize: 22.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            const Text(
                              'Name : ',
                              style: TextStyle(
                                fontSize: 22.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              '${data[item]['name'].toString()}',
                              style: TextStyle(
                                fontSize: 22.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            const Text(
                              'Dept : ',
                              style: TextStyle(
                                fontSize: 22.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              '${data[item]['dept'].toString()}',
                              style: TextStyle(
                                fontSize: 22.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            const Text(
                              'Phone : ',
                              style: TextStyle(
                                fontSize: 22.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              '${data[item]['phone'].toString()}',
                              style: TextStyle(
                                fontSize: 22.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  /*
            child: Container(
              child: data.isEmpty
                  ? const Text(
                      '데이터가 존재하지 않습니다.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 22.0,
                      ),
                    )
                  : Text(
                      '${data[item]['name']} (${data[item]['dept']})',
                      style: const TextStyle(fontSize: 22.0),
                    ),
            ),*/
                );
              },
              itemCount: data.length,
            ),
    );
  }
}
