import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: Text('Second Page'),
      ),
      body: Center(
        child: Text('2번째 페이지 입니다.'),
      ),
    );
  }
}
