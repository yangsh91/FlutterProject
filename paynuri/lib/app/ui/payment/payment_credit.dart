import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:paynuri/app/controller/payment/payment_credit_controller.dart';
import 'package:paynuri/app/routes/app_pages.dart';

class PaymentCredit extends GetView<PaymentCreditController> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: Colors.grey.shade100,
        appBar: AppBar(
          title: const Text('카드결제'),
          centerTitle: true,
          automaticallyImplyLeading: true,
          backgroundColor: const Color.fromRGBO(22, 54, 105, 1),
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(10.0, 30.0, 10.0, 10.0),
          child: SingleChildScrollView(
            child: Obx(
              () => Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  /*
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.45,
                          height: 50.0,
                          decoration: BoxDecoration(
                            color: const Color.fromRGBO(22, 54, 105, 1),
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          alignment: Alignment.center,
                          // padding: const EdgeInsets.only(left: 5.0),
                          child: const Text(
                            'NFC',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 25.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 15.0,
                        ),
                        GestureDetector(
                          onTap: () => controller.scanCard(),
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.45,
                            height: 50.0,
                            decoration: BoxDecoration(
                              color: Colors.green.shade800,
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            alignment: Alignment.center,
                            // padding: const EdgeInsets.only(left: 10.0),
                            child: const Text(
                              '스캔',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 25.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  */
                  Container(
                    height: 210.0,
                    child: Column(
                      children: [
                        Container(
                          width: double.infinity,
                          height: 50.0,
                          padding: const EdgeInsets.only(left: 10.0),
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 3.0,
                              color: Colors.black38,
                            ),
                            borderRadius: BorderRadius.circular(3.0),
                          ),
                          alignment: Alignment.centerLeft,
                          child: const Text(
                            '결제 정보 입력',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 22.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          decoration: const BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                width: 3.0,
                                color: Colors.black38,
                              ),
                              left: BorderSide(
                                width: 3.0,
                                color: Colors.black38,
                              ),
                              right: BorderSide(
                                width: 3.0,
                                color: Colors.black38,
                              ),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(
                                20.0, 10.0, 20.0, 10.0),
                            child: Container(
                              child: Column(
                                children: [
                                  Container(
                                    width: double.infinity,
                                    height: 130.0,
                                    decoration: BoxDecoration(),
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            Container(
                                              width: 120.0,
                                              height: 30.0,
                                              alignment: Alignment.centerLeft,
                                              child: const Text(
                                                '판매자(가맹점)명',
                                                style: TextStyle(
                                                  fontSize: 15.0,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: Container(
                                                height: 30.0,
                                                alignment:
                                                    Alignment.centerRight,
                                                child: const Text(
                                                  '페이리누',
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 18.0,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 10.0,
                                        ),
                                        Row(
                                          children: [
                                            Container(
                                              width: 120.0,
                                              height: 30.0,
                                              alignment: Alignment.centerLeft,
                                              child: const Text(
                                                '판매제품명',
                                                style: TextStyle(
                                                  fontSize: 15.0,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: Container(
                                                height: 30.0,
                                                alignment:
                                                    Alignment.centerRight,
                                                child: Text(
                                                  '${controller.goods_name}',
                                                  style: const TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 18.0,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 10.0,
                                        ),
                                        Row(
                                          children: [
                                            Container(
                                              width: 120.0,
                                              height: 30.0,
                                              alignment: Alignment.centerLeft,
                                              child: const Text(
                                                '결제금액',
                                                style: TextStyle(
                                                  fontSize: 15.0,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: Container(
                                                height: 30.0,
                                                alignment: Alignment.centerLeft,
                                                child: TextField(
                                                  controller: controller.amt,
                                                  textAlign: TextAlign.right,
                                                  keyboardType:
                                                      TextInputType.number,
                                                  decoration:
                                                      const InputDecoration(
                                                          border:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: Color
                                                                  .fromRGBO(
                                                                      22,
                                                                      54,
                                                                      105,
                                                                      1),
                                                              width: 2.0,
                                                            ),
                                                          ),
                                                          enabledBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: Color
                                                                  .fromRGBO(
                                                                      22,
                                                                      54,
                                                                      105,
                                                                      1),
                                                              width: 2.0,
                                                            ),
                                                          ),
                                                          focusedBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color:
                                                                  Colors.amber,
                                                              width: 4.0,
                                                            ),
                                                          ),
                                                          hintText: '원',
                                                          hintStyle: TextStyle(
                                                            color:
                                                                Colors.black45,
                                                            fontSize: 13.0,
                                                          ),
                                                          contentPadding:
                                                              const EdgeInsets
                                                                      .fromLTRB(
                                                                  10.0,
                                                                  10.0,
                                                                  10.0,
                                                                  0)),
                                                  style: const TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                  textInputAction:
                                                      TextInputAction.done,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  /*
                  Container(
                    height: 245.0,
                    decoration: BoxDecoration(),
                    child: Column(
                      children: [
                        Container(
                          width: double.infinity,
                          height: 50.0,
                          padding: const EdgeInsets.only(left: 10.0),
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 3.0,
                              color: Colors.black38,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          alignment: Alignment.centerLeft,
                          child: const Text(
                            '고객 카드 정보',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 22.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            width: double.infinity,
                            decoration: const BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  width: 3.0,
                                  color: Colors.black38,
                                ),
                                left: BorderSide(
                                  width: 3.0,
                                  color: Colors.black38,
                                ),
                                right: BorderSide(
                                  width: 3.0,
                                  color: Colors.black38,
                                ),
                              ),
                              // borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(
                                  20.0, 10.0, 20.0, 10.0),
                              child: Container(
                                child: Column(
                                  children: [
                                    Container(
                                      width: double.infinity,
                                      height: 170.0,
                                      child: Column(
                                        children: [
                                          Row(
                                            children: [
                                              Container(
                                                width: 80.0,
                                                height: 30.0,
                                                alignment: Alignment.centerLeft,
                                                child: const Text(
                                                  '카드번호',
                                                  style: TextStyle(
                                                    fontSize: 15.0,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                child: Container(
                                                  height: 30.0,
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  child: TextField(
                                                    controller:
                                                        controller.cardNum,
                                                    textAlign: TextAlign.left,
                                                    decoration:
                                                        const InputDecoration(
                                                            border:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: Color
                                                                    .fromRGBO(
                                                                        22,
                                                                        54,
                                                                        105,
                                                                        1),
                                                                width: 2.0,
                                                              ),
                                                            ),
                                                            enabledBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: Color
                                                                    .fromRGBO(
                                                                        22,
                                                                        54,
                                                                        105,
                                                                        1),
                                                                width: 2.0,
                                                              ),
                                                            ),
                                                            focusedBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: Colors
                                                                    .amber,
                                                                width: 4.0,
                                                              ),
                                                            ),
                                                            hintText: '자동입력',
                                                            hintStyle:
                                                                TextStyle(
                                                              color: Colors
                                                                  .black45,
                                                            ),
                                                            contentPadding:
                                                                const EdgeInsets
                                                                        .fromLTRB(
                                                                    10.0,
                                                                    10.0,
                                                                    10.0,
                                                                    0)),
                                                    style: const TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 13.0,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                    textInputAction:
                                                        TextInputAction.next,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 10.0,
                                          ),
                                          Row(
                                            children: [
                                              Container(
                                                width: 80.0,
                                                height: 30.0,
                                                alignment: Alignment.centerLeft,
                                                child: const Text(
                                                  '유효기간',
                                                  style: TextStyle(
                                                    fontSize: 15.0,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                child: Container(
                                                  height: 30.0,
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  child: TextField(
                                                    controller:
                                                        controller.cardExp,
                                                    textAlign: TextAlign.left,
                                                    decoration:
                                                        const InputDecoration(
                                                      border:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: Color.fromRGBO(
                                                              22, 54, 105, 1),
                                                          width: 2.0,
                                                        ),
                                                      ),
                                                      enabledBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: Color.fromRGBO(
                                                              22, 54, 105, 1),
                                                          width: 2.0,
                                                        ),
                                                      ),
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: Colors.amber,
                                                          width: 4.0,
                                                        ),
                                                      ),
                                                      hintText: '자동입력',
                                                      hintStyle: TextStyle(
                                                        color: Colors.black45,
                                                      ),
                                                      contentPadding:
                                                          const EdgeInsets
                                                                  .fromLTRB(
                                                              10.0,
                                                              10.0,
                                                              10.0,
                                                              0),
                                                    ),
                                                    style: const TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 13.0,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                    textInputAction:
                                                        TextInputAction.next,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 10.0,
                                          ),
                                          Row(
                                            children: [
                                              Container(
                                                width: 80.0,
                                                height: 30.0,
                                                alignment: Alignment.centerLeft,
                                                child: const Text(
                                                  '생년월일',
                                                  style: TextStyle(
                                                    fontSize: 15.0,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                child: Container(
                                                  height: 30.0,
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  child: TextField(
                                                    controller:
                                                        controller.birth,
                                                    textAlign: TextAlign.left,
                                                    decoration:
                                                        const InputDecoration(
                                                      border:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: Color.fromRGBO(
                                                              22, 54, 105, 1),
                                                          width: 2.0,
                                                        ),
                                                      ),
                                                      enabledBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: Color.fromRGBO(
                                                              22, 54, 105, 1),
                                                          width: 2.0,
                                                        ),
                                                      ),
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: Colors.amber,
                                                          width: 4.0,
                                                        ),
                                                      ),
                                                      hintText:
                                                          '소유주생년월일(예 : 840801)',
                                                      hintStyle: TextStyle(
                                                        color: Colors.black45,
                                                      ),
                                                      contentPadding:
                                                          const EdgeInsets
                                                                  .fromLTRB(
                                                              10.0,
                                                              10.0,
                                                              10.0,
                                                              0),
                                                    ),
                                                    style: const TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 13.0,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                    textInputAction:
                                                        TextInputAction.next,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 10.0,
                                          ),
                                          Row(
                                            children: [
                                              Container(
                                                width: 80.0,
                                                height: 30.0,
                                                alignment: Alignment.centerLeft,
                                                child: const Text(
                                                  '비밀번호',
                                                  style: TextStyle(
                                                    fontSize: 15.0,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                child: Container(
                                                  height: 30.0,
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  child: TextField(
                                                    controller:
                                                        controller.password,
                                                    textAlign: TextAlign.left,
                                                    decoration:
                                                        const InputDecoration(
                                                            border:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: Color
                                                                    .fromRGBO(
                                                                        22,
                                                                        54,
                                                                        105,
                                                                        1),
                                                                width: 2.0,
                                                              ),
                                                            ),
                                                            enabledBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: Color
                                                                    .fromRGBO(
                                                                        22,
                                                                        54,
                                                                        105,
                                                                        1),
                                                                width: 2.0,
                                                              ),
                                                            ),
                                                            focusedBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: Colors
                                                                    .amber,
                                                                width: 4.0,
                                                              ),
                                                            ),
                                                            hintText:
                                                                '카드비밀번호앞 두자리',
                                                            hintStyle:
                                                                TextStyle(
                                                              fontSize: 13.0,
                                                              color: Colors
                                                                  .black45,
                                                            ),
                                                            contentPadding:
                                                                const EdgeInsets
                                                                        .fromLTRB(
                                                                    10.0,
                                                                    10.0,
                                                                    10.0,
                                                                    0)),
                                                    style: const TextStyle(
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                    textInputAction:
                                                        TextInputAction.done,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  */
                  Center(
                    child: GestureDetector(
                      onTap: () => _showModalBottomSheet(context),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.35,
                        height: 40.0,
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(22, 54, 105, 1),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        alignment: Alignment.center,
                        child: const Text(
                          '결제하기',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _showSnackBar(context, String text) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: const Color.fromRGBO(22, 54, 105, 1),
        content: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 15.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  void _showModalBottomSheet(BuildContext context) {
    if (controller.amt.text == "") {
      _showSnackBar(context, '결제금액을 입력해 주세요.');
      return;
    }

    showModalBottomSheet<void>(
      constraints: BoxConstraints.loose(
        Size(MediaQuery.of(context).size.width,
            MediaQuery.of(context).size.height * 0.9),
      ),
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) {
        return _bottomPaymentSheet(context);
      },
    );
  }

  Widget _bottomPaymentSheet(context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.4,
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30.0),
          topRight: Radius.circular(30.0),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10.0, 30.0, 10.0, 0),
        child: Column(
          children: [
            Center(
              child: Text(
                '결제방식',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(
              height: 30.0,
            ),
            Container(
              height: 80.0,
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () => _readyDialog(context),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Container(
                              margin: EdgeInsets.only(left: 15.0),
                              child: Image.asset(
                                'assets/images/nfc.png',
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 5.0,
                          ),
                          Container(
                            height: 20.0,
                            child: const Text(
                              'NFC',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10.0,
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () => controller.scanCard(),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Container(
                              child: Image.asset(
                                'assets/images/scan.png',
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 5.0,
                          ),
                          Container(
                            height: 20.0,
                            child: const Text(
                              '스캔결제',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10.0,
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () => Get.toNamed(Routes.payment_card, arguments: {
                        'amt': controller.amt.text,
                        'type': 'meet-payment'
                      }),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Container(
                              child: Image.asset(
                                'assets/images/mobile-payment.png',
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 5.0,
                          ),
                          Container(
                            height: 20.0,
                            child: const Text(
                              '수기결제',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10.0,
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () => Get.toNamed(
                        Routes.payment_request,
                        arguments: {'amt': controller.amt.text},
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Container(
                              child: Image.asset(
                                'assets/images/loan.png',
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 5.0,
                          ),
                          Container(
                            height: 20.0,
                            child: const Text(
                              '결제요청',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _readyDialog(BuildContext context) {
    showCupertinoDialog(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          // title: Text('접근불가'),
          content: const Text('준비중 입니다.'),
          actions: [
            CupertinoDialogAction(
              onPressed: () => Navigator.pop(context),
              isDefaultAction: true,
              child: const Text(
                '확인',
              ),
            ),
          ],
        );
      },
    );
  }

  void _showDialog(BuildContext context, String msg, @required int num) {
    showCupertinoDialog(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          // title: Text('접근불가'),
          content: Text(msg),
          actions: [
            CupertinoDialogAction(
              onPressed: () {},
              isDefaultAction: true,
              child: const Text('확인'),
            ),
            CupertinoDialogAction(
              onPressed: () => Navigator.pop(context),
              isDefaultAction: true,
              child: const Text(
                '취소',
                style: TextStyle(
                  color: Colors.red,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
