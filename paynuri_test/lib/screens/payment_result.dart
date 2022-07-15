import 'package:flutter/material.dart';

class PaymentResult extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _PaymentResultState();
}

class _PaymentResultState extends State<PaymentResult> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('페이누리 결제결과 테스트'),
      ),
      body: Center(
        child: Text('Test'),
      ),
    );
  }
}
