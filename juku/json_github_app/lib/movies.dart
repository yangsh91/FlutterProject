import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Movies extends StatefulWidget {
  const Movies({Key? key}) : super(key: key);

  @override
  _MoviesState createState() => _MoviesState();
}

class _MoviesState extends State<Movies> {
  late List list;
  final uri =
      'https://raw.githubusercontent.com/zeushahn/Test/main/movies.json';

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
      list = responseData['results'];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('JSON Movie'),
      ),
      body: list.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: list.length,
              itemBuilder: (BuildContext context, int item) {
                return Padding(
                  padding: const EdgeInsets.fromLTRB(15.0, 2.0, 15.0, 3.0),
                  child: Card(
                    child: Row(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.2,
                          child: Image.network(
                            list[item]['image'],
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(
                          width: 15.0,
                        ),
                        Container(
                          child: Text(
                            '${list[item]['title']}',
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}
