import 'package:flutter/material.dart';

class CalculateTest extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => CalculateTestState();
}

class CalculateTestState extends State<CalculateTest> {
  late TextEditingController text1, text2;
  int total = 0;

  @override
  void initState() {
    text1 = TextEditingController();
    text2 = TextEditingController();
    super.initState();
  }

  void _onCalculate(String num1, String num2) {
    setState(() {
      if (num1 == "" || num2 == "") {
        String text = '숫자를 입력해 주세요.';
        _showSnackBar(text);
      } else {
        total = int.parse(num1) + int.parse(num2);
      }
    });
  }

  void _showSnackBar(String text) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.redAccent,
        content: Text(text),
        action: SnackBarAction(
          label: 'Action',
          onPressed: () {
            // Code to execute.
          },
        ),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('덧셈 구하기'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(10.0, 30.0, 10.0, 0),
              width: MediaQuery.of(context).size.width * 0.8,
              child: TextField(
                controller: text1,
                decoration: const InputDecoration(
                  hintText: '첫번째 숫자를 입력하세요.',
                  labelText: '첫번째 숫자를 입력하세요.',
                ),
                keyboardType: TextInputType.number,
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
              width: MediaQuery.of(context).size.width * 0.8,
              child: TextField(
                controller: text2,
                decoration: const InputDecoration(
                  hintText: '두번째 숫자를 입력하세요.',
                  labelText: '두번째 숫자를 입력하세요.',
                ),
                keyboardType: TextInputType.number,
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            ElevatedButton(
                onPressed: () => _onCalculate(text1.text, text2.text),
                child: Text('덧셈 계산')),
            const SizedBox(
              height: 50.0,
            ),
            Container(
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    '입력하신 숫자의 합은 ',
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    total.toString(),
                    style: const TextStyle(
                      fontSize: 23.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                    ),
                  ),
                  const Text(
                    ' 입니다.',
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
