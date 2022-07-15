import 'package:flutter/material.dart';

class TextWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => TextWidgetState();
}

class TextWidgetState extends State<TextWidget> {
  late TextEditingController inputText;
  late String inputValue;
  late Color snackBarColor;

  void initState() {
    inputText = TextEditingController();
    super.initState();
  }

  void _onSubmitted(BuildContext context, String text) {
    String string;

    if (text != "") {
      string = text;
      snackBarColor = Colors.blueAccent;
    } else {
      string = '내용을 입력하세요.';
      snackBarColor = Colors.redAccent;
    }

    setState(() {
      _showSnackBar(context, string, snackBarColor);
    });
  }

  void _showSnackBar(BuildContext context, String text, Color snackBar) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: snackBar,
        content: Text(text),
        action: SnackBarAction(
          label: 'Action',
          onPressed: () {
            // Code to execute.
          },
        ),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('TextField'),
        ),
        body: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(15.0),
              child: TextFormField(
                controller: inputText,
                decoration: const InputDecoration(
                  hintText: '글자를 입력하세요.',
                  labelText: '글자를 입력하세요.',
                ),
                keyboardType: TextInputType.text,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                String text = inputText.text;
                _onSubmitted(context, text);
              },
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
