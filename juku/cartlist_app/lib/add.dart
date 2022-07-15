import 'package:flutter/material.dart';
import 'package:cartlist_app/message.dart';

class Add extends StatefulWidget {
  const Add({Key? key}) : super(key: key);

  @override
  _AddState createState() => _AddState();
}

class _AddState extends State<Add> {
  late TextEditingController textController;
  late bool cartBool, clockBool, pencilBool;
  String imgPath = '';

  @override
  void initState() {
    textController = TextEditingController();
    cartBool = false;
    clockBool = false;
    pencilBool = false;
    super.initState();
  }

  void _switchChange(String type, bool val) {
    setState(() {
      if (type == "cart") {
        val = cartBool;
        if (val == false) {
          cartBool = true;
          clockBool = false;
          pencilBool = false;
        } else {
          cartBool = false;
        }
      } else if (type == "clock") {
        val = clockBool;
        if (val == false) {
          cartBool = false;
          clockBool = true;
          pencilBool = false;
        } else {
          clockBool = false;
        }
      } else if (type == "pencil") {
        val = pencilBool;
        if (val == false) {
          cartBool = false;
          clockBool = false;
          pencilBool = true;
        } else {
          pencilBool = false;
        }
      }
    });
  }

  void _showSnackBar(String text) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.redAccent,
        content: Text(text),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("ADD VIEW"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: 40.0,
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('구매'),
                  const SizedBox(
                    width: 15.0,
                  ),
                  Switch(
                      value: cartBool,
                      onChanged: (value) => _switchChange('cart', value)),
                  const SizedBox(
                    width: 15.0,
                  ),
                  Container(
                    height: 40.0,
                    width: 40.0,
                    child: CircleAvatar(
                      backgroundImage: AssetImage('assets/images/cart.png'),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('약속'),
                  const SizedBox(
                    width: 15.0,
                  ),
                  Switch(
                      value: clockBool,
                      onChanged: (value) => _switchChange('clock', value)),
                  const SizedBox(
                    width: 15.0,
                  ),
                  Container(
                    height: 40.0,
                    width: 40.0,
                    child: CircleAvatar(
                      backgroundImage: AssetImage('assets/images/clock.png'),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('스터디'),
                  const SizedBox(
                    width: 15.0,
                  ),
                  Switch(
                      value: pencilBool,
                      onChanged: (value) => _switchChange('pencil', value)),
                  const SizedBox(
                    width: 15.0,
                  ),
                  Container(
                    height: 40.0,
                    width: 40.0,
                    child: CircleAvatar(
                      backgroundImage: AssetImage('assets/images/pencil.png'),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 15.0,
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(20.0, 10.0, 5.0, 20.0),
              child: TextField(
                controller: textController,
                decoration: const InputDecoration(labelText: '내용을 입력해 주세요.'),
              ),
            ),
            const SizedBox(
              height: 15.0,
            ),
            ElevatedButton(
              onPressed: () => addList(),
              child: Text('입력'),
            ),
          ],
        ));
  }

  void addList() {
    if (cartBool == true || clockBool == true || pencilBool == true) {
      if (textController.text.trim() != "") {
        if (cartBool == true) {
          imgPath = 'assets/images/cart.png';
        }

        if (clockBool == true) {
          imgPath = 'assets/images/clock.png';
        }

        if (pencilBool == true) {
          imgPath = 'assets/images/pencil.png';
        }
        Message.imgPath = imgPath;
        Message.workList = textController.text;
        Message.actions = true;
        Navigator.pop(context);
      } else {
        _showSnackBar('내용을 입력해 주세요');
      }
    } else {
      _showSnackBar('이미지를 선택해 주세요');
    }
  }
}
