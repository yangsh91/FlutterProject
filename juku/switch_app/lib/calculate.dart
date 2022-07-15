import 'package:flutter/material.dart';

class Calculate extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => CalculateState();
}

class CalculateState extends State<Calculate> {
  late TextEditingController inputText1, inputText2;
  int total = 0;

  @override
  void initState() {
    inputText1 = TextEditingController();
    inputText2 = TextEditingController();
    super.initState();
  }

  void _onCalculate(int num1, int num2) {
    setState(() {
      total = num1 + num2;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('간단한 덧셈 계산기'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.fromLTRB(0, 10.0, 0, 10.0),
            child: Text(
              '덧셈 결과 : $total',
              style: TextStyle(
                fontSize: 20.0,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
            width: MediaQuery.of(context).size.width * 0.8,
            child: TextFormField(
              controller: inputText1,
              decoration: const InputDecoration(
                hintText: '숫자를 입력하세요.',
              ),
              keyboardType: TextInputType.number,
            ),
          ),
          SizedBox(height: 8.0),
          Container(
            padding: const EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
            width: MediaQuery.of(context).size.width * 0.8,
            child: TextFormField(
              controller: inputText2,
              decoration: const InputDecoration(
                hintText: '숫자를 입력하세요.',
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
            child: ElevatedButton(
              onPressed: () => _onCalculate(
                  int.parse(inputText1.text), int.parse(inputText2.text)),
              child: Row(
                children: const [
                  Icon(Icons.calculate_outlined),
                  SizedBox(
                    width: 10.0,
                  ),
                  Text('Calculate'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
