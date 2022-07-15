import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ChangeWeb extends StatefulWidget {
  const ChangeWeb({Key? key}) : super(key: key);

  @override
  _ChangeWebState createState() => _ChangeWebState();
}

class _ChangeWebState extends State<ChangeWeb> {
  late Completer<WebViewController> controller;
  late bool isLoading;
  late String siteUri;

  @override
  void initState() {
    controller = Completer<WebViewController>();
    siteUri = 'https://google.com/';
    super.initState();
  }

  void reloadSite() {
    controller.future.then((value) => value.loadUrl(siteUri));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 53, 24, 24),
        toolbarHeight: 88.0,
        title: Center(
          child: Column(
            children: [
              const Text('WEBVIEW CHANGE'),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        setState(() {
                          siteUri = 'https://google.com/';
                        });

                        reloadSite();
                      },
                      child: Text('GOOGLE')),
                  SizedBox(
                    width: 20.0,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        setState(() {
                          siteUri = 'https://naver.com/';
                        });

                        reloadSite();
                      },
                      child: Text('NAVER')),
                  SizedBox(
                    width: 20.0,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        setState(() {
                          siteUri = 'https://yahoo.co.jp/';
                        });

                        reloadSite();
                      },
                      child: Text('YAHOO')),
                ],
              ),
            ],
          ),
        ),
      ),
      body: Stack(
        children: [
          //isLoading
          //? const Center(
          // child: CircularProgressIndicator(),
          // ):
          WebView(
            initialUrl: siteUri,
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
    );
  }
}
