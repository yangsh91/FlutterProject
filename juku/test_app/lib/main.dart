import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const MyHomePageApp(),
    );
  }
}

class MyHomePageApp extends StatelessWidget {
  const MyHomePageApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('title Text'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const <Widget>[
            Text('ruby'),
            SizedBox(
              height: 5.0,
            ),
            Text('ruby2'),
            SizedBox(
              height: 5.0,
            ),
            Text('ruby3'),
          ],
        ),
      ),
    );
  }
}
