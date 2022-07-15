import 'package:flutter/material.dart';

class CalculateAll extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => CalculateAllState();
}

class CalculateAllState extends State<CalculateAll> {
  late TextEditingController text1, text2, plus, minus, multiple, division;
  int total = 0;

  @override
  void initState() {
    text1 = TextEditingController();
    text2 = TextEditingController();
    plus = TextEditingController();
    minus = TextEditingController();
    multiple = TextEditingController();
    division = TextEditingController();
    super.initState();
  }

  void _onCalculate(String num1, String num2) {
    setState(() {
      if (num1 == "" || num2 == "") {
        String text = '숫자를 입력해 주세요.';
        _showSnackBar(text);
      } else {
        total = int.parse(num1) + int.parse(num2);

        plus.text = (int.parse(num1) + int.parse(num2)).toString();
        minus.text = (int.parse(num1) - int.parse(num2)).toString();
        multiple.text = (int.parse(num1) * int.parse(num2)).toString();
        division.text = (int.parse(num1) / int.parse(num2)).toString();
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

  void _allClear() {
    setState(() {
      text1.text = "";
      text2.text = "";
      plus.text = "";
      minus.text = "";
      multiple.text = "";
      division.text = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('간단한 계산기'),
        ),
        body: SingleChildScrollView(
          child: Column(
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () => _onCalculate(text1.text, text2.text),
                    child: Text('계산하기'),
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                  ElevatedButton(
                    onPressed: () => _allClear(),
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.redAccent),
                    ),
                    child: Text('지우기'),
                  ),
                ],
              ),
              const SizedBox(
                height: 15.0,
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(10.0, 30.0, 10.0, 0),
                width: MediaQuery.of(context).size.width * 0.8,
                child: TextField(
                  controller: plus,
                  readOnly: true,
                  decoration: const InputDecoration(
                    labelText: '더하기',
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
              SizedBox(
                height: 8.0,
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(10.0, 30.0, 10.0, 0),
                width: MediaQuery.of(context).size.width * 0.8,
                child: TextField(
                  controller: minus,
                  readOnly: true,
                  decoration: const InputDecoration(
                    labelText: '빼기',
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
              SizedBox(
                height: 8.0,
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(10.0, 30.0, 10.0, 0),
                width: MediaQuery.of(context).size.width * 0.8,
                child: TextField(
                  controller: multiple,
                  readOnly: true,
                  decoration: const InputDecoration(
                    labelText: '곱하기',
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
              SizedBox(
                height: 8.0,
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(10.0, 30.0, 10.0, 0),
                width: MediaQuery.of(context).size.width * 0.8,
                child: TextField(
                  controller: division,
                  readOnly: true,
                  decoration: const InputDecoration(
                    labelText: '나누기',
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
              SizedBox(
                height: 8.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
