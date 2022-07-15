import 'package:flutter/material.dart';

class Second extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => SecondState();
}

class SecondState extends State<Second> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second'),
      ),
      body: Center(
        child: Text('second'),
      ),
    );
  }
}
