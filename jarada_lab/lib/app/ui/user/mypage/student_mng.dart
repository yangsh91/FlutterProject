import 'package:flutter/material.dart';

class StudentMng extends StatelessWidget {
  const StudentMng({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/lab_jarada.png',
              fit: BoxFit.cover,
              color: Colors.grey,
            ),
            const SizedBox(
              height: 10.0,
            ),
            const Text('준비중 입니다.'),
          ],
        ),
      ),
    );
  }
}
