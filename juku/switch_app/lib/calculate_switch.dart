import 'package:flutter/material.dart';

class CalculateSwitch extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => CalculateSwitchState();
}

class CalculateSwitchState extends State<CalculateSwitch> {
  late TextEditingController text1, text2, plus, minus, multiple, division;
  late bool plusBool, minusBool, multipleBool, divisionBool;

  @override
  void initState() {
    text1 = TextEditingController();
    text2 = TextEditingController();
    plus = TextEditingController();
    minus = TextEditingController();
    multiple = TextEditingController();
    division = TextEditingController();

    plusBool = false;
    minusBool = false;
    multipleBool = false;
    divisionBool = false;
    super.initState();
  }

  void _onCalculate(String num1, String num2) {
    setState(() {
      if (num1 == "" || num2 == "") {
        String text = '숫자를 입력해 주세요.';
        _showSnackBar(text);
      } else {
        // total = int.parse(num1) + int.parse(num2);
        if (plusBool == true) {
          plus.text = (int.parse(num1) + int.parse(num2)).toString();
        }

        if (minusBool == true) {
          minus.text = (int.parse(num1) - int.parse(num2)).toString();
        }

        if (multipleBool == true) {
          multiple.text = (int.parse(num1) * int.parse(num2)).toString();
        }

        if (divisionBool == true) {
          division.text = (int.parse(num1) / int.parse(num2)).toString();
        }
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

  void _onChangeBool(type, val) {
    setState(() {
      if (type == "plus") {
        if (val != null) {
          val = plusBool;
          if (val == false) {
            plusBool = true;
            print("!!!");
          } else {
            plusBool = false;
            print("...");
          }
        } else {
          if (val == false) {
            plusBool = true;
          } else {
            plusBool = false;
          }
        }
      } else if (type == "minus") {
        if (val != null) {
          val = minusBool;
          if (val == false) {
            minusBool = true;
          } else {
            minusBool = false;
          }
        } else {
          if (val == false) {
            minusBool = true;
          } else {
            minusBool = false;
          }
        }
      } else if (type == "multiple") {
        if (val != null) {
          val = multipleBool;
          if (val == false) {
            multipleBool = true;
          } else {
            multipleBool = false;
          }
        } else {
          if (val == false) {
            multipleBool = true;
          } else {
            multipleBool = false;
          }
        }
      } else if (type == "division") {
        if (val != null) {
          val = divisionBool;
          if (val == false) {
            divisionBool = true;
          } else {
            divisionBool = false;
          }
        } else {
          if (val == false) {
            divisionBool = true;
          } else {
            divisionBool = false;
          }
        }
      }
    });
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
          title: const Text('간단한 계산기'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.fromLTRB(10.0, 30.0, 10.0, 0),
                width: MediaQuery.of(context).size.width * 1,
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
                width: MediaQuery.of(context).size.width * 1,
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
                  const SizedBox(
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
              Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        alignment: Alignment.center,
                        child: Text('덧셈'),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        child: Switch(
                          value: plusBool,
                          onChanged: (value) => _onChangeBool("plus", value),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        alignment: Alignment.center,
                        child: Text('뺄셈'),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        child: Switch(
                          value: minusBool,
                          onChanged: (value) => _onChangeBool("minus", value),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        alignment: Alignment.center,
                        child: Text('곱셉'),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        child: Switch(
                          value: multipleBool,
                          onChanged: (value) =>
                              _onChangeBool("multiple", value),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        alignment: Alignment.center,
                        child: Text('나눗셈'),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        child: Switch(
                          value: divisionBool,
                          onChanged: (value) =>
                              _onChangeBool("division", value),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(10.0, 30.0, 10.0, 0),
                width: MediaQuery.of(context).size.width * 1,
                child: TextField(
                  controller: plus,
                  readOnly: true,
                  decoration: const InputDecoration(
                    labelText: '덧셈 결과',
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
              const SizedBox(
                height: 8.0,
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(10.0, 30.0, 10.0, 0),
                width: MediaQuery.of(context).size.width * 1,
                child: TextField(
                  controller: minus,
                  readOnly: true,
                  decoration: const InputDecoration(
                    labelText: '뺄셈 결과',
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
              const SizedBox(
                height: 8.0,
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(10.0, 30.0, 10.0, 0),
                width: MediaQuery.of(context).size.width * 1,
                child: TextField(
                  controller: multiple,
                  readOnly: true,
                  decoration: const InputDecoration(
                    labelText: '곱셈 결과',
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
              const SizedBox(
                height: 8.0,
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(10.0, 30.0, 10.0, 0),
                width: MediaQuery.of(context).size.width * 1,
                child: TextField(
                  controller: division,
                  readOnly: true,
                  decoration: const InputDecoration(
                    labelText: '나눗셈 결과',
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
