import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Test extends StatefulWidget {
  const Test({Key? key}) : super(key: key);

  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
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

    // controller.future.then((value) {
    //  value.loadUrl(siteUri);
    // })
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 90.0,
        backgroundColor: Colors.amber,
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
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.red),
                      ),
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
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.green),
                      ),
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
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.blueAccent),
                      ),
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
