import 'package:flutter/material.dart';

class ReceiveMail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text('Received Mail'),
      ),
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 35.0,
          ),
          Container(
            padding: EdgeInsets.only(left: 10.0),
            child: Text('유비에게서 온 메일'),
          ),
          Container(
            padding: EdgeInsets.only(left: 10.0),
            child: Text('관우에게서 온 메일'),
          ),
          Container(
            padding: EdgeInsets.only(left: 10.0),
            child: Text('장비에게서 온 메일'),
          ),
        ],
      ),
    );
  }
}
