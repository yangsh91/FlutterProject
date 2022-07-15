import 'package:flutter/material.dart';

class SendMail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text('Received Mail'),
      ),
      body: Column(
        children: <Widget>[
          const SizedBox(
            height: 35.0,
          ),
          Container(
            padding: EdgeInsets.only(left: 10.0),
            child: const Text('유비에게 보낸 메일'),
          ),
          Container(
            padding: EdgeInsets.only(left: 10.0),
            child: const Text('관우에게 보낸 메일'),
          ),
          Container(
            padding: EdgeInsets.only(left: 10.0),
            child: const Text('장비에게 보낸 메일'),
          ),
        ],
      ),
    );
  }
}
