import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Guides extends StatefulWidget {
  const Guides({Key? key}) : super(key: key);

  @override
  _GuidesState createState() => _GuidesState();
}

class _GuidesState extends State<Guides> {
  late Completer<WebViewController> controller;
  late bool isLoading; // for CircularIndicator

  @override
  void initState() {
    controller = Completer<WebViewController>();
    isLoading = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('이용 가이드'),
        centerTitle: true,
        backgroundColor: const Color.fromRGBO(22, 54, 105, 1),
      ),
      body: Stack(
        children: [
          WebView(
            initialUrl: 'https://paynuri.com',
            javascriptMode: JavascriptMode.unrestricted,
            onWebViewCreated: (WebViewController webViewController) {
              controller.complete(webViewController);
            },
            /*
            onPageStarted: (start) {
              setState(() {
                isLoading = true;
              });
            },
            onPageFinished: (finish) {
              setState(() {
                isLoading = false;
              });
            },
            */
          ),
        ],
      ),
    );
  }
}
