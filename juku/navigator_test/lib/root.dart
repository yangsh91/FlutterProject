import 'package:flutter/material.dart';

class Root extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Navigator AppBar'),
        actions: [
          IconButton(
            onPressed: () => Navigator.pushNamed(context, '/send_mail'),
            icon: const Icon(Icons.mail),
          ),
          IconButton(
            onPressed: () => Navigator.pushNamed(context, '/receive_mail'),
            icon: const Icon(Icons.mail_outline),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/send_mail'),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.green),
              ),
              child: const Text('보낸 메일함'),
            ),
            const SizedBox(
              height: 15.0,
            ),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/receive_mail'),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.red),
              ),
              child: const Text('받은 메일함'),
            ),
          ],
        ),
      ),
    );
  }
}
