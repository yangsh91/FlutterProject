import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const MyTextWidget(),
    );
  }
}

class MyTextWidget extends StatelessWidget {
  const MyTextWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Text Exercise 01'),
        centerTitle: false,
        backgroundColor: Colors.green.shade400,
        //foregroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Text('유비'),
            Text('관우'),
            Text('장비'),
            //SizedBox(height: 30.0),
            Divider(
              height: 50.0,
              color: Colors.grey,
              thickness: 1.0,
            ),
            Text(
              '조조',
              style: TextStyle(
                  color: Colors.brown,
                  fontWeight: FontWeight.bold,
                  fontSize: 25.0,
                  letterSpacing: 2.0),
            ),
            Text('여포'),
            Text('동탁'),
          ],
        ),
      ),
    );
  }
}
