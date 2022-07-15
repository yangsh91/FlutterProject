import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HomeState();
}

class HomeState extends State<Home> {
  bool chk = false;
  var stat = 'OFF';
  Color btnColor = Colors.orangeAccent;

  @override
  void initState() {
    print(" ==== initState ====");
    super.initState();
  }

  @override
  void deactivate() {
    print(" ==== deactivate ====");
    super.deactivate();
  }

  @override
  void dispose() {
    print(" ==== dispose ====");
    super.dispose();
  }

  void _pushButton() {
    setState(() {
      if (chk == false) {
        chk = true;
        stat = 'ON';
        btnColor = Colors.blueAccent;
      } else if (chk == true) {
        chk = false;
        stat = 'OFF';
        btnColor = Colors.orangeAccent;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LifeCycle StatefulWidget'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => _pushButton(),
              child: const Text('Push this button'),
              style: ElevatedButton.styleFrom(
                primary: btnColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
            const SizedBox(
              height: 30.0,
            ),
            Text('버튼 상테 : $stat'),
          ],
        ),
      ),
    );
  }
}
