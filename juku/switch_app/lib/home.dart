import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HomeState();
}

class HomeState extends State<Home> {
  late bool switchValue;

  @override
  void initState() {
    switchValue = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Switch StatefulWidget'),
      ),
      body: Center(
        child: Switch(
          value: switchValue,
          onChanged: (changeStat) {
            setState(() {
              switchValue = changeStat;
            });
          },
        ),
      ),
    );
  }
}
