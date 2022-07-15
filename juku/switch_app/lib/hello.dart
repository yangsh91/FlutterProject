import 'package:flutter/material.dart';

class Hello extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HelloState();
}

class HelloState extends State<Hello> {
  late bool _setState;
  late Color btnColor;
  late String txt;

  @override
  void initState() {
    super.initState();
    _setState = true;
    btnColor = Colors.blueAccent;
    txt = 'Hello';
  }

  void _onButtonClicked() {
    setState(() {
      if (_setState == true) {
        _setState = false;
        btnColor = Colors.orangeAccent;
        txt = 'Flutter';
      } else if (_setState == false) {
        _setState = true;
        btnColor = Colors.blueAccent;
        txt = 'Hello';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Change button color & text'),
        backgroundColor: btnColor,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => _onButtonClicked(),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(btnColor),
          ),
          child: Text('${txt}'),
        ),
      ),
    );
  }
}
