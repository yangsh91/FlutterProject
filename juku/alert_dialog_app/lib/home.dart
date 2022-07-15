import 'package:alert_dialog_app/second_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Alert and Push'),
      ),
      body: Center(
        child: GestureDetector(
          onTap: () => _showDialog(context),
          child: const Text('Hello World!!'),
        ),
        /*
        child: CupertinoButton(
          onPressed: () => _onDialog(context),
          child: const Text('Hello World!!'),
        ),
        */
      ),
    );
  }

  _showDialog(context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Page 이동'),
            content: const SingleChildScrollView(
              child: Text('아래의 버튼을 누르면 페이지 이동을 합니다.'),
            ),
            actions: <Widget>[
              TextButton(
                child: const Text('취소'),
                onPressed: () => Navigator.pop(context),
              ),
              TextButton(
                child: const Text('확인'),
                //onPressed: () => Navigator.pushNamed(context, '/second'),
                onPressed: () => Navigator.push(context,
                    MaterialPageRoute(builder: ((context) => SecondPage()))),
              ),
            ],
          );
        });
  }

  Future<void> _onDialog(BuildContext context) {
    return showCupertinoDialog<void>(
      context: context,
      builder: (BuildContext context) => CupertinoAlertDialog(
        title: const Text('경고'),
        content: const Text('버튼을 누르셨습니까?'),
        actions: <CupertinoDialogAction>[
          CupertinoDialogAction(
            child: const Text('예'),
            isDestructiveAction: true,
            onPressed: () {},
          ),
          CupertinoDialogAction(
            child: const Text('아니오'),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
