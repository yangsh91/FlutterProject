import 'package:flutter/material.dart';

class First extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => FirstState();
}

class FirstState extends State<First> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.redAccent,
      appBar: AppBar(
        title: const Text('피카추 이미지 FIRST'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 100.0,
              height: 100.0,
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/images/pikachu-1.jpg'),
              ),
            ),
            const SizedBox(
              height: 16.0,
            ),
            Container(
              width: 100.0,
              height: 100.0,
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/images/pikachu-2.jpg'),
              ),
            ),
            const SizedBox(
              height: 16.0,
            ),
            Container(
              width: 100.0,
              height: 100.0,
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/images/pikachu-3.jpg'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
