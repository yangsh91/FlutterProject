import 'package:flutter/material.dart';
import './home.dart';
import './hello.dart';
import 'button_switch.dart';
import 'action_button.dart';
import './text_widget.dart';
import './calculate.dart';
import './calculate_test.dart';
import './calculate_all.dart';
import './calculate_switch.dart';
import './bmi_calculate.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BmiCalculate(),
    );
  }
}
