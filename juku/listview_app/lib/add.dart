import 'package:flutter/material.dart';
import 'package:listview_app/message.dart';

class Add extends StatefulWidget {
  const Add({Key? key}) : super(key: key);

  @override
  _AddState createState() => _AddState();
}

class _AddState extends State<Add> {
  late TextEditingController textController;

  @override
  void initState() {
    textController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("ADD VIEW"),
        ),
        body: Column(
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(20.0, 10.0, 5.0, 20.0),
              child: TextField(
                controller: textController,
                decoration: const InputDecoration(labelText: '목록을 입력해 주세요.'),
              ),
            ),
            const SizedBox(
              height: 15.0,
            ),
            ElevatedButton(
              onPressed: () => addList(),
              child: Text('입력'),
            ),
          ],
        ));
  }

  void addList() {
    if (textController.text.trim() != "") {
      Message.imgPath = 'assets/images/pencil.png';
      Message.workList = textController.text;
      Message.actions = true;
      Navigator.pop(context);
    } else {
      Navigator.pop(context);
    }
  }
}
