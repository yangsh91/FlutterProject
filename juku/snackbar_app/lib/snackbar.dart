import 'package:flutter/material.dart';

class MySnackBar extends StatelessWidget {
  const MySnackBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          snackBarFunction(context);
        },
        child: const Text('SnackBar'),
      ),
    );
  }
}

// Function
snackBarFunction(BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: Colors.red,
      content: Text('ElevatedButton is Clicked..'),
      duration: Duration(seconds: 2),
    ),
  );
}
