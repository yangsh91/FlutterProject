import 'package:flutter/material.dart';

class ButtonSwitch extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ButtonSwitchState();
}

class ButtonSwitchState extends State<ButtonSwitch> {
  late bool chk;
  late Color btnColor;
  String btnTxt = 'Flutter';

  @override
  void initState() {
    chk = false;
    btnColor = Colors.blueAccent;

    super.initState();
  }

  void _onChange({bool? chgVal}) {
    setState(() {
      if (chgVal != null) {
        chk = chgVal;

        if (chk == true) {
          btnColor = Colors.redAccent;
        } else if (chk == false) {
          btnColor = Colors.blueAccent;
        }
      } else {
        if (chk == true) {
          chk = false;
          btnColor = Colors.blueAccent;
        } else if (chk == false) {
          chk = true;
          btnColor = Colors.redAccent;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Change Button color and switch'),
        backgroundColor: btnColor,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => _onChange(),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(btnColor),
              ),
              child: Text(btnTxt),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Switch(
              value: chk,
              onChanged: (value) => _onChange(chgVal: value),
            ),
          ],
        ),
      ),
    );
  }
}
