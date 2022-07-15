import 'package:flutter/material.dart';

class ScreenFirst extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('First Screen'),
        backgroundColor: Colors.green,
      ),
      body: const Center(
        child: Text('First Screen'),
      ),
    );
  }
}
