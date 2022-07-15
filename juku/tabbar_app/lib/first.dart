import 'package:flutter/material.dart';

class First extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => FirstState();
}

class FirstState extends State<First> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('First'),
      ),
      body: Center(
        child: Text('first'),
      ),
    );
  }
}
