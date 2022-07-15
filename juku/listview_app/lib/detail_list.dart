import 'package:flutter/material.dart';
import 'package:listview_app/message.dart';

class DetailList extends StatefulWidget {
  const DetailList({Key? key}) : super(key: key);

  @override
  _DetailListState createState() => _DetailListState();
}

class _DetailListState extends State<DetailList> {
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
