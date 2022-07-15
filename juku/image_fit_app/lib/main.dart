import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: const Text(
          'Image Fit',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: false,
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.all(5.0),
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/images/pikachu-1.jpg'),
                radius: 50.0,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 5, 10, 0),
                  child: CircleAvatar(
                    backgroundImage: AssetImage('assets/images/pikachu-2.jpg'),
                    radius: 50.0,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(10, 5, 0, 0),
                  child: CircleAvatar(
                    backgroundImage: AssetImage('assets/images/pikachu-3.jpg'),
                    radius: 50.0,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
