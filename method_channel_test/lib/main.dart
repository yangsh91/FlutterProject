import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Method Channel Test',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static const MethodChannel _channel =
      const MethodChannel('com.example.method_channel_test');

  String _platformVersion = 'Unknown';

  Future<String> getPlatformVersion() async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Method Channel Test'),
      ),
      body: Center(
        child: Column(
          children: [
            TextButton(
              onPressed: () async {
                String result = await getPlatformVersion();
                setState(() {
                  _platformVersion = result;
                });
              },
              child: Text('Get Platform Version'),
            ),
            Text(_platformVersion),
          ],
        ),
      ),
    );
  }
}
