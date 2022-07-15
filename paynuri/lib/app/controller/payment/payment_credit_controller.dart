import 'package:credit_card_scanner/credit_card_scanner.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:paynuri/app/routes/app_pages.dart';

class PaymentCreditController extends GetxController {
  var card_num = ''.obs;
  var card_exp = ''.obs;
  RxString goods_name = '테스트 상품'.obs;
  late TextEditingController goodsNm, amt, cardNum, cardExp, birth, password;

  CardDetails? _cardDetails;
  CardScanOptions scanOptions = CardScanOptions(
    scanCardHolderName: true,
    // enableDebugLogs: true,
    validCardsToScanBeforeFinishingScan: 5,
    possibleCardHolderNamePositions: [
      CardHolderNameScanPosition.aboveCardNumber,
    ],
  );

  @override
  void onInit() {
    super.onInit();

    goodsNm = TextEditingController();
    amt = TextEditingController();
    cardNum = TextEditingController();
    cardExp = TextEditingController();
    birth = TextEditingController();
    password = TextEditingController();
  }

  Future<void> scanCard() async {
    var cardDetails = await CardScanner.scanCard(scanOptions: scanOptions);
    //if (!mounted) return;
    // setState(() {
    //   _cardDetails = cardDetails;
    //   _cardNumber = cardDetails!.cardNumber;
    // });
    //card_num.value = cardDetails!.cardNumber;
    //card_exp.value = cardDetails!.expiryDate;
    //setChange();
    String totAmt = amt.text;
    Get.toNamed(Routes.payment_card, arguments: {
      'cardNum': cardDetails!.cardNumber,
      'cardExp': cardDetails.expiryDate,
      'amt': totAmt,
      'type': 'scan',
    });
  }

  void setChange() {
    cardNum.text = card_num.toString();
    cardExp.text = card_exp.toString();
  }
}
