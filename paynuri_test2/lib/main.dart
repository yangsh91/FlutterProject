import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:paynuri_test2/payment_test.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: '/',
      theme: ThemeData.dark(),
      getPages: [
        GetPage(
          name: '/',
          page: () => PaymentTest(),
        ),
      ],
    );
  }
}
