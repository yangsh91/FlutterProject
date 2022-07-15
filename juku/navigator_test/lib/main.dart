import 'package:flutter/material.dart';
import './root.dart';
import './receive_mail.dart';
import './send_mail.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      initialRoute: '/',
      routes: {
        '/': (context) => Root(),
        '/send_mail': (context) => SendMail(),
        '/receive_mail': (context) => ReceiveMail(),
      },
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
