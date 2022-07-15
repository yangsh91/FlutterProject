import 'package:flutter/material.dart';

void main() {
  runApp(MyHomePageApp());
}

class MyHomePageApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Text Row'),
        //centerTitle: false,
        toolbarHeight: 40.0,
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Text('James'),
            SizedBox(width: 20.0),
            Text('Cathy'),
            SizedBox(width: 20.0),
            Text('Kenny'),
          ],
        ),
      ),
    );
  }
}
