import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:paynuri_test/screens/payment.dart';
import 'package:paynuri_test/screens/payment_test.dart';
import 'package:paynuri_test/screens/payment_result.dart';

void main() {
  runApp(PaynuriApp());
}

class PaynuriApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _PaynuriAppState();
}

class _PaynuriAppState extends State<PaynuriApp> {
  static const Color primaryColor = Color(0xff344e81);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: '/',
      theme: ThemeData(
        primaryColor: primaryColor,
      ),
      getPages: [
        GetPage(
          name: '/',
          page: () => PaymentTest(),
        ),
        GetPage(
          name: '/payment',
          page: () => Payment(),
        ),
        GetPage(
          name: '/result',
          page: () => PaymentResult(),
        ),
      ],
    );
  }
}
