import 'package:flutter/material.dart';
import './snackbar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
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
        title: Text('SnackBar'),
      ),
      /*
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            print("pushed");
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: Colors.red,
                content: Text('ElevatedButton is Clicked..'),
                duration: Duration(seconds: 2),
              ),
            );
          },
          child: const Text('SnackBar'),
        ),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            snackBarFunction(context);
          },
          child: const Text('SnackBar'),
        ),
      ),
      */
      body: const MySnackBar(),
    );
  }
}
