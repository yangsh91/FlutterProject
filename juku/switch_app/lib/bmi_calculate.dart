import 'package:flutter/material.dart';
import 'dart:math';

class BmiCalculate extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => BmiCalculateState();
}

class BmiCalculateState extends State<BmiCalculate> {
  late TextEditingController text1, text2;

  String stat = '';
  var bmiText;
  var pic = 'assets/images/bmi.png';

  @override
  void initState() {
    text1 = TextEditingController();
    text2 = TextEditingController();
    super.initState();
  }

  // ex) 키 170㎝에 몸무게 73kg이면, 계산식 : 73 / (1.7×1.7) = 25.26 → 과체중
  void _bmiCalculate(int h, int w) {
    setState(() {
      double height = h / 100;
      double bmi = w / (height * height);
      //bmi = double.parse(bmi.toStringAsFixed(2));
      bmiText = double.parse(bmi.toStringAsFixed(2));
      ;

      if (bmi >= 30) {
        stat = '고도비만';
        pic = 'assets/images/ovese';
      } else if (bmi >= 25 && bmi <= 29.9) {
        stat = '비만';
        pic = 'assets/images/overweight.png';
      } else if (bmi >= 23 && bmi <= 24.9) {
        stat = '과체중';
        pic = 'assets/images/risk.png';
      } else if (bmi >= 18.5 && bmi <= 22.9) {
        stat = '정상체중';
        pic = 'assets/images/normal.png';
      } else {
        stat = '저체중';
        pic = 'assets/images/underweight.png';
      }
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
          title: const Text('BMI 계산기'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.fromLTRB(10.0, 15.0, 10.0, 0),
                width: MediaQuery.of(context).size.width * 1,
                child: TextField(
                  controller: text1,
                  decoration: const InputDecoration(
                    hintText: '신장을 입력하세요 (단위 : cm)',
                    labelText: '신장을 입력하세요 (단위 : cm)',
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
                width: MediaQuery.of(context).size.width * 1,
                child: TextField(
                  controller: text2,
                  decoration: const InputDecoration(
                    hintText: '몸무게를 입력하세요 (단위 : kg)',
                    labelText: '몸무게를 입력하세요 (단위 : kg)',
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              ElevatedButton(
                onPressed: () =>
                    _bmiCalculate(int.parse(text1.text), int.parse(text2.text)),
                child: const Text('BMI 계산'),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Container(
                child: Text(
                  '귀하의 BMI 지수는 ${bmiText} 이고 $stat 입니다.',
                  style: const TextStyle(
                    color: Colors.redAccent,
                    fontSize: 17.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(
                height: 15.0,
              ),
              Container(
                child: Image.asset(
                  pic,
                  fit: BoxFit.cover,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
