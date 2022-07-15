import 'package:flutter/material.dart';

class ActionButton extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ActionButtonState();
}

class ActionButtonState extends State<ActionButton> {
  int num = 0;

  void _descreaseNum() {
    setState(() {
      num--;
    });
  }

  void _increaseNum() {
    setState(() {
      num++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FloatingActionButton'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('현재 클릭수는 $num 입니다.'),
            const SizedBox(
              height: 10.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                  onPressed: () => _descreaseNum(),
                  backgroundColor: Colors.redAccent,
                  child: const Icon(Icons.remove),
                ),
                const SizedBox(
                  width: 8.0,
                ),
                FloatingActionButton(
                  onPressed: () => _increaseNum(),
                  backgroundColor: Colors.blueAccent,
                  child: const Icon(Icons.add),
                ),
              ],
            ),
          ],
        ),
      ),
      /*
      floatingActionButton: FloatingActionButton(
        onPressed: () => _increaseNum(),
        child: const Icon(Icons.add),
      ),
      */
    );
  }
}
