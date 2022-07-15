import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
        title: Text('WEBVIEW'),
      ),
      body: Stack(
        children: [
          //isLoading
          //? const Center(
          // child: CircularProgressIndicator(),
          // ):
          WebView(
            initialUrl: 'http://localhost/info.php',
            javascriptMode: JavascriptMode.unrestricted,
            onWebViewCreated: (WebViewController webViewController) {
              controller.complete(webViewController);
            },
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
          ),
        ],
      ),
      floatingActionButton: FutureBuilder<WebViewController>(
        future: controller.future,
        builder:
            (BuildContext context, AsyncSnapshot<WebViewController> snapshot) {
          if (snapshot.hasData) {
            return FloatingActionButton(
              onPressed: () {
                snapshot.data!.goBack();
              },
              backgroundColor: Colors.redAccent,
              child: Icon(Icons.arrow_back_ios),
            );
          }

          return Stack();
        },
      ),
    );
  }
}
