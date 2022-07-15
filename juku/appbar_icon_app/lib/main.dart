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
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AppBar'),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.menu),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.email),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.add_alarm),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.add_outlined),
          ),
          GestureDetector(
            onTap: () {},
            child: Image.asset(
              'assets/images/smile.png',
              width: 25.0,
              height: 25.0,
            ),
          ),
        ],
      ),
      body: Center(
        child: Text('AppBar Icon'),
      ),
    );
  }
}
