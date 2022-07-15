import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:paynuri/app/controller/payment/payment_card_controller.dart';

class PaymentCard extends GetView<PaymentCardController> {
  const PaymentCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('카드결제(스캔/수기)'),
          centerTitle: true,
          automaticallyImplyLeading: true,
          backgroundColor: const Color.fromRGBO(22, 54, 105, 1),
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 0),
          child: Column(
            children: [
              Container(
                height: 70.0,
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(22, 54, 105, 1),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 100.0,
                      padding: const EdgeInsets.only(left: 10.0),
                      child: const Text(
                        '결제금액',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 26.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        alignment: Alignment.centerRight,
                        padding: const EdgeInsets.fromLTRB(0, 0, 10.0, 5.0),
                        child: Text(
                          '${controller.amt.value}',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 28.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(right: 10.0),
                      child: const Text(
                        '원',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 26.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Container(
                height: controller.boxHeight.value,
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
                          color: Color.fromRGBO(22, 54, 105, 1),
                        ),
                        borderRadius: BorderRadius.circular(5.0),
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
                              color: Color.fromRGBO(22, 54, 105, 1),
                            ),
                            left: BorderSide(
                              width: 3.0,
                              color: Color.fromRGBO(22, 54, 105, 1),
                            ),
                            right: BorderSide(
                              width: 3.0,
                              color: Color.fromRGBO(22, 54, 105, 1),
                            ),
                          ),
                          // borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Padding(
                          padding:
                              const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                          child: Container(
                            child: Column(
                              children: [
                                Container(
                                  width: double.infinity,
                                  height: controller.cardInfoHeight.value,
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
                                              alignment: Alignment.centerLeft,
                                              child: TextField(
                                                controller: controller.cardNum,
                                                textAlign: TextAlign.left,
                                                decoration:
                                                    const InputDecoration(
                                                        border:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color:
                                                                Color.fromRGBO(
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
                                                            color:
                                                                Color.fromRGBO(
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
                                                                0)),
                                                style: const TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 13.0,
                                                  fontWeight: FontWeight.bold,
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
                                              alignment: Alignment.centerLeft,
                                              child: TextField(
                                                controller: controller.cardExp,
                                                textAlign: TextAlign.left,
                                                decoration:
                                                    const InputDecoration(
                                                  border: OutlineInputBorder(
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
                                                      const EdgeInsets.fromLTRB(
                                                          10.0, 10.0, 10.0, 0),
                                                ),
                                                style: const TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 13.0,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                                textInputAction:
                                                    TextInputAction.next,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Visibility(
                                        visible: controller.isVisible.value,
                                        child: Column(
                                          children: [
                                            const SizedBox(
                                              height: 10.0,
                                            ),
                                            Row(
                                              children: [
                                                Container(
                                                  width: 80.0,
                                                  height: 30.0,
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  child: const Text(
                                                    '생년월일',
                                                    style: TextStyle(
                                                      fontSize: 15.0,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Container(
                                                    height: 30.0,
                                                    alignment:
                                                        Alignment.centerLeft,
                                                    child: TextField(
                                                      // controller: controller.birth,
                                                      textAlign: TextAlign.left,
                                                      decoration:
                                                          const InputDecoration(
                                                        border:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color:
                                                                Color.fromRGBO(
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
                                                            color:
                                                                Color.fromRGBO(
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
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  child: const Text(
                                                    '비밀번호',
                                                    style: TextStyle(
                                                      fontSize: 15.0,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Container(
                                                    height: 30.0,
                                                    alignment:
                                                        Alignment.centerLeft,
                                                    child: TextField(
                                                      // controller: controller.password,
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
              Center(
                child: GestureDetector(
                  // onTap: () => _showModalBottomSheet(context),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.35,
                    height: 40.0,
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(22, 54, 105, 1),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    alignment: Alignment.center,
                    child: const Text(
                      '결제',
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
    );
  }
}
