import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:paynuri/app/controller/payment/payment_request_controller.dart';

class PaymentRequest extends GetView<PaymentRequestController> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: Colors.grey.shade100,
        appBar: AppBar(
          title: const Text('URL 결제'),
          centerTitle: true,
          automaticallyImplyLeading: true,
          backgroundColor: const Color.fromRGBO(22, 54, 105, 1),
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(10.0, 30.0, 10.0, 10.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  height: 210.0,
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
                        decoration: BoxDecoration(
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
                          padding:
                              const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
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
                                              alignment: Alignment.centerRight,
                                              child: Text(
                                                '${controller.store_nm}',
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
                                              alignment: Alignment.centerLeft,
                                              child: TextField(
                                                // controller: controller.id_controller,
                                                textAlign: TextAlign.right,
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
                                                  hintText: '판매제품',
                                                  hintStyle: TextStyle(
                                                    color: Colors.black45,
                                                    fontSize: 13.0,
                                                  ),
                                                  contentPadding:
                                                      const EdgeInsets.fromLTRB(
                                                          10.0, 10.0, 10.0, 0),
                                                ),
                                                style: const TextStyle(
                                                  color: Colors.black,
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
                                                        hintText: '원',
                                                        hintStyle: TextStyle(
                                                          color: Colors.black45,
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
                                                    TextInputAction.next,
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
                          'URL 발송 대상 입력',
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
                          decoration: BoxDecoration(
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
                                                '고객명',
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
                                                  // controller: controller.id_controller,
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
                                                              color:
                                                                  Colors.amber,
                                                              width: 4.0,
                                                            ),
                                                          ),
                                                          hintText: '',
                                                          hintStyle: TextStyle(
                                                            color:
                                                                Colors.black45,
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
                                                '전화번호',
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
                                                  // controller: controller.id_controller,
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
                                                    hintText: '',
                                                    hintStyle: TextStyle(
                                                      color: Colors.black45,
                                                    ),
                                                    contentPadding:
                                                        const EdgeInsets
                                                                .fromLTRB(10.0,
                                                            10.0, 10.0, 0),
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
                                                '발송방식',
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
                                                  // controller: controller.id_controller,
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
                                                              color:
                                                                  Colors.amber,
                                                              width: 4.0,
                                                            ),
                                                          ),
                                                          hintText: '',
                                                          hintStyle: TextStyle(
                                                            color:
                                                                Colors.black45,
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
                                                '이메일',
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
                                                  // controller: controller.id_controller,
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
                                                              color:
                                                                  Colors.amber,
                                                              width: 4.0,
                                                            ),
                                                          ),
                                                          hintText: '',
                                                          hintStyle: TextStyle(
                                                            fontSize: 13.0,
                                                            color:
                                                                Colors.black45,
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
                                                      TextInputAction.next,
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
                  height: 30.0,
                ),
                Center(
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.35,
                    height: 40.0,
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(22, 54, 105, 1),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    alignment: Alignment.center,
                    child: const Text(
                      '발송하기',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
