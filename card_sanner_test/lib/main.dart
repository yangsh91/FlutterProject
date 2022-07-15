import 'dart:math';

import 'package:card_sanner_test/scan_option_configure_widget/scan_option_configure_widget.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import 'package:credit_card_scanner/credit_card_scanner.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  CardDetails? _cardDetails;
  String? _cardNumber;
  CardScanOptions scanOptions = CardScanOptions(
    scanCardHolderName: true,
    // enableDebugLogs: true,
    validCardsToScanBeforeFinishingScan: 5,
    possibleCardHolderNamePositions: [
      CardHolderNameScanPosition.aboveCardNumber,
    ],
  );

  Future<void> scanCard() async {
    var cardDetails = await CardScanner.scanCard(scanOptions: scanOptions);
    if (!mounted) return;
    setState(() {
      _cardDetails = cardDetails;
      _cardNumber = cardDetails!.cardNumber;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('card_scanner app'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              RaisedButton(
                onPressed: () async {
                  scanCard();
                },
                child: Text('scan card'),
              ),
              Text('${_cardNumber} !!'),
              Expanded(
                child: OptionConfigureWidget(
                  initialOptions: scanOptions,
                  onScanOptionChanged: (newOptions) => scanOptions = newOptions,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
