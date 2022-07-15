import 'package:flutter/material.dart';
import 'package:cartlist_app/message.dart';

class Detail extends StatefulWidget {
  const Detail({Key? key}) : super(key: key);

  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Message.workList),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 120.0,
              height: 120.0,
              child: Image.asset(
                Message.imgPath,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              height: 25.0,
            ),
            Container(
              child: Text(Message.workList),
            )
          ],
        ),
      ),
    );
  }
}
