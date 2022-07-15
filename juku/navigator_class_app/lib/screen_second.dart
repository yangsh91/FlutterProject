import 'package:flutter/material.dart';

class ScreenSecond extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Screen'),
        backgroundColor: Colors.red,
      ),
      body: const Center(
        child: Text('Second Screen'),
      ),
    );
  }
}
