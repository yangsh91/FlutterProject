import 'package:flutter/material.dart';
import './screen_first.dart';
import './screen_second.dart';

class Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Main Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () => pageChange(context, 0),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.green),
              ),
              child: const Text('First Screen'),
            ),
            const SizedBox(
              height: 10.0,
            ),
            ElevatedButton(
              onPressed: () => pageChange(context, 1),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.red),
              ),
              child: const Text('Second Screen'),
            ),
          ],
        ),
      ),
    );
  }

  void pageChange(BuildContext context, int pageNo) {
    if (pageNo == 0) {
      // Navigator.push(
      //     context, MaterialPageRoute(builder: (context) => ScreenFirst()));
      Navigator.pushNamed(context, '/first');
    } else if (pageNo == 1) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => ScreenSecond()));
      //Navigator.pushNamed(context, '/second');
    }
  }
}
